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
	regis_form = forms.regisform()
	message='请填写身份信息'
	template = get_template('regis.html')
	request_context = RequestContext(request)
	request_context.push(locals())
	html= template.template.render(request_context)
	return HttpResponse(html)