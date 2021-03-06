# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.urls import path
from django.conf import settings
from django.conf.urls.static import static
from django.conf.urls import url, include
from django.conf.urls.i18n import i18n_patterns
from django.contrib import admin
from django.contrib.sitemaps.views import sitemap
from django.http import HttpResponse
from cms.sitemaps import CMSSitemap
from weltladen.sitemap import ProductSitemap
from weltladen.views import ContactUsView, RegisterUserView, ActivateUserView, NewActivationView

sitemaps = {'cmspages': CMSSitemap,
            'products': ProductSitemap}


def render_robots(request):
    permission = 'noindex' in settings.ROBOTS_META_TAGS and 'Disallow' or 'Allow'
    return HttpResponse('User-Agent: *\n%s: /\n' % permission, content_type='text/plain')


i18n_urls = (
    url(r'^admin/', admin.site.urls),
    url(r'^', include('cms.urls')),
)
urlpatterns = [
    url(r'^robots\.txt$', render_robots),
    url(r'^sitemap\.xml$', sitemap, {'sitemaps': sitemaps}, name='sitemap'),
    url(r'^shop/', include('shop.urls')),
]

urlpatterns.extend([
        path(r'contact-us', ContactUsView.as_view(), name='contact-us'),
        path(r'register', RegisterUserView.as_view(), name='register-user'),
        path(r'activate-user/<str:activation_key>/', ActivateUserView.as_view(), name='activate-user'),
        path(r'new-activation-link/<str:activation_key>/', NewActivationView.as_view(), name='new-activation-link')
    ])

if settings.DEBUG:
    from .views import custom_page_not_found
    urlpatterns.extend([
        path(r'de/404/', custom_page_not_found)
    ])

if settings.USE_I18N:
    urlpatterns.extend(i18n_patterns(*i18n_urls))
else:
    urlpatterns.extend(i18n_urls)
urlpatterns.extend(
    static(
        settings.MEDIA_URL, document_root=settings.MEDIA_ROOT))
