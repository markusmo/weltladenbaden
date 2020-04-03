# -*- coding: utf-8 -*-
"""
These serializer mixinins and fields are used exclusively to import the file
``workdir/fixtures/products-meta.json``. They are not intended for general
purpose and can be deleted thereafter.
"""
from __future__ import unicode_literals

from parler_rest.serializers import TranslatedFieldsField, TranslatedField, TranslatableModelSerializerMixin


class TranslatableModelSerializerMixin(TranslatableModelSerializerMixin):
    def to_internal_value(self, data):
        data = self._swap_translated_data(data)
        return super(TranslatableModelSerializerMixin, self).to_internal_value(data)

    def _swap_translated_data(self, data):
        """
        Swap translated data unassigned to internal fields.
        """
        remaining = set(data.keys()) - set(self.get_fields().keys())
        for field_name in remaining:
            translations = data.pop(field_name, {})
            for language in translations.keys():
                for key, lemma in translations.get(language, {}).items():
                    data.setdefault(key, {})
                    data[key][language] = lemma
        return data


__all__ = ['TranslatedFieldsField', 'TranslatedField',
           'TranslatableModelSerializerMixin']
