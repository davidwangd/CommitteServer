# -*- coding: utf-8 -*-
# Generated by Django 1.11.11 on 2019-04-29 13:58
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('mainsite', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='student',
            name='email',
            field=models.CharField(max_length=30),
        ),
        migrations.AlterField(
            model_name='student',
            name='wechat',
            field=models.CharField(max_length=30),
        ),
    ]