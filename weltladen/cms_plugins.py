import json

from cms.plugin_pool import plugin_pool
from cmsplugin_cascade import app_settings
from cmsplugin_cascade.image import ImagePropertyMixin
from cmsplugin_cascade.leaflet.map import (
    LeafletFormMixin,
    LeafletModelMixin,
    LeafletPlugin,
    MarkerInline,
    MarkerModelMixin
)
from cmsplugin_cascade.mixins import WithInlineElementsMixin
from cmsplugin_cascade.models import InlineCascadeElement
from cmsplugin_cascade.plugin_base import CascadePluginBase, create_proxy_model
from cmsplugin_cascade.utils import compute_aspect_ratio, get_image_size, parse_responsive_length
from django.utils.safestring import mark_safe
from django.utils.translation import ngettext_lazy
from django.utils.translation import ugettext_lazy as _
from django.conf import settings

from .forms import ContactUsForm, MyRegisterUserForm
from .models import Activation


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


def leaflet_settings():
    config = {}
    config['tilesURL'] = settings.CMSPLUGIN_CASCADE['leaflet']['tilesURL']
    config['accessToken'] = settings.CMSPLUGIN_CASCADE['leaflet']['accessToken']
    config.setdefault('default_position', {'lat': 30.0, 'lng': -40.0, 'zoom': 3})
    config['id'] = 'mapbox/streets-v11'
    config.setdefault('tileSize', 512)
    config.setdefault('maxZoom', 25)
    config.setdefault('zoomOffset', -1)
    config.setdefault('detectRetina', True)
    config.setdefault('attribution', mark_safe('Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a>'))
    return config


class MyLeafletPlugin(WithInlineElementsMixin, CascadePluginBase):
    name = _('Leaflet Map')
    module = 'Weltladen'
    cache = False
    settings = mark_safe(json.dumps(leaflet_settings()))
    parent_classes = None
    require_parent = False
    allow_children = False
    change_form_template = 'cascade/admin/leaflet_plugin_change_form.html'
    ring_plugin = 'LeafletPlugin'
    form = LeafletFormMixin
    admin_preview = False
    render_template = 'cascade/plugins/leaflet.html'
    inlines = [MarkerInline]
    model_mixins = (LeafletModelMixin,)

    class Media:
        css = {'all': [
            'node_modules/leaflet/dist/leaflet.css',
            'node_modules/leaflet-easybutton/src/easy-button.css',
            'cascade/css/admin/leafletplugin.css',
        ]}
        js = [
            'node_modules/leaflet/dist/leaflet.js',
            'node_modules/leaflet-easybutton/src/easy-button.js',
            'admin/js/jquery.init.js',
            'cascade/js/admin/leafletplugin.js',
        ]

    def add_view(self, request, form_url='', extra_context=None):
        extra_context = dict(extra_context or {}, settings=self.settings)
        return super().add_view(request, form_url, extra_context)

    def change_view(self, request, object_id, form_url='', extra_context=None):
        extra_context = dict(extra_context or {}, settings=self.settings)
        return super().change_view(request, object_id, form_url, extra_context)

    def render(self, context, instance, placeholder):
        marker_instances = []
        for inline_element in instance.inline_elements.all():
            try:
                ProxyModel = create_proxy_model('LeafletMarker',
                                                (ImagePropertyMixin, MarkerModelMixin),
                                                InlineCascadeElement,
                                                module=__name__)
                marker = ProxyModel(id=inline_element.id, glossary=inline_element.glossary)
                try:
                    aspect_ratio = compute_aspect_ratio(marker.image)
                    width = parse_responsive_length(marker.glossary.get('marker_width') or '25px')
                    marker.size = list(get_image_size(width[0], (None, None), aspect_ratio))
                    marker.size2x = 2 * marker.size[0], 2 * marker.size[1]
                except Exception:
                    # if accessing the image file fails, skip size computations
                    pass
                else:
                    try:
                        marker_anchor = marker.glossary['marker_anchor']
                        top = parse_responsive_length(marker_anchor['top'])
                        left = parse_responsive_length(marker_anchor['left'])
                        if top[0] is None or left[0] is None:
                            left = width[0] * left[1]
                            top = width[0] * aspect_ratio * top[1]
                        else:
                            left, top = left[0], top[0]
                        marker.anchor = [left, top]
                    except Exception:
                        pass
                marker_instances.append(marker)
            except (KeyError, AttributeError):
                pass

        context.update(dict(instance=instance,
                            placeholder=placeholder,
                            settings=self.settings,
                            config=app_settings.CMSPLUGIN_CASCADE['leaflet'],
                            markers=marker_instances))
        return context

    @classmethod
    def get_css_classes(cls, obj):
        css_classes = cls.super(LeafletPlugin, cls).get_css_classes(obj)
        css_class = obj.glossary.get('css_class')
        if css_class:
            css_classes.append(css_class)
        return css_classes

    @classmethod
    def get_identifier(cls, obj):
        num_elems = obj.inline_elements.count()
        content = ngettext_lazy("with {0} marker", "with {0} markers", num_elems).format(num_elems)
        return mark_safe(content)

    @classmethod
    def get_data_representation(cls, instance):
        data = super().get_data_representation(instance)
        data.update(inlines=[ie.glossary for ie in instance.inline_elements.all()])
        return data


plugin_pool.register_plugin(MyLeafletPlugin)
