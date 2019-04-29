# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models

# Create your models here.

class Student(models.Model):
	ysorno=(
		(0, '否'),
		(1, '是'),
	)
	sid = models.CharField(max_length=10, unique=True)
	sname = models.CharField(max_length=20)
	nickname = models.CharField(max_length=20, unique=True)
	email = models.CharField(max_length=30)
	wechat = models.CharField(max_length=30)
	phone = models.CharField(max_length=15)
	pwd = models.CharField(max_length=20)
	ismanager = models.IntegerField(default=0, choices=ysorno)
	
	class Meta:
		ordering = ('sid',)
	
	def __unicode__(self):
		return self.sid