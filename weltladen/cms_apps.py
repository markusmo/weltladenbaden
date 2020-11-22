# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.conf.urls import url
from django.utils.translation import get_language_from_request
from django.utils.translation import gettext_lazy as _
from rest_framework.settings import api_settings

from cms.apphook_pool import apphook_pool
from cms.cms_menus import SoftRootCutter
from cms.app_base import CMSApp
from menus.menu_pool import menu_pool
from shop.cms_apphooks import CatalogListCMSApp, OrderApp, PasswordResetApp
from shop.search.mixins import ProductSearchViewMixin, SearchViewMixin
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

class CatalogSearchViewMixin(SearchViewMixin):
    """
    Mixin class to be added to the ProductListView in order to create a full-text search.
    """
    search_fields = ['product_name', 'product_code', 'body']

    def get_serializer(self, *args, **kwargs):
        kwargs.setdefault('label', 'search')
        return super().get_serializer(*args, **kwargs)

    def get_queryset(self):
        language = get_language_from_request(self.request)
        document = self.get_document(language)
        query = self.request.GET.get('q')
        search = document.search().source(excludes=['body'])
        if query:
            search = search.query('multi_match', query=query, fields=self.search_fields)
            #otherwise only 10 products will be returned and there will be no pagination
            search = search[0:search.count()]
        return search.to_queryset()


class CatalogSearchApp(CMSApp):
    """
    This CMS apphook shall be used to render the list view for generic search results.
    These results are just determined by the search query and not influenced by other means,
    such as filters and categories. Usually this `Catalog Search` app is attached to a CMS
    page named "Search Results". That CMS page must be tagged with the ID: 'shop-search-product'.
    """
    name = _("Catalog Search")

    def get_urls(self, page=None, language=None, **kwargs):
        from django.conf.urls import url
        from shop.views.catalog import ProductListView

        SearchView = type('SearchView', (CatalogSearchViewMixin, ProductListView), {})
        return [
            url(r'^', SearchView.as_view(
                filter_backends=[],
                search_fields=['product_name', 'product_code', 'body']
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
