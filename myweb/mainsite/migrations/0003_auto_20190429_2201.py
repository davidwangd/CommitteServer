# -*- coding: utf-8 -*-
# Generated by Django 1.11.11 on 2019-04-29 14:01
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('mainsite', '0002_auto_20190429_2158'),
    ]

    operations = [
        migrations.AlterField(
            model_name='student',
            name='ismanager',
            field=models.IntegerField(choices=[(0, '\u5426'), (1, '\u662f')], default=0),
        ),
    ]
