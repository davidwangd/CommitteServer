# -*- coding: utf-8 -*-
# Generated by Django 1.11.11 on 2019-07-16 08:34
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('mainsite', '0017_auto_20190715_1820'),
    ]

    operations = [
        migrations.AlterField(
            model_name='roomrent',
            name='rid',
            field=models.CharField(max_length=15, primary_key=True, serialize=False, unique=True),
        ),
    ]
