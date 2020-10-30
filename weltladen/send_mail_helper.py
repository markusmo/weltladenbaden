# -*- coding: utf-8 -*-

from django.conf import settings
from django.contrib.sites.shortcuts import get_current_site
from django.template.loader import select_template
from post_office import mail
from shop.conf import app_settings
from shop.signals import email_queued


def send_register_user_mail(request, user, preset_password=False, password=None):
    current_site = get_current_site(request)
    context = {
        'site_name': current_site.name,
        'absolute_base_uri': request.build_absolute_uri('/'),
        'email': user.email,
        'password': password,
        'preset_password': preset_password,
        'user': user,
        'activation_key': user.customer.activation.activation_key
    }
    subject_template = select_template([
        '{}/email/register-user-subject.txt'.format(app_settings.APP_LABEL),
        'shop/email/register-user-subject.txt',
    ])
    # Email subject *must not* contain newlines
    subject = ''.join(subject_template.render(context).splitlines())
    body_text_template = select_template([
        '{}/email/register-user-body.txt'.format(app_settings.APP_LABEL),
        'shop/email/register-user-body.txt',
    ])
    body_html_template = select_template([
        '{}/email/register-user-body.html'.format(app_settings.APP_LABEL),
        'shop/email/register-user-body.html',
    ], using='post_office')
    message = body_text_template.render(context)
    html_message = body_html_template.render(context)
    mail.send(
        user.email,
        settings.WELTLADEN_EMAIL_ADDRESS,
        subject=subject,
        message=message,
        html_message=html_message
    )
    email_queued()
