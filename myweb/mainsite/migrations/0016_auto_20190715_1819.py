# -*- coding: utf-8 -*-
# Generated by Django 1.11.11 on 2019-07-15 10:19
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('mainsite', '0015_auto_20190715_1807'),
    ]

    operations = [
        migrations.AlterField(
            model_name='roomrent',
            name='type',
            field=models.IntegerField(choices=[(0, '\u6559\u5ba4'), (1, '\u4f1a\u8bae\u5ba4'), (2, '\u62a5\u544a\u5385')], max_length=10),
        ),
    ]
