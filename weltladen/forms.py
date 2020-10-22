
from django.conf import settings
from django.forms.widgets import EmailInput, TextInput, Textarea
from django.contrib.auth import authenticate, login
from django.contrib.sites.shortcuts import get_current_site
from django.utils.translation import ugettext_lazy as _
from django.template.loader import select_template
from shop.forms.checkout import CustomerForm as CustomerFormBase
from shop.forms.auth import RegisterUserForm as RegisterUserFormBase
from djng.forms import fields
from djng.styling.bootstrap3.forms import Bootstrap3Form
from djng.forms.angular_model import NgModelFormMixin
from post_office import mail
from shop.signals import email_queued
from shop.conf import app_settings
from weltladen.models import Activation, get_activation_key


class CustomerForm(CustomerFormBase):
    field_order = ['salutation', 'first_name', 'last_name', 'email', 'phonenumber']


class MyRegisterUserForm(RegisterUserFormBase):

    def save(self, request=None, commit=True):
        self.instance.user.is_active = True
        self.instance.user.email = self.cleaned_data['email']
        self.instance.user.set_password(self.cleaned_data['password1'])
        self.instance.recognize_as_registered(request, commit=False)
        customer = self.base_save(commit)
        activation = Activation(customer=customer)
        activation.activation_key = get_activation_key(self.cleaned_data['email'])
        self.instance.user.activation = activation
        activation.save()
        preset_password = self.cleaned_data['preset_password']
        password = self.cleaned_data['password1']
        #if self.cleaned_data['preset_password']:
        self._send_password(request, customer.user, preset_password, password)
        user = authenticate(username=customer.user.username, password=password)
        login(request, user)
        return customer

    def base_save(self, commit):
        '''
        From django.forms.models
        '''
        if commit:
            # If committing, save the instance and the m2m data immediately.
            self.instance.save()
            self._save_m2m()
        else:
            # If not committing, add a method to the form to allow deferred
            # saving of m2m data.
            self.save_m2m = self._save_m2m
        return self.instance

    def _send_password(self, request, user, preset_password, password):
        current_site = get_current_site(request)
        context = {
            'site_name': current_site.name,
            'absolute_base_uri': request.build_absolute_uri('/'),
            'email': user.email,
            'password': password,
            'preset_password': preset_password,
            'user': user,
            'activation_key': user.activation.activation_key
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


class ContactUsForm(NgModelFormMixin, Bootstrap3Form):
    '''
    Form for contacting us
    '''
    form_name = 'contact_us_form'
    scope_prefix = 'contact_us'
    field_css_classes = 'input-group has-feedback'

    def __init__(self, *args, **kwargs):
        kwargs.update(scope_prefix=self.scope_prefix)
        super().__init__(*args, **kwargs)

    email = fields.EmailField(
        label=_("Your e-mail address"),
        widget=EmailInput(attrs={'placeholder': _("E-mail address")})
    )

    subject = fields.CharField(
        label=_("Subject"),
        max_length=256,
        widget=TextInput(attrs={'placeholder': _("Subject")})
    )

    body = fields.CharField(
        label=_("Text"),
        widget=Textarea(attrs={'required': True})
    )

    def save(self, request=None):
        '''
        send mail and so
        '''
        email = self.cleaned_data['email']
        subject = self.cleaned_data['subject']
        body = self.cleaned_data['body']
        mail.send(
            settings.WELTLADEN_EMAIL_ADDRESS,
            email,
            subject=subject,
            message=body
        )
        email_queued()
