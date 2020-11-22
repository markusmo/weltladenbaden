from django.conf import settings as config
from shop.search.documents import ProductDocument
from elasticsearch_dsl.analysis import analyzer, token_filter, tokenizer


settings = {
    'number_of_shards': 1,
    'number_of_replicas': 0,
}

for language, _ in config.LANGUAGES:
    analyzer_name = language+'_'+_+ '_analyzer'
    language_analizers = {
        language: analyzer('german_analyzer',
            type='custom',
            tokenizer=tokenizer('trigram', 'ngram', min_gram=3, max_gram=3),
            filter=[
                'lowercase',
                token_filter('asciifolding', type='asciifolding', preserve_original=False),
                token_filter('german_stop', type='stop', language='german'),
                token_filter('german_stemmer', type='snowball', language='german'),
            ],
            char_filter=['html_strip'],
        )
    }
    
    ProductDocument(language=language, settings=settings, language_analizers=language_analizers)
