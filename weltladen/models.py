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
from shop.models.defaults.delivery import Delivery
from shop.models.defaults.delivery_item import DeliveryItem
from shop.models.defaults.order import Order
from shop.models.defaults.mapping import ProductPage, ProductImage
from shop.models.defaults.address import BillingAddress, ShippingAddress
from shop.models.customer import BaseCustomer
from shop.models.address import CountryField
from shop.conf import app_settings
from filer.fields import image



__all__ = ['Cart', 'CartItem', 'Order', 'Delivery', 'DeliveryItem',
           'BillingAddress', 'ShippingAddress']


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


@python_2_unicode_compatible
class Supplier(models.Model):
    name = models.CharField(
        _("Supplier"),
        max_length=150,
        unique=True
    )

    def __str__(self):
        return self.name

@python_2_unicode_compatible
class BioQualityLabel(models.Model):
    name = models.CharField(
        _("Bio Quality Label"),
        max_length=150,
        unique=True
    )

    logo = image.FilerImageField(
        on_delete=models.CASCADE
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
class WeltladenProduct(CMSPageReferenceMixin, TranslatableModelMixin, BaseProduct):
    product_name = models.CharField(
        max_length=255,
        verbose_name=_("Product Name"),
    )

    slug = models.SlugField(verbose_name=_("Slug"))

    caption = TranslatedField()
    short_description = TranslatedField()
    description = TranslatedField()

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

    supplier = models.ForeignKey( 
        Supplier, 
        verbose_name=_("Supplier"), 
        on_delete=models.CASCADE
    )

    bio_quality_label = models.ForeignKey(
        BioQualityLabel,
        on_delete=models.CASCADE,
        verbose_name=_("Bio Quality Label"),
        blank=True,
        null=True
    )

    country_of_origin = CountryField(
        'Country of origin',
        blank=True,
        null=True
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

    fairtrade = models.BooleanField(
        _("Fairtrade"),
        default=True
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
    def sample_image(self):
        return self.images.first()


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
            "Full description used in the catalog's detail view of Smart Cards."),
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
