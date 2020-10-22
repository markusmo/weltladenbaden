# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.conf import settings
from django.core.exceptions import ImproperlyConfigured
from django.contrib.sites.models import Site
from django.template import Context
from django.template.loader import get_template
from django.utils.translation import ugettext_lazy as _
from django.urls import reverse
from django_fsm import RETURN_VALUE, transition
from post_office import mail
from shop.models.order import BaseOrder, OrderPayment
from shop.payment.workflows import CancelOrderWorkflowMixin
from shop.signals import email_queued


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


def send_new_order_to_shop(order):
    template = get_template('weltladen/email/order-created.html')
    admin_url = reverse("admin:%s_%s_change" % (order._meta.app_label, order._meta.model_name), args=(order.id,))
    domain = Site.objects.get_current().domain
    context = Context({
        'order': order,
        'admin_url':domain + admin_url
    })
    mail.send(
        [settings.WELTLADEN_EMAIL_ADDRESS, settings.WELTLADEN_MANAGER_EMAIL_ADDRESS],
        sender=settings.DEFAULT_FROM_EMAIL,
        message=template.render(context)
    )
    email_queued()
