from django.core.management.base import BaseCommand
from easy_thumbnails.models import Source, Thumbnail
from weltladen.models import WeltladenProduct
from django.conf import settings
import os

class Command(BaseCommand):
    help = "Iterates over all files in Filer and creates an IconFont for all eligibles."

    def add_arguments(self, parser):
        parser.add_argument(
            '--dry-run',
            dest='dry_run',
            action='store_true'
        )
        parser.set_defaults(dry_run=False)

    def handle(self, verbosity, *args, **options):
        self.dry_run = options['dry_run']
        self.verbosity = verbosity
        self.delete_thumbnails()

    def clean_thumbnails(self, model):
        sources = Source.objects.filter(name=model.file.name)
        if sources.exists():
            for thumb in Thumbnail.objects.filter(source=sources[0]):
                try:
                    path = os.path.join(settings.MEDIA_ROOT, thumb.name)
                    if self.dry_run:
                        print('Would delete: '+ path)
                    else:
                        os.remove(path)
                        thumb.delete()
                except Exception as e:
                    print("error " + e.message)

    def delete_thumbnails(self):
        for p in WeltladenProduct.objects.all():
            for i in p.images.all():
                self.clean_thumbnails(i)