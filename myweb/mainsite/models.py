# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models

# Create your models here.

class Student(models.Model):
	ysorno=(
		(0, '否'),
		(1, '是'),
	)
	bumen = (
		('01', '文艺部'), 
		('02', '学术部'), 
		('03', '体育部'), 
		('04', '外联部'), 
		('05', '国际部'), 
		('06', '新媒体中心'), 
		('07', '组织部'), 
		('08', '班联部'), 
		('09', '实践部'), 
		('10', '信息事务部'), 
		('11', '监察部'),
		('12', '主席团'),
		('13', '无'),
	)
	zhiwei = (
		('0', '无'),
		('1', '干事'),
		('2', '副部长'),
		('3', '部长'),
		('4', '副主席'),
		('5', '主席'),
	)	
	sid = models.CharField(max_length=10, unique=True, primary_key=True)
	sname = models.CharField(max_length=20)
	nickname = models.CharField(max_length=20, unique=True)
	email = models.CharField(max_length=30)
	wechat = models.CharField(max_length=30)
	phone = models.CharField(max_length=15)
	pwd = models.CharField(max_length=20)
	department = models.CharField(null=True, blank=True, max_length=2, choices=bumen)
	job = models.CharField(null=True, blank=True, max_length=2, choices=zhiwei)
	department2 = models.CharField(null=True, blank=True, max_length=2, choices=bumen)
	isjobed = models.IntegerField(default=0, choices=ysorno, null=False, blank=True)
	jobedtime = models.DateField(null=True, blank=True)
	ismanager = models.IntegerField(default=0, choices=ysorno)
	
	class Meta:
		ordering = ('sid',)
	
	def __unicode__(self):
		return self.sid


class Project(models.Model):
	bumen = (
		('01', '文艺部'), 
		('02', '学术部'), 
		('03', '体育部'), 
		('04', '外联部'), 
		('05', '国际部'), 
		('06', '新媒体中心'), 
		('07', '组织部'), 
		('08', '班联部'), 
		('09', '实践部'), 
		('10', '信息事务部'), 
		('11', '监察部'),
	)
	ysorno=(
		(0, '未审核'),
		(1, '是'),
		(2, '否'),
	)
	pos=(
		(0,'未开始'),
		(1,'进行中'),
		(2,'成功'),
		(3,'失败'),
	)
	pid = models.CharField(max_length=10, unique=True, primary_key=True)
	pname = models.CharField(max_length=50)
	stime = models.DateField()
	etime = models.DateField()
	place = models.CharField(max_length=50)
	pernum = models.PositiveIntegerField()
	department = models.CharField(max_length=2, choices=bumen)
	sid = models.ForeignKey(Student, on_delete=models.CASCADE)
	introduce = models.TextField()
	link = models.TextField(null=True, blank=True)
	checking = models.IntegerField(default=0, choices=ysorno)
	borrow = models.IntegerField(default=0, choices=ysorno)
	status = models.IntegerField(default=0, choices=pos)

	class Meta:
		ordering=('pid',)
	
	def __unicode__(self):
		return self.pid
		
class Department(models.Model):
	did = models.CharField(max_length=2, unique=True, primary_key= True)
	dname = models.CharField(max_length=15)
	
	def __unicode__(self):
		return self.did

class Account(models.Model):
	ysorno=(
		(0, '未审核'),
		(1, '是'),
		(2, '否'),
	)
	pos=(
		(0,'未开始'),
		(1,'进行中'),
		(2,'成功'),
		(3,'失败'),
	)
	aid = models.CharField(max_length=10, unique=True, primary_key=True)
	pid = models.ForeignKey(Project, on_delete=models.CASCADE)
	sid = models.ForeignKey(Student, on_delete=models.CASCADE)
	reason = models.TextField()
	money = models.FloatField()
	checking = models.IntegerField(default=0, choices=ysorno)
	stime = models.DateField(null=True, blank=True)
	etime = models.DateField(null=True, blank=True)
	status = models.IntegerField(default=0, choices=pos)
	
	class Meta:
		ordering=('stime','aid',)
	
	def __unicode__(self):
		return self.aid
	