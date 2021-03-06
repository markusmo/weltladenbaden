# -*- coding: utf-8 -*-
from __future__ import unicode_literals

import hashlib
from datetime import date, datetime, timedelta

from cms.models.pagemodel import Page
from django.apps import apps
from django.core.cache import cache
from django.core.exceptions import ValidationError
from django.db import models
from django.db.models.signals import post_save
from django.dispatch import receiver
from django.template.loader import select_template
from django.utils.crypto import get_random_string
from django.utils.translation import ugettext_lazy as _
from django_countries.fields import CountryField
from djangocms_text_ckeditor.fields import HTMLField
from filer.fields import image
from parler.fields import TranslatedField
from parler.managers import TranslatableManager, TranslatableQuerySet
from parler.models import TranslatableModelMixin, TranslatedFieldsModel
from phonenumber_field.modelfields import PhoneNumberField
from polymorphic.query import PolymorphicQuerySet
from shop.conf import app_settings
#from shop.models.defaults.address import BillingAddress, ShippingAddress
from shop.models.customer import BaseCustomer
from shop.models.defaults.cart import Cart
from shop.models.defaults.cart_item import CartItem
from shop.models.defaults.delivery import Delivery
from shop.models.defaults.delivery_item import DeliveryItem
from shop.models.defaults.mapping import ProductImage, ProductPage
from shop.models.defaults.order import Order
from shop.models.order import BaseOrderItem
from shop.models.product import BaseProduct, BaseProductManager, CMSPageReferenceMixin
from shop.money.fields import MoneyField
from shop_sendcloud.models.address import BillingAddress, ShippingAddress

__all__ = ['Cart', 'CartItem', 'Order', 'Delivery', 'DeliveryItem',
           'BillingAddress', 'ShippingAddress']


def get_activation_key(username):
    chars = 'abcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*(-_=+)'
    secret_key = get_random_string(20, chars)
    return hashlib.sha256((secret_key + username).encode('utf-8')).hexdigest()

def get_default_expiration_date():
    return (datetime.now() + timedelta(days=3)).date()
class WeltladenCustomer(BaseCustomer):
    SALUTATION = [('mrs', _("Mrs.")), ('mr', _("Mr.")), ('na', _("(n/a)"))]

    number = models.PositiveIntegerField(
        _('Customer Number'),
        null=True,
        default=None,
        unique=True,
    )

    phonenumber = PhoneNumberField(
        _('Phone number'),
        null=True,
        blank=True,
    )

    salutation = models.CharField(
        _('Salutation'),
        max_length=5,
        choices=SALUTATION,
    )

    @property
    def phone_number(self):
        return self.phonenumber

    @classmethod
    def reorder_form_fields(self, field_order):
        field_order.insert(0, 'salutation')
        field_order.append('phone_number')
        return field_order

    def get_number(self):
        return self.number

    def get_or_assign_number(self):
        if self.number is None:
            aggr = WeltladenCustomer.objects.filter(number__isnull=False).aggregate(models.Max('number'))
            self.number = (aggr['number__max'] or 0) + 1
            self.save()
        return self.get_number()

    def as_text(self):
        template_names = [
            '{}/customer.txt'.format(app_settings.APP_LABEL),
            'shop/customer.txt',
        ]
        template = select_template(template_names)
        return template.render({'customer': self})


class Activation(models.Model):
    customer = models.OneToOneField(
        WeltladenCustomer,
        on_delete=models.CASCADE,
    )

    activation_key = models.CharField(
        _('Activation Key'),
        max_length=64
    )

    activation_key_expires = models.DateField(
        _('Activation Key Expiration'),
        default=get_default_expiration_date()
    )

    def set_new_activation_key(self):
        self.activation_key_expires = (datetime.now() + timedelta(days=3)).date()
        self.activation_key = get_activation_key(self.customer.email)

    def verify(self):
        if (date.today() - self.activation_key_expires) > timedelta(days=3):
            return False
        return True


