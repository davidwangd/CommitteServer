# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models

# Create your models here.

class Student(models.Model):
	sid = models.CharField(max_length=10, unique=True)
	sname = models.CharField(max_length=20)
	nickname = models.CharField(max_length=20, unique=True)
	email = models.TextField(default='user@host.com'),
	wechat = models.TextField(),
	phone = models.CharField(max_length=15),
	pwd = models.CharField(max_length=20),
	ismanager = models.IntegerField(default=0)
	
	class Meta:
		ordering = ('sid',)
	
	def __unicode__(self):
		return self.sid


