# Generated by Django 3.0.10 on 2020-10-11 20:33

import datetime
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('weltladen', '0020_qualitylabel_ordering'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='manufacturer',
            options={'ordering': ('name',), 'verbose_name': 'Manufacturer', 'verbose_name_plural': 'Manufacturers'},
        ),
        migrations.AlterModelOptions(
            name='qualitylabel',
            options={'verbose_name': 'Quality label', 'verbose_name_plural': 'Quality lables'},
        ),
        migrations.AlterModelOptions(
            name='supplier',
            options={'ordering': ('name',), 'verbose_name': 'Supplier', 'verbose_name_plural': 'Suppliers'},
        ),
        migrations.CreateModel(
            name='Activation',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('activation_key', models.CharField(max_length=64, verbose_name='Activation Key')),
                ('activation_key_expires', models.DateField(default=datetime.date.today(), verbose_name='Activation Key Expiration')),
                ('customer', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to='weltladen.WeltladenCustomer')),
            ],
        ),
    ]
