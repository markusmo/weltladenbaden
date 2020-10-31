# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib import admin
from django.utils.translation import ugettext_lazy as _
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
                              WeltladenProduct, WeltladenCustomer)


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

__all__ = ['customer']


@admin.register(WeltladenProduct)
class WeltladenProductAdmin(InvalidateProductCacheMixin, SortableAdminMixin, TranslatableAdmin, CMSPageAsCategoryMixin, UnitPriceMixin, admin.ModelAdmin):
    fieldsets = [
        (None, {
            'fields': [
                ('product_name', 'slug'),
                ('product_code'),
                ('unit_price', 'tax_switch'),
                'active',
            ],
        }),
        (_("Translatable Fields"), {
            'fields': ['caption', 'short_description', 'description'],
        }),
        (_("Manufacturer and Supplier"), {
            'fields': ['manufacturer', 'additional_manufacturers', 'display_manufacturer_as_raw_material_supplier'
                       'supplier', 'origin_countries'],
        }),
        (_("Properties"), {
            'fields': ['quality_labels', 'vegan', 'lactose_free', 'gluten_free'],
        }),
        (_("Ingredients"), {
            'classes': ['collapse'],
            'fields': ['ingredients'],
        }),
    ]
    inlines = [ProductImageInline]
    prepopulated_fields = {'slug': ['product_name']}
    list_display = ['product_name', 'product_code', 'get_unit_price', 'active']
    search_fields = ['product_name']
    filter_horizontal = ['quality_labels', 'additional_manufacturers']
    list_filter = [TaxSwitchFilter, ]
