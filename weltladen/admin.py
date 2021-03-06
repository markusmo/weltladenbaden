# -*- coding: utf-8 -*-
from __future__ import unicode_literals

import csv
import re
from django.contrib import admin
from django.http.response import HttpResponse
from django.utils.translation import ugettext_lazy as _
from django.contrib.sites.shortcuts import get_current_site
from parler.admin import TranslatableAdmin
from filer.models import ThumbnailOption
from shop.admin.defaults import customer
from shop.admin.defaults.order import OrderAdmin
from shop.models.defaults.order import Order
from shop.admin.delivery import DeliveryOrderAdminMixin
from shop_sendcloud.admin import SendCloudOrderAdminMixin
from adminsortable2.admin import SortableAdminMixin
from shop.admin.product import (CMSPageAsCategoryMixin, UnitPriceMixin,
                                ProductImageInline, InvalidateProductCacheMixin,
                                SearchProductIndexMixin)
from weltladen.models import (Manufacturer, Supplier, QualityLabel,
                              WeltladenProduct, InstagramCategory)


class BooleanDefaultNoFilter(admin.SimpleListFilter):
    def lookups(self, request, model_admin):
        return (
            ('all', _('All')),
            # xgettext:no-python-format
            (1, _('20% sales tax')),
            # xgettext:no-python-format
            (2, _('10% sales Tax'))
        )

    def choices(self, changelist):
        for lookup, title in self.lookup_choices:
            yield {
                'selected': self.value() == (str(lookup) if lookup else lookup),
                'query_string': changelist.get_query_string({self.parameter_name: lookup}, []),
                'display': title,
            }

    def queryset(self, request, queryset):
        if self.value() is None:
            return queryset
        else:
            v = self.value()
            if self.value() == '2':
                return queryset.filter(**{self.parameter_name: False})
            elif self.value() == '1':
                return queryset.filter(**{self.parameter_name: self.value()})


class TaxSwitchFilter(BooleanDefaultNoFilter):
    title = _('Sales Tax')
    parameter_name = 'tax_switch'


admin.site.site_header = "Weltladen Administration"
admin.site.unregister(ThumbnailOption)


@admin.register(Order)
class OrderAdmin(DeliveryOrderAdminMixin, SendCloudOrderAdminMixin, OrderAdmin):
    pass


admin.site.register(Manufacturer, admin.ModelAdmin)
admin.site.register(Supplier, admin.ModelAdmin)
admin.site.register(QualityLabel, admin.ModelAdmin)
admin.site.register(InstagramCategory, admin.ModelAdmin)

__all__ = ['customer']


@admin.register(WeltladenProduct)
class WeltladenProductAdmin(InvalidateProductCacheMixin, SortableAdminMixin, TranslatableAdmin, CMSPageAsCategoryMixin, UnitPriceMixin, SearchProductIndexMixin, admin.ModelAdmin):
    '''
     # selbstabholung anderer text in mail
    #TODO: 
    # pro.get_absolute_url()
    '''
    fieldsets = [
        (None, {
            'fields': [
                ('product_name', 'slug'),
                ('product_code'),
                ('unit_price', 'tax_switch', 'weight'),
                'active',
            ],
        }),
        (_("Translatable Fields"), {
            'fields': ['caption', 'short_description', 'description'],
        }),
        (_("Manufacturer and Supplier"), {
            'fields': ['manufacturer', 'additional_manufacturers', 'display_manufacturer_as_raw_material_supplier',
                       'supplier', 'origin_countries'],
        }),
        (_("Properties"), {
            'fields': ['quality_labels', 'vegan', 'lactose_free', 'gluten_free'],
        }),
        (_("Ingredients"), {
            'classes': ['collapse'],
            'fields': ['ingredients'],
        }),
        (_("Instagram"), {
            'classes': ['collapse'],
            'fields': ['instagram_category'],
        }),
    ]
    inlines = [ProductImageInline]
    prepopulated_fields = {'slug': ['product_name']}
    list_display = ['product_name', 'product_code', 'get_unit_price', 'active']
    search_fields = ['product_name']
    filter_horizontal = ['quality_labels', 'additional_manufacturers']
    list_filter = [TaxSwitchFilter, ]
    actions = ['export_instagram_products']
    

    def export_instagram_products(self, request, queryset):
        '''
        Exports data for instagram posts
        for fields see: https://business.facebook.com/business/help/120325381656392?id=725943027705960
        '''
        short_description = _('Export products for Instragram')
        cleanr = re.compile('<.*?>')
        insta_fields =[
            'id', 'title', 'description', 'availability', 'condition', 'price', 'link', 'image_link', 'brand', 'google_product_category']
        response = HttpResponse(content_type='text/csv')
        response['Content-Disposition'] = 'attachment; filename=products_instagram.csv'
        response.write(u'\ufeff'.encode('utf8'))
        writer = csv.writer(response)
        site_url = request.scheme + '://' + get_current_site(request).domain
        writer.writerow([insta for insta in insta_fields ])
        if queryset == None:
            queryset = WeltladenProduct.objects.all()
        for p in queryset.filter(active=True):
            row = []
            row.append(p.pk) #id
            row.append(p.product_name) #title
            row.append(re.sub(cleanr, '', p.description)) #description
            row.append('in stock' if p.active else 'out of stock') #availability
            row.append('new') #condition
            row.append(str(p.unit_price)) #price 
            row.append(site_url+p.get_absolute_url()) #url
            if p.images.first(): #image
                row.append(site_url+p.images.first().url)
            else:
                row.append('')
            row.append(p.supplier) #brand
            if p.instagram_category:
                row.append(p.instagram_category.taxonomy_number) #google_product_category
            else:
                row.append('')
            row = writer.writerow(row)
        return response
