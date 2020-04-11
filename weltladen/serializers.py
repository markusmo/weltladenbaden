# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.utils.safestring import mark_safe
from rest_framework import serializers
from shop.search.serializers import ProductSearchSerializer as BaseProductSearchSerializer
from shop.serializers.bases import ProductSerializer
from weltladen.search_indexes import myshop_search_index_classes


class ProductDetailSerializer(ProductSerializer):
    class Meta(ProductSerializer.Meta):
        fields = ['product_name', 'slug', 'unit_price', 'vegan', 'supplier',
                  'manufacturer', 'country_of_origin', 'product_code']

    def create(self, request, *args, **kwargs):
        """
        Create a new item in the cart.
        """
        import pdb; pdb.set_trace()
        context = self.get_serializer_context()
        item_serializer = self.item_serializer_class(context=context, data=request.data, label=self.serializer_label)
        item_serializer.is_valid(raise_exception=True)
        self.perform_create(item_serializer)
        headers = self.get_success_headers(item_serializer.data)
        return Response(item_serializer.data, status=status.HTTP_201_CREATED, headers=headers)


class ProductSearchSerializer(BaseProductSearchSerializer):
    """
    Serializer to search over all products in this shop
    """
    media = serializers.SerializerMethodField()

    class Meta(BaseProductSearchSerializer.Meta):
        fields = BaseProductSearchSerializer.Meta.fields + ['media', 'caption']
        field_aliases = {'q': 'text'}
        search_fields = ['text']
        index_classes = myshop_search_index_classes

    def get_media(self, search_result):
        return mark_safe(search_result.search_media)


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
