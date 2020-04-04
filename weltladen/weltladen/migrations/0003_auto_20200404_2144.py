# Generated by Django 2.2.12 on 2020-04-04 19:44

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('weltladen', '0002_auto_20200404_1800'),
    ]

    operations = [
        migrations.CreateModel(
            name='Country',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=150, unique=True, verbose_name='Country of Origin')),
            ],
        ),
        migrations.CreateModel(
            name='Supplier',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=150, unique=True, verbose_name='Supplier')),
            ],
        ),
        migrations.AddField(
            model_name='product',
            name='vegan',
            field=models.BooleanField(default=False, verbose_name='Vegan'),
        ),
        migrations.AlterField(
            model_name='product',
            name='manufacturer',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='weltladen.Manufacturer', verbose_name='Manufacturer'),
        ),
        migrations.AddField(
            model_name='product',
            name='country_of_origin',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='weltladen.Country', verbose_name='Country of Origin'),
        ),
        migrations.AddField(
            model_name='product',
            name='supplier',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='weltladen.Supplier', verbose_name='Supplier'),
        ),
    ]
