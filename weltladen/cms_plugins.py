from django.utils.translation import ugettext_lazy as _
from cms.plugin_pool import plugin_pool
from cmsplugin_cascade.plugin_base import CascadePluginBase
from weltladen.forms import ContactUsForm

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
        return self.super().render(context, instance, placeholder)

plugin_pool.register_plugin(ContactUsPlugin)
