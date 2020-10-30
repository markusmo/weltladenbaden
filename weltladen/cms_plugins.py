from django.utils.translation import ugettext_lazy as _
from cms.plugin_pool import plugin_pool
from cmsplugin_cascade.plugin_base import CascadePluginBase
from .models import Activation
from .forms import ContactUsForm, MyRegisterUserForm


class ContactUsPlugin(CascadePluginBase):
    name = _('Contact Us')
    module = 'Weltladen'
    parent_classes = ['BootstrapColumnPlugin']
    render_template = 'weltladen/forms/contact-us.html'
    cache = False

    @classmethod
    def get_identifier(cls, instance):
        return 'id-contact-us-plugin'

    def render(self, context, instance, placeholder):
        context['form_name'] = ContactUsForm.form_name
        context[ContactUsForm.form_name] = ContactUsForm()
        context['proceed_with'] = ''
        return super().render(context, instance, placeholder)


plugin_pool.register_plugin(ContactUsPlugin)


class RegisterUserPlugin(CascadePluginBase):
    name = _('Register User')
    module = 'Weltladen'
    parent_classes = ['BootstrapColumnPlugin']
    render_template = 'weltladen/auth/register-user.html'
    cache = False

    @classmethod
    def get_identifier(cls, instance):
        return 'id-weltladen-register-user-plugin'

    def render(self, context, instance, placeholder):
        context['form_name'] = MyRegisterUserForm.form_name
        context[MyRegisterUserForm.form_name] = MyRegisterUserForm()
        context['proceed_with'] = '/'
        return super().render(context, instance, placeholder)


plugin_pool.register_plugin(RegisterUserPlugin)


class ActivateNewUserPlugin(CascadePluginBase):
    name = _('New User Activation')
    module = 'Weltladen'
    parent_classes = ['BootstrapColumnPlugin']
    render_template = 'weltladen/auth/activation.html'
    cache = False

    @classmethod
    def get_identifier(cls, instance):
        return 'id-weltladen-activate-user-plugin'

    def render(self, context, instance, placeholder):
        request = context['request']
        activation_key = request.GET.get('activation_key', '')
        logged_in = request.user.is_authenticated
        proceed_with = '/'
        activation = Activation.objects.filter(activation_key=activation_key).first()
        activation_not_found = True
        valid = False
        
        if activation:
            activation_not_found = False
            valid = activation.verify()
        if not logged_in and valid:
            proceed_with = '/join-us/login/'

        context['activation_valid'] = valid
        context['activation_key'] = activation_key
        context['form_name'] = 'activation'   
        context['proceed_with'] = proceed_with
        context['activation_not_found'] = activation_not_found
        return super().render(context, instance, placeholder)

plugin_pool.register_plugin(ActivateNewUserPlugin)
