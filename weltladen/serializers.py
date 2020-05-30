# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.utils.safestring import mark_safe
from rest_framework import serializers
from shop.serializers.bases import ProductSerializer
from weltladen.models import WeltladenProduct

class ProductDetailSerializer(ProductSerializer):
    class Meta(ProductSerializer.Meta):
        model = WeltladenProduct
        fields = ['product_name', 'slug', 'unit_price', 'manufacturer', 'vegan',
                  'supplier', 'country_of_origin', 'product_code']


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
