# -*- coding: utf-8 -*-
from django import forms

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