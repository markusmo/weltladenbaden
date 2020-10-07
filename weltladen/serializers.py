# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.utils.safestring import mark_safe
from rest_framework import serializers
from django_countries.serializer_fields import CountryField
from shop.serializers.bases import ProductSerializer
from weltladen.models import WeltladenProduct


class ProductDetailSerializer(ProductSerializer):
    origin_countries = CountryField()

    class Meta(ProductSerializer.Meta):
        model = WeltladenProduct
        fields = ['product_name', 'slug', 'unit_price', 'manufacturer', 'vegan',
                  'supplier', 'origin_countries', 'product_code']


'''
class CatalogSearchSerializer(BaseProductSearchSerializer):
    """
    Serializer to restrict products in the catalog
    """
    media = serializers.SerializerMethodField()

    class Meta(BaseProductSearchSerializer.Meta):
        fields = BaseProductSearchSerializer.Meta.fields + ['media', 'caption']
        field_aliases = {'q': 'autocomplete'}
        search_fields = ['autocomplete']
        index_classes = myshop_search_index_classes

    def get_media(self, search_result):
        return mark_safe(search_result.catalog_media)
'''
