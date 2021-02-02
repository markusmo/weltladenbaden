# Generated by Django 3.0.11 on 2021-01-24 21:09

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('cms', '0022_auto_20180620_1551'),
        ('weltladen', '0024_auto_20210124_1245'),
    ]

    operations = [
        migrations.CreateModel(
            name='InstagramCategory',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('taxonomy_number', models.PositiveIntegerField(help_text='See https://www.google.com/basepages/producttype/taxonomy-with-ids.en-US.txt for further information', verbose_name='Taxonomy number')),
                ('taxonomy_name', models.CharField(max_length=255, unique=True, verbose_name='Taxonomy name')),
                ('cms_page', models.ForeignKey(limit_choices_to={'publisher_is_draft': False}, on_delete=django.db.models.deletion.CASCADE, to='cms.Page')),
            ],
            options={
                'verbose_name': 'Instagram category',
                'verbose_name_plural': 'Instagram categories',
            },
        ),
        migrations.AddField(
            model_name='weltladenproduct',
            name='instagram_category',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='weltladen.InstagramCategory'),
        ),
    ]