# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.core.exceptions import ImproperlyConfigured
from shop.payment.providers import PaymentProvider
from shop.models.order import OrderModel


class DeliveryNotePayment(PaymentProvider):
    """
    Provides a simple delivery note payment provider.
    """
    namespace = 'delivery-note-payment'

    def __init__(self):
        super(DeliveryNotePayment, self).__init__()

    def get_payment_request(self, cart, request):
        order = OrderModel.objects.create_from_cart(cart, request)
        order.populate_from_cart(cart, request)
        order.amount_paid = order.total
        order.acknowledge_payment()
        order.pick_goods()
        order.save(with_notification=True)
        return 'window.location.href="{}";'.format(order.get_absolute_url())