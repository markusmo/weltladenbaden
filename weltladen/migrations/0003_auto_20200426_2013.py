# Generated by Django 2.2.12 on 2020-04-26 18:13

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('weltladen', '0002_auto_20200426_2012'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='weltladenproduct',
            name='card_type',
        ),
        migrations.RemoveField(
            model_name='weltladenproduct',
            name='speed',
        ),
        migrations.AddField(
            model_name='weltladenproduct',
            name='tax_switch',
            field=models.BooleanField(default=True, help_text='If switched on, then 20% tax item, if off then 10% tax item', verbose_name='Switch Tax'),
        ),
        migrations.AddField(
            model_name='weltladenproduct',
            name='vegan',
            field=models.BooleanField(default=False, verbose_name='Vegan'),
        ),
    ]
