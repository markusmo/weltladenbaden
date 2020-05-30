# -*- coding: utf-8 -*-
"""
These serializers are used exclusively to import the file ``workdir/fixtures/products-meta.json``.
They are not intended for general purpose and can be deleted thereafter.
"""
from __future__ import unicode_literals
from rest_framework import serializers
from shop.serializers.catalog import CMSPagesField, ImagesField, ValueRelatedField
from weltladen.models import SmartCard, Manufacturer, ProductPage, ProductImage
from .translation import TranslatedFieldsField, TranslatedField, TranslatableModelSerializerMixin


class ProductSerializer(serializers.ModelSerializer):
    product_model = serializers.CharField(read_only=True)
    manufacturer = ValueRelatedField(model=Manufacturer)
    images = ImagesField()
    caption = TranslatedField()
    cms_pages = CMSPagesField()

    class Meta:
        exclude = ['id', 'polymorphic_ctype', 'updated_at']

    def create(self, validated_data):
        cms_pages = validated_data.pop('cms_pages')
        images = validated_data.pop('images')
        product = super().create(validated_data)
        for page in cms_pages:
            ProductPage.objects.create(product=product, page=page)
        for image in images:
            ProductImage.objects.create(product=product, image=image)
        return product


class SmartCardSerializer(TranslatableModelSerializerMixin, ProductSerializer):
    description = TranslatedField()

    class Meta(ProductSerializer.Meta):
        model = SmartCard
