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
                                ProductImageInline, InvalidateProductCacheMixin)
from weltladen.models import (Manufacturer, Supplier, BioQualityLabel,
                              WeltladenProduct, WeltladenCustomer)


admin.site.site_header = "Weltladen Administration"
admin.site.unregister(ThumbnailOption)


@admin.register(Order)
class OrderAdmin(DeliveryOrderAdminMixin, SendCloudOrderAdminMixin, OrderAdmin):
    pass


admin.site.register(Manufacturer, admin.ModelAdmin)
admin.site.register(Supplier, admin.ModelAdmin)
admin.site.register(BioQualityLabel, admin.ModelAdmin)

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
            'fields': ['caption', 'short_description' ,'description'],
        }),
        (_("Properties"), {
            'fields': ['bio_quality_label', 'fairtrade','manufacturer', 'additional_manufacturers',
                       'supplier', 'origin_countries', 'vegan', 'lactose_free', 'gluten_free'],
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
