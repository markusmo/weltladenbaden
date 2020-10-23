# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.core.exceptions import ImproperlyConfigured
from django.utils.translation import ugettext_lazy as _
from django_fsm import RETURN_VALUE, transition
from shop.models.order import BaseOrder, OrderPayment
from shop.payment.workflows import CancelOrderWorkflowMixin


class DeliveryNotePaymentWorkflowMixin(object):

    TRANSITION_TARGETS = {
        'prepare_for_shipping': _("Prepare for Shipping"),
    }
    _manual_payment_transitions = TRANSITION_TARGETS.keys()

    def __init__(self, *args, **kwargs):
        if not isinstance(self, BaseOrder):
            raise ImproperlyConfigured("class 'DeliveryNotePaymentWorkflowMixin' is not of type 'BaseOrder'")
        CancelOrderWorkflowMixin.CANCELABLE_SOURCES.update(self._manual_payment_transitions)
        super().__init__(*args, **kwargs)

    @transition(field='status', source=['created', 'no_payment_required'],
                target=RETURN_VALUE('payment_confirmed'))
    def prepare_for_shipping(self):
        """
        Acknowledge the payment. Create Payment-line
        """
        OrderPayment.objects.create(
            order=self,
            amount=self._total,
            transaction_id='auto generated',
            payment_method='delivery-note'
        ).save()