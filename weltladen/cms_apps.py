# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.conf.urls import url
from rest_framework.settings import api_settings

from cms.apphook_pool import apphook_pool
from cms.cms_menus import SoftRootCutter
from menus.menu_pool import menu_pool
from shop.cms_apphooks import CatalogListCMSApp, CatalogSearchApp, OrderApp, PasswordResetApp
from shop.search.mixins import ProductSearchViewMixin
from shop.views.catalog import AddToCartView, ProductListView, ProductRetrieveView
from shop.rest.filters import CMSPagesFilterBackend
from weltladen.serializers import ProductDetailSerializer


class CatalogListApp(CatalogListCMSApp):
    def get_urls(self, page=None, language=None, **kwargs):
        
        filter_backends = [CMSPagesFilterBackend]
        filter_backends.extend(api_settings.DEFAULT_FILTER_BACKENDS)
        ProductListViewClass = type('ProductSearchListView', (ProductSearchViewMixin, ProductListView), {})
        return [
            url(r'^(?P<slug>[\w-]+)/add-to-cart', AddToCartView.as_view()),
            url(r'^(?P<slug>[\w-]+)', ProductRetrieveView.as_view(
                serializer_class=ProductDetailSerializer,
            )),
            url(r'^', ProductListViewClass.as_view(
                filter_backends=filter_backends,
                redirect_to_lonely_product=True,
            )),
        ]


apphook_pool.register(CatalogListApp)

apphook_pool.register(CatalogSearchApp)

apphook_pool.register(OrderApp)

apphook_pool.register(PasswordResetApp)


def _deregister_menu_pool_modifier(Modifier):
    index = None
    for k, modifier_class in enumerate(menu_pool.modifiers):
        if issubclass(modifier_class, Modifier):
            index = k
    if index is not None:
        # intentionally only modifying the list
        menu_pool.modifiers.pop(index)


_deregister_menu_pool_modifier(SoftRootCutter)
