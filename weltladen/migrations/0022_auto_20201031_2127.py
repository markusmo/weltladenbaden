# Generated by Django 3.0.10 on 2020-10-31 20:27

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('weltladen', '0021_auto_20201011_2233'),
    ]

    operations = [
        migrations.AlterField(
            model_name='activation',
            name='activation_key_expires',
            field=models.DateField(default=datetime.date(2020, 11, 3), verbose_name='Activation Key Expiration'),
        ),
    ]