class OrderItem(BaseOrderItem):
    quantity = models.PositiveIntegerField(_("Ordered quantity"))
    canceled = models.BooleanField(_("Item canceled "), default=False)


class Manufacturer(models.Model):
    name = models.CharField(
        _("Name"),
        max_length=50,
        unique=True,
    )

    class Meta:
        ordering = ('name',)
        verbose_name = _("Manufacturer")
        verbose_name_plural = _("Manufacturers")

    def __str__(self):
        return self.name


class Supplier(models.Model):
    name = models.CharField(
        _("Supplier"),
        max_length=150,
        unique=True
    )

    class Meta:
        ordering = ('name',)
        verbose_name = _("Supplier")
        verbose_name_plural = _("Suppliers")

    def __str__(self):
        return self.name


class QualityLabel(models.Model):

    ordering = models.PositiveIntegerField(
        _("Ordering"),
        default=10
    )

    name = models.CharField(
        _("Quality Label"),
        max_length=150,
        unique=True
    )

    logo = image.FilerImageField(
        on_delete=models.CASCADE
    )

    class Meta:
        verbose_name = _("Quality label")
        verbose_name_plural = _("Quality lables")

    def __str__(self):
        return self.name

class InstagramCategory(models.Model):
    taxonomy_number = models.PositiveIntegerField(
        _("Taxonomy number"),
        help_text=_("See https://www.google.com/basepages/producttype/taxonomy-with-ids.en-US.txt for further information")
    )

    taxonomy_name = models.CharField(
        _("Taxonomy name"),
        max_length=255,
        unique=True
    )

    cms_page = models.ForeignKey(
        Page,
        limit_choices_to={'publisher_is_draft': False},
        on_delete=models.CASCADE,
    )

    def __str__(self):
        return self.taxonomy_name

    class Meta:
        verbose_name=_("Instagram category")
        verbose_name_plural=("Instagram categories")

class ProductQuerySet(TranslatableQuerySet, PolymorphicQuerySet):
    pass


class ProductManager(BaseProductManager, TranslatableManager):
    queryset_class = ProductQuerySet

    def get_queryset(self):
        qs = self.queryset_class(self.model, using=self._db)
        return qs.prefetch_related('translations')


