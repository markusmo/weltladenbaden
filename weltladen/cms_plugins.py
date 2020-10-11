from django.utils.translation import ugettext_lazy as _
from cms.plugin_pool import plugin_pool
from cmsplugin_cascade.plugin_base import CascadePluginBase
from weltladen.forms import ContactUsForm, MyRegisterUserForm

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
