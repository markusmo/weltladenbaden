# Generated by Django 2.2.12 on 2020-05-06 16:22

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('weltladen', '0009_auto_20200506_1624'),
    ]

    operations = [
        migrations.AlterField(
            model_name='weltladenproduct',
            name='bio_quality_label',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='weltladen.BioQualityLabel', verbose_name='Bio Quality Label'),
        ),
    ]