class WeltladenProduct(CMSPageReferenceMixin, TranslatableModelMixin, BaseProduct):
    product_name = models.CharField(
        max_length=255,
        verbose_name=_("Product Name"),
    )

    slug = models.SlugField(verbose_name=_("Slug"))

    caption = TranslatedField()
    short_description = TranslatedField()
    description = TranslatedField()
    ingredients = TranslatedField()

    # product properties
    manufacturer = models.ForeignKey(
        Manufacturer,
        on_delete=models.CASCADE,
        verbose_name=_("Manufacturer"),
        blank=True,
        null=True,
    )

    additional_manufacturers = models.ManyToManyField(
        Manufacturer,
        blank=True,
        verbose_name=_("Additional Manufacturers"),
        related_name="additional_manufacturers",
    )

    display_manufacturer_as_raw_material_supplier = models.BooleanField(
        _("Display manufacturer as raw material supplier"),
        default=False
    )

    supplier = models.ForeignKey(
        Supplier,
        verbose_name=_("Supplier"),
        on_delete=models.CASCADE
    )

    quality_labels = models.ManyToManyField(
        QualityLabel,
        blank=True,
        verbose_name=_("Quality labels"),
        related_name="quality_labels"
    )

    origin_countries = CountryField(
        verbose_name=_("Origin countries"),
        blank_label=_('Select one or many'),
        multiple=True,
        blank=True,
    )

    # controlling the catalog
    order = models.PositiveIntegerField(
        _("Sort by"),
        db_index=True,
    )

    cms_pages = models.ManyToManyField(
        'cms.Page',
        through=ProductPage,
        help_text=_("Choose list view this product shall appear on."),
    )

    images = models.ManyToManyField(
        'filer.Image',
        through=ProductImage,
    )

    unit_price = MoneyField(
        _("Unit price"),
        decimal_places=3,
        help_text=_("Gross price for this product"),
    )

    vegan = models.BooleanField(
        _("Vegan"),
        default=False
    )

    lactose_free = models.BooleanField(
        _("Lactose free"),
        default=False
    )

    gluten_free = models.BooleanField(
        _("Gluten free"),
        default=False
    )

    tax_switch = models.BooleanField(
        _("Switch Tax"),
        default=True,
        help_text=_("If switched on, then 20% tax item, if off then 10% tax item")
    )

    product_code = models.CharField(
        _("Product code"),
        max_length=255,
        unique=True,
    )

    instagram_category = models.ForeignKey(
        InstagramCategory,
        on_delete=models.CASCADE,
        null=True,
        blank=True
    )

    weight = models.DecimalField(
        _("Weight"),
        help_text=_("Weight in kilograms (kg). max 99.99kg"),
        decimal_places=2,
        max_digits=4,
        default=0.0
    )

    class Meta:
        verbose_name = _("Product")
        verbose_name_plural = _("Products")
        ordering = ['order']

    # filter expression used to lookup for a product item using the Select2 widget
    lookup_fields = ['product_code__startswith', 'product_name__icontains']

    def get_price(self, request):
        return self.unit_price

    objects = ProductManager()

    def __str__(self):
        return self.product_name

    @property
    def ordered_quality_labels(self):
        return self.quality_labels.all().order_by('ordering')

    @property
    def sample_image(self):
        return self.images.first()

    def get_weight(self):
        return self.weight

    def invalidate_cache(self):
        """
        Method ``ProductCommonSerializer.render_html()`` caches the rendered HTML snippets.
        Invalidate this HTML snippet after changing relevant parts of the product.
        """
        shop_app = apps.get_app_config('shop')
        if shop_app.cache_supporting_wildcard:
            cache.delete('product:{}|*'.format(self.id))
    
    def clean_fields(self, exclude=None):
        super().clean_fields(exclude=exclude)
        if WeltladenProduct.objects.filter(slug=self.slug).exclude(id=self.id).exists():
            raise ValidationError(_('Product slug already exits'), code='invalid')

#save instagram category according to its product page automatically
@receiver(post_save, sender=ProductPage)
def weltadenproduct_post_save_receiver(sender, instance, **kwargs):
    print('it works')
    instagram_category = instance.page.instagramcategory_set.first()
    if instagram_category:
        instagram_category.weltladenproduct_set.add(instance.product)
        instagram_category.save()

class WeltladenProductTranslation(TranslatedFieldsModel):
    master = models.ForeignKey(
        WeltladenProduct,
        on_delete=models.CASCADE,
        related_name='translations',
        null=True,
    )

    caption = HTMLField(
        verbose_name=_("Caption"),
        configuration='CKEDITOR_SETTINGS_CAPTION',
        help_text=_(
            "Short description used in the catalog's list view of products."),
    )

    short_description = HTMLField(
        verbose_name=_("Short Description"),
        configuration='CKEDITOR_SETTINGS_DESCRIPTION',
        help_text=_(
            "A short description as an overview for customers."),
    )

    description = HTMLField(
        verbose_name=_("Description"),
        configuration='CKEDITOR_SETTINGS_DESCRIPTION',
        help_text=_(
            "Full description used in the catalog's detail view of Products."),
    )

    ingredients = HTMLField(
        verbose_name=_("Ingredients"),
        configuration='CKEDITOR_SETTINGS_DESCRIPTION',
        help_text=_("What it contains."),
        null=True,
        blank=True,
    )

    class Meta:
        unique_together = [('language_code', 'master')]


class Locations(models.Model):
    zip_code = models.CharField(
        _("ZIP / Postal code"),
        max_length=12,
    )

    city = models.CharField(
        _("City"),
        max_length=1024,
    )

    country = models.CharField(
        _("Country"),
        max_length=25
    )

    distance = models.PositiveIntegerField(
        _("Distance to Baden")
    )

    class Meta:
        verbose_name = _("Location")
        verbose_name_plural = _("Locations")