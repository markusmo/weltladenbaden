# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db.models import Sum, ExpressionWrapper, F, DecimalField
from django.core.exceptions import ValidationError
from django.utils.translation import ugettext_lazy as _
from shop.modifiers.pool import cart_modifiers_pool
from shop.modifiers.defaults import DefaultCartModifier
from shop.serializers.cart import ExtraCartRow
from shop.money import Money
from shop.modifiers.base import BaseCartModifier
from shop.shipping.modifiers import ShippingModifier
from shop.payment.modifiers import PaymentModifier
from shop.payment.providers import PaymentProvider, ForwardFundPayment

from weltladen.settings import WELTLADEN_SHIPPING_DISTANCE, SHOP_VALUE_ADDED_TAX, SHOP_VALUE_ADDED_TAX10
from weltladen.geolocate import checkdistance


class CartExcludedTaxModifier(BaseCartModifier):
    """
    This tax calculator presumes that unit prices are gross prices, hence also the subtotal,
    and that the tax is calculated per cart but not added to the cart.
    """
    identifier = 'taxes'
    taxes10 = 1 - 1 / (1 + SHOP_VALUE_ADDED_TAX10/ 100)
    taxes20 = 1 - 1 / (1 + SHOP_VALUE_ADDED_TAX / 100)


    def add_extra_cart_row(self, cart, request):
        """
        Add a field on cart.extra_price_fields:
        """
        subtotal10 = (cart.items.filter(product__tax_switch=False).values('quantity', 'product__unit_price')
            .aggregate(total=ExpressionWrapper(
                Sum(F('quantity')*F('product__unit_price')), DecimalField())
                ))['total'] #10 percent tax
        subtotal20 = (cart.items.filter(product__tax_switch=True).values('quantity', 'product__unit_price')
            .aggregate(total=ExpressionWrapper(
                Sum(F('quantity')*F('product__unit_price')), DecimalField())
                ))['total'] #20 percent tax
        
        amount10 = (subtotal10 or 0) * self.taxes10
        amount20 = (subtotal20 or 0) * self.taxes20

        instance10 = {
            'label': _("{}% VAT incl.").format(SHOP_VALUE_ADDED_TAX10), 
            'amount': Money(amount10),
        }
        instance20 = {
            'label': _("{}% VAT incl.").format(SHOP_VALUE_ADDED_TAX),
            'amount': Money(amount20),
        }
        cart.extra_rows[self.identifier+'10'] = ExtraCartRow(instance10)
        cart.extra_rows[self.identifier+'20'] = ExtraCartRow(instance20)

    def add_extra_cart_item_row(self, cart_item, request):
        t_format = SHOP_VALUE_ADDED_TAX10
        if cart_item.product.tax_switch:
            taxes = self.taxes20
            t_format = SHOP_VALUE_ADDED_TAX
        else:
            taxes = self.taxes10
            t_format = SHOP_VALUE_ADDED_TAX10
        
        amount = cart_item.line_total * taxes
        instance = {
            'label': _("{}% VAT incl.").format(t_format),
            'amount': amount,
        }
        cart_item.extra_rows[self.identifier] = ExtraCartRow(instance)


class DeliveryNotePaymentModifier(PaymentModifier):

    payment_provider = ForwardFundPayment()

    def get_choice(self):
        return (self.payment_provider.namespace, _("Payment by delivery note"))


class ClimateNeutralShippingModifier(ShippingModifier):
    identifier = 'climate-neutral-shipping'

    def get_choice(self):
        return (self.identifier, _("Climate neutral shipping"))

    def is_disabled(self, cart):
        #geolocate address of customer
        if cart.shipping_address:
            zip_code = cart.shipping_address.zip_code
            city = cart.shipping_address.city
            country = cart.shipping_address.country
            distance = checkdistance(zip_code, city, country)
            if distance > WELTLADEN_SHIPPING_DISTANCE:
                return True
        else:
            return False

    def add_extra_cart_row(self, cart, request):
        if not self.is_active(cart.extra.get('shipping_modifier')) and len(cart_modifiers_pool.get_shipping_modifiers()) > 1:
            return
        # add a shipping flat fee
        amount = Money('0')
        instance = {'label': _("Shipping costs"), 'amount': amount}
        cart.extra_rows[self.identifier] = ExtraCartRow(instance)
        cart.total += amount

    def ship_the_goods(self, delivery):
        super(ClimateNeutralShippingModifier, self).ship_the_goods(delivery)



class PostalShippingModifier(ShippingModifier):
    identifier = 'postal-shipping'

    def get_choice(self):
        return (self.identifier, _("Postal shipping"))

    def add_extra_cart_row(self, cart, request):
        if not self.is_active(cart.extra.get('shipping_modifier')) and len(cart_modifiers_pool.get_shipping_modifiers()) > 1:
            return
        # add a shipping flat fee
        amount = Money('5')
        if cart.total >= Money(100):
            amount = Money('0')
        instance = {'label': _("Shipping costs"), 'amount': amount}
        cart.extra_rows[self.identifier] = ExtraCartRow(instance)
        cart.total += amount

    def ship_the_goods(self, delivery):
        if not delivery.shipping_id:
            raise ValidationError("Please provide a valid Shipping ID")
        super(PostalShippingModifier, self).ship_the_goods(delivery)
