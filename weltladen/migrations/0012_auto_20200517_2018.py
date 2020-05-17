# Generated by Django 2.2.12 on 2020-05-17 18:18

from django.db import migrations
import django_countries.fields


class Migration(migrations.Migration):

    dependencies = [
        ('weltladen', '0011_auto_20200517_1904'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='manufacturer',
            options={'ordering': ('name',)},
        ),
        migrations.AlterModelOptions(
            name='supplier',
            options={'ordering': ('name',)},
        ),
        migrations.AddField(
            model_name='weltladenproduct',
            name='origin_countries',
            field=django_countries.fields.CountryField(blank=True, max_length=746, multiple=True, verbose_name='Origin countries'),
        ),
    ]
