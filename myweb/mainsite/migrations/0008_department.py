# -*- coding: utf-8 -*-
# Generated by Django 1.11.11 on 2019-05-01 02:13
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('mainsite', '0007_auto_20190501_0001'),
    ]

    operations = [
        migrations.CreateModel(
            name='department',
            fields=[
                ('did', models.CharField(max_length=2, primary_key=True, serialize=False, unique=True)),
                ('dname', models.CharField(max_length=15)),
            ],
        ),
    ]
