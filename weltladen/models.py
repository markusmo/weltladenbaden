# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.core.validators import MinValueValidator
from django.db import models
from django.utils.translation import ugettext_lazy as _
from django.utils.encoding import python_2_unicode_compatible
from django.template.loader import select_template
from djangocms_text_ckeditor.fields import HTMLField
from polymorphic.query import PolymorphicQuerySet
from parler.managers import TranslatableManager, TranslatableQuerySet
from parler.models import TranslatableModelMixin, TranslatedFieldsModel
from parler.fields import TranslatedField
from phonenumber_field.modelfields import PhoneNumberField
from shop.money.fields import MoneyField
from shop.models.product import BaseProduct, BaseProductManager, CMSPageReferenceMixin
from shop.models.defaults.cart import Cart
from shop.models.defaults.cart_item import CartItem
from shop.models.order import BaseOrderItem
from shop.models.address import CountryField
from shop.models.defaults.delivery import Delivery
from shop.models.defaults.delivery_item import DeliveryItem
from shop.models.defaults.order import Order
from shop.models.defaults.mapping import ProductPage, ProductImage
from shop.models.defaults.address import BillingAddress, ShippingAddress
from shop.models.customer import BaseCustomer
from shop.conf import app_settings
#from shop.models.defaults.customer import Customer


__all__ = ['Cart', 'CartItem', 'Order', 'Delivery', 'DeliveryItem',
           'BillingAddress', 'ShippingAddress', ]#'Customer', ]


class WeltladenCustomer(BaseCustomer):
    SALUTATION = [('mrs', _("Mrs.")), ('mr', _("Mr.")), ('na', _("(n/a)"))]

    number = models.PositiveIntegerField(
        _("Customer Number"),
        null=True,
        default=None,
        unique=True,
    )

    phonenumber = PhoneNumberField(
        _("Phone number"),
        null=True,
        blank=True,
    )

    salutation = models.CharField(
        _("Salutation"),
        max_length=5,
        choices=SALUTATION,
    )

    def get_number(self):
        return self.number

    def get_or_assign_number(self):
        if self.number is None:
            aggr = Customer.objects.filter(number__isnull=False).aggregate(models.Max('number'))
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


class OrderItem(BaseOrderItem):
    quantity = models.PositiveIntegerField(_("Ordered quantity"))
    canceled = models.BooleanField(_("Item canceled "), default=False)


@python_2_unicode_compatible
class Manufacturer(models.Model):
    name = models.CharField(
        _("Name"),
        max_length=50,
        unique=True,
    )

    def __str__(self):
        return self.name


class CountryQuerySet(TranslatableQuerySet):
    pass


class CountryManager(TranslatableManager):
    queryset_class=CountryQuerySet

    def get_queryset(self):
        qs = self.queryset_class(self.model, using=self._db)
        return qs.prefetch_related('translations')


@python_2_unicode_compatible
class Country(TranslatableModelMixin, models.Model):
    name = TranslatedField()

    objects = CountryManager()

    def __str__(self):
        return self.name


class CountryTranslation(TranslatedFieldsModel):
    master = models.ForeignKey(
        Country,
        on_delete=models.CASCADE,
        related_name='translations',
        null=True,
    )

    name = models.CharField(
        _("Country"),
        max_length=255,
    )

    class Meta:
        unique_together = [('language_code', 'master')]


@python_2_unicode_compatible
class Supplier(models.Model):
    name = models.CharField(
        _("Supplier"),
        max_length=150,
        unique=True
    )

    def __str__(self):
        return self.name


class ProductQuerySet(TranslatableQuerySet, PolymorphicQuerySet):
    pass


class ProductManager(BaseProductManager, TranslatableManager):
    queryset_class = ProductQuerySet

    def get_queryset(self):
        qs = self.queryset_class(self.model, using=self._db)
        return qs.prefetch_related('translations')


@python_2_unicode_compatible
class Product(CMSPageReferenceMixin, TranslatableModelMixin, BaseProduct):
    product_name = models.CharField(
        max_length=255,
        verbose_name=_("Product Name"),
    )

    slug = models.SlugField(verbose_name=_("Slug"))

    caption = TranslatedField()
    short_description = TranslatedField()
    description = TranslatedField()

    manufacturer = models.ForeignKey(
        Manufacturer,
        on_delete=models.CASCADE,
        verbose_name=_("Manufacturer"),
        blank=True,
        null=True,
    )

    supplier = models.ForeignKey(
        Supplier,
        on_delete=models.CASCADE,
        verbose_name=_("Supplier"),
        blank=True,
        null=True,
    )

    country_of_origin = models.ForeignKey(
        Country,
        on_delete=models.CASCADE,
        verbose_name=_("Country of Origin"),
        blank=True,
        null=True,
    )

    # controlling the catalog
    order = models.PositiveIntegerField(
        _("Sort by"),
        db_index=True
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
        help_text=_("Net price for this product"),
    )

    product_code = models.CharField(
        _("Product code"),
        max_length=255,
        unique=True,
    )

    vegan = models.BooleanField(
        _("Vegan"),
        default=False
    )

    class Meta:
        verbose_name = _("Product")
        verbose_name_plural = _("Products")
        ordering = ['order']

    # filter expression used to lookup for a product item using the Select2 widget
    lookup_fields = ('product_code__startswith', 'product_name__icontains')

    def get_price(self, request):
        return self.unit_price

    objects = ProductManager()

    def __str__(self):
        return self.product_name

    @property
    def sample_image(self):
        return self.images.first()


class ProductTranslation(TranslatedFieldsModel):
    master = models.ForeignKey(
        Product,
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
        verbose_name=_("Short description"),
        configuration='CKEDITOR_SETTINGS_DESCRIPTION',
        help_text=_(
            "A short description for customers to give an overview."),
    )

    description = HTMLField(
        verbose_name=_("Description"),
        configuration='CKEDITOR_SETTINGS_DESCRIPTION',
        help_text=_(
            "Full description used in the catalog's detail view."),
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
