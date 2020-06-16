# Generated by Django 2.2.12 on 2020-05-17 17:04

from django.db import migrations
import djangocms_text_ckeditor.fields


class Migration(migrations.Migration):

    dependencies = [
        ('weltladen', '0010_auto_20200506_1822'),
    ]

    operations = [
        migrations.AddField(
            model_name='weltladenproducttranslation',
            name='ingredients',
            field=djangocms_text_ckeditor.fields.HTMLField(blank=True, help_text='What it contains.', null=True, verbose_name='Ingredients'),
        ),
        migrations.AlterField(
            model_name='weltladenproducttranslation',
            name='description',
            field=djangocms_text_ckeditor.fields.HTMLField(help_text="Full description used in the catalog's detail view of Products.", verbose_name='Description'),
        ),
    ]