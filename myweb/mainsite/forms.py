# -*- coding: utf-8 -*-
from django import forms
from django.forms import extras

class loginform(forms.Form):
	sid = forms.CharField(label='学号', max_length=10)
	pwd = forms.CharField(label='密码', max_length=20, widget=forms.PasswordInput())

class regisform(forms.Form):
	sid = forms.CharField(label='学号', max_length=10)
	sname = forms.CharField(label='姓名', max_length=20)
	nickname = forms.CharField(label='昵称', max_length=20)
	email = forms.CharField(label='邮箱', max_length=30)
	wechat = forms.CharField(label='微信号', max_length=30)
	phone = forms.CharField(label='电话号', max_length=15)
	pwd = forms.CharField(label='密码', max_length=20, widget=forms.PasswordInput())
	pwd2=forms.CharField(label='请再次输入密码', max_length=20, widget=forms.PasswordInput())

class projinform(forms.Form):
	bumen = [
		['01', '文艺部'], 
		['02', '学术部'], 
		['03', '体育部'], 
		['04', '外联部'], 
		['05', '国际部'], 
		['06', '新媒体中心'], 
		['07', '组织部'], 
		['08', '班联部'], 
		['09', '实践部'], 
		['10', '信息事务部'], 
		['11', '监察部'],
	]
	ysorno=[
		[0, '未审核'],
		[1, '是'],
		[2, '否'],
	]
	pos=[
		[0,'未开始'],
		[1,'进行中'],
		[2,'成功'],
		[3,'失败'],
	]
	pid = forms.CharField(label='项目号', max_length=10)
	pname = forms.CharField(label='项目名称', max_length=50)
	stime = forms.DateField(label='开始时间', widget=extras.SelectDateWidget)
	etime = forms.DateField(label='结束时间', widget=extras.SelectDateWidget)
	place = forms.CharField(label='举办地点', max_length=50)
	pernum = forms.IntegerField(label='预计参与人数')
	department = forms.ChoiceField(label='负责部门', choices=bumen)
	sid = forms.CharField(label='负责人学号', max_length=10)
	introduce = forms.CharField(label='活动介绍', widget=forms.Textarea)
	link = forms.CharField(label='活动超链接', required=False, widget=forms.Textarea)


class projreform(forms.Form):
	bumen = [
		['01', '文艺部'], 
		['02', '学术部'], 
		['03', '体育部'], 
		['04', '外联部'], 
		['05', '国际部'], 
		['06', '新媒体中心'], 
		['07', '组织部'], 
		['08', '班联部'], 
		['09', '实践部'], 
		['10', '信息事务部'], 
		['11', '监察部'],
	]
	ysorno=[
		[0, '未审核'],
		[1, '是'],
		[2, '否'],
	]
	pos=[
		[0,'未开始'],
		[1,'进行中'],
		[2,'成功'],
		[3,'失败'],
	]
	pid = forms.CharField(label='项目号', max_length=10)
	pname = forms.CharField(label='项目名称', max_length=50)
	stime = forms.DateField(label='开始时间')
	etime = forms.DateField(label='结束时间')
	place = forms.CharField(label='举办地点', max_length=50)
	pernum = forms.IntegerField(label='预计参与人数')
	department = forms.ChoiceField(label='负责部门', choices=bumen)
	sid = forms.CharField(label='负责人学号', max_length=10)
	link = forms.CharField(label='活动超链接', required=False, widget=forms.Textarea)
	checking = forms.ChoiceField(label='审核情况', initial=0, choices=ysorno)
	borrow = forms.ChoiceField(label='场地租用情况', initial=0, choices=ysorno)
	status = forms.ChoiceField(label='活动状态', initial=0, choices=pos)


class accinform(forms.Form):
	aid = forms.CharField(label='报销序号', max_length=10)
	pid = forms.CharField(label='项目号', max_length=10)
	sid = forms.CharField(label='负责人学号', max_length=10)
	reason = forms.CharField(label='报销事由', widget=forms.Textarea)
	money = forms.FloatField(label='报销金额')
