from django.forms.widgets import EmailInput, TextInput, Textarea
from django.utils.translation import ugettext_lazy as _
from shop.forms.checkout import CustomerForm as CustomerFormBase
from djng.forms import fields
from djng.styling.bootstrap3.forms import Bootstrap3Form
from djng.forms.angular_model import NgModelFormMixin
from post_office import mail
from shop.signals import email_queued
from weltladen.settings import WELTLADEN_EMAIL_ADDRESS


class CustomerForm(CustomerFormBase):
    field_order = ['salutation', 'first_name', 'last_name', 'email', 'phonenumber']


class ContactUsForm(NgModelFormMixin, Bootstrap3Form):
    '''
    Form for contacting us
    '''
    form_name='contact_us_form'
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
            WELTLADEN_EMAIL_ADDRESS,
            email,
            subject=subject,
            message=body
        )
        email_queued()

