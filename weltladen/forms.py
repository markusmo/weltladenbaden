from django.forms import widgets
from django.utils.translation import ugettext_lazy as _
from shop.forms.checkout import CustomerForm as CustomerFormBase
from djng.forms import fields
from djng.styling.bootstrap3.forms import Bootstrap3Form
from post_office import mail
from shop.signals import email_queued
from weltladen.settings import WELTLADEN_EMAIL_ADDRESS


class CustomerForm(CustomerFormBase):
    field_order = ['salutation', 'first_name', 'last_name', 'email', 'phonenumber']


class ContactUsForm(Bootstrap3Form):
    '''
    Form for contacting us
    '''
    form_name='contact_us_form'
    scope_prefix = 'form_data'
    field_css_classes = 'input-group has-feedback'


    email = fields.EmailField(
        label=_("Your e-mail address"),
        widget=widgets.EmailInput(attrs={'placeholder': _("E-mail address", 'required': True)})
    )

    subject = fields.CharField(
        _("Subject"),
        widget=widgets.TextInput(attrs={'placeholder': _("Subject"), 'required': True})
    )

    body = fields.CharField(
        _("Text"),
        widget=widgets.Textarea(attrs={'required': True})
    )

    def clean(self):
        cleaned_data = super(RegisterUserForm, self).clean()
        return cleaned_data
    
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

