# Generated by Django 2.2.12 on 2020-04-11 20:49

from django.db import migrations
import django.utils.timezone
import djangocms_text_ckeditor.fields


class Migration(migrations.Migration):

    dependencies = [
        ('weltladen', '0006_locations'),
    ]

    operations = [
        migrations.AddField(
            model_name='producttranslation',
            name='short_description',
            field=djangocms_text_ckeditor.fields.HTMLField(default=django.utils.timezone.now, help_text='A short description for customers to give an overview.', verbose_name='Short description'),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='producttranslation',
            name='description',
            field=djangocms_text_ckeditor.fields.HTMLField(help_text="Full description used in the catalog's detail view.", verbose_name='Description'),
        ),
    ]
