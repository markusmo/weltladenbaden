# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.core.exceptions import ValidationError
from django.utils.translation import ugettext_lazy as _
from shop.modifiers.pool import cart_modifiers_pool
from shop.modifiers.defaults import DefaultCartModifier
from shop.serializers.cart import ExtraCartRow
from shop.money import Money
from shop.shipping.modifiers import ShippingModifier

class BicycleShippingModifier(ShippingModifier):
    identifier = 'bicycle-shipping'

    def get_choice(self):
        return (self.identifier, _("Shipping by Bicycle"))

    def add_extra_cart_row(self, cart, request):
        if not self.is_active(cart.extra.get('shipping_modifier')) and len(cart_modifiers_pool.get_shipping_modifiers()) > 1:
            return
        # add a shipping flat fee
        amount = Money('0')
        instance = {'label': _("Shipping costs"), 'amount': amount}
        cart.extra_rows[self.identifier] = ExtraCartRow(instance)
        cart.total += amount

    def ship_the_goods(self, delivery):
        super(BicycleShippingModifier, self).ship_the_goods(delivery)



class PostalShippingModifier(ShippingModifier):
    identifier = 'postal-shipping'

    def get_choice(self):
        return (self.identifier, _("Postal shipping"))

    def add_extra_cart_row(self, cart, request):
        if not self.is_active(cart.extra.get('shipping_modifier')) and len(cart_modifiers_pool.get_shipping_modifiers()) > 1:
            return
        # add a shipping flat fee
        amount = Money('5')
        instance = {'label': _("Shipping costs"), 'amount': amount}
        cart.extra_rows[self.identifier] = ExtraCartRow(instance)
        cart.total += amount

    def ship_the_goods(self, delivery):
        if not delivery.shipping_id:
            raise ValidationError("Please provide a valid Shipping ID")
        super(PostalShippingModifier, self).ship_the_goods(delivery)
