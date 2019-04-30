# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.http import HttpResponse
from django.shortcuts import render
from .models import Student
from django.template.loader import get_template
from mainsite import models, forms
from django.template import RequestContext


# Create your views here.

def index(request):
	template = get_template('index.html')
	students = Student.objects.all()
	html = template.render(locals())
	return HttpResponse(html)


def login(request):
	if request.method == 'POST':
		login_form = forms.loginform(request.POST)
		if login_form.is_valid():
			login_sid=request.POST['sid'].strip()
			login_pwd=request.POST['pwd']
			student = models.Student.objects.get(sid=login_sid)
			if student.pwd == login_pwd:
				request.session['this_sid'] = login_sid
				request.session['this_sname']=student.sname
				message='欢迎您，'+ request.session['this_sname']
			else:
				message='密码错误或用户名不存在'
		else:
			message = '请检查输入的字段内容'
	else:
		login_form = forms.loginform()
		message='请登录'
	template = get_template('login.html')
	request_context = RequestContext(request)
	request_context.push(locals())
	html= template.template.render(request_context)
	return HttpResponse(html)


def regis(request):
	if request.method == 'POST':
		regis_form = forms.regisform(request.POST)
		if regis_form.is_valid():
			regis_sid=request.POST['sid'].strip()
			try:
				student = models.Student.objects.get(sid=regis_sid)
			except:
				student = None
			if student == None:
				regis_sname = request.POST['sname']
				regis_nickname=request.POST['nickname']
				regis_email=request.POST['email']
				regis_wechat=request.POST['wechat']
				regis_phone=request.POST['phone']
				regis_pwd=request.POST['pwd']
				regis_pwd2=request.POST['pwd2']
				if regis_pwd==regis_pwd2:
					try:
						student2= models.Student.objects.create(sid=regis_sid, sname=regis_sname, nickname=regis_nickname, email=regis_email, wechat=regis_wechat, phone=regis_phone, pwd=regis_pwd)
						student2.save()
						message='注册成功'
					except:
						message='系统繁忙，请稍后再试'
				else:
					message='密码不一致'
			else:
				message='用户已存在'
		else:
			message = '请检查输入的字段内容'
	else:
		regis_form = forms.regisform()
		message='请注册'
	template = get_template('regis.html')
	request_context = RequestContext(request)
	request_context.push(locals())
	html= template.template.render(request_context)
	return HttpResponse(html)