# -*- coding: utf-8 -*-
# Generated by Django 1.11.11 on 2019-05-09 10:27
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('mainsite', '0011_auto_20190509_1810'),
    ]

    operations = [
        migrations.AlterField(
            model_name='student',
            name='job',
            field=models.CharField(blank=True, choices=[('0', '\u65e0'), ('1', '\u5e72\u4e8b'), ('2', '\u526f\u90e8\u957f'), ('3', '\u90e8\u957f'), ('4', '\u526f\u4e3b\u5e2d'), ('5', '\u4e3b\u5e2d')], max_length=2, null=True),
        ),
    ]