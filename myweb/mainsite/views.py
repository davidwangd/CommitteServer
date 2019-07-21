# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render
from .models import Student, Project, Account, Department, Roomrent
from django.template.loader import get_template
from mainsite import models, forms
from django.template import RequestContext


# Create your views here.

def index(request):
	isloged=0
	if request.method=='GET':
		request.session.flush()
	else:
		if request.method=='POST':
			isloged=1
	template = get_template('index.html')
	projects = Project.objects.all()
	departments = Department.objects.all()
	request_context = RequestContext(request)
	request_context.push(locals())
	html= template.template.render(request_context)
	
	return HttpResponse(html)


def userhome(request):
	template = get_template('userhome.html')
	projects = Project.objects.all()
	departments = Department.objects.all()
	roomrents = Roomrent.objects.all()
	accounts = Account.objects.all()
	student = models.Student.objects.get(sid=request.session['this_sid'])
	if student.ismanager==1:
		message='您的身份是：管理员'
	else:
		message='您的身份是：普通用户'
	request_context = RequestContext(request)
	request_context.push(locals())
	html= template.template.render(request_context)
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
				request.session.set_expiry(600) 
				message='欢迎您，'+ request.session['this_sname']
				return HttpResponseRedirect('/userhome')
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
				regis_department=request.POST['department']
				regis_job=request.POST['job']
				regis_department2=request.POST['department2']
				regis_isjobed = request.POST['isjobed']
				regis_jobedtime = request.POST['jobedtime']
				if regis_pwd==regis_pwd2:
					try:
						student2= models.Student.objects.create(sid=regis_sid, sname=regis_sname, nickname=regis_nickname, email=regis_email, wechat=regis_wechat, phone=regis_phone, pwd=regis_pwd, department=regis_department, job=regis_job, department2=regis_department2, isjobed=regis_isjobed, jobedtime=regis_jobedtime)
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
	
	
def operate(request, op):
	mes2=op
	if request.method == 'POST':
		if mes2 == 'proin':
			oper_form = forms.projinform(request.POST)
			if oper_form.is_valid():
				project = None
				if project == None:
					op_sname = request.POST['pname']
					op_stime=request.POST['stime_year']+'-'+request.POST['stime_month']+'-'+request.POST['stime_day']
					op_etime=request.POST['etime_year']+'-'+request.POST['etime_month']+'-'+request.POST['etime_day']
					op_place=request.POST['place']
					op_pernum=request.POST['pernum']
					op_department=request.POST['department']
					oo_sid=request.session['this_sid']
					op_sid = models.Student.objects.get(sid=oo_sid)
					op_introduce=request.POST['introduce']
					op_link=request.POST['link']
					op_checking=0
					op_borrow=0
					op_status=0
					qbf="P"+op_department+request.POST['etime_year'][2:4]
					if int(request.POST['etime_month'])<=7 and int(request.POST['etime_month'])>=2:
						qbf = qbf + '02'
					else:
						qbf = qbf + '01'
					try:
						number = models.Project.objects.filter(pid__startswith = qbf).count() + 1
					except:
						number = 1
					op_pid = qbf + "%02d"%(number)

					try:
						project2= models.Project.objects.create(pid=op_pid, pname=op_sname, stime=op_stime, etime=op_etime,place=op_place, pernum=op_pernum, department=op_department, sid=op_sid, introduce=op_introduce, link=op_link, checking=op_checking, borrow=op_borrow,status=op_status)
						project2.save()
						message='提交成功,项目号(pid)为' + op_pid
					except:
						message='系统繁忙，请稍后再试, pid为'+ op_pid
				else:
					message='项目编号已存在'
			else:
				message = '请检查输入的字段内容'
		elif mes2 == 'accin':
			oper_form = forms.accinform(request.POST)
			if oper_form.is_valid():
				account = None
				if account == None:
					oo_pid = request.POST['pid']
					op_pid = models.Project.objects.get(pid=oo_pid)
					oo_sid=request.session['this_sid']
					op_sid = models.Student.objects.get(sid=oo_sid)
					op_reason=request.POST['reason']
					op_money=request.POST['money']
					op_checking=0
					op_status=0
					project = models.Project.objects.get(pid = op_pid)
					student = models.Student.objects.get(sid = op_sid)
					qbf="A"+student.department+str(project.etime.year)[2:4]
					if int(project.etime.month)<=7 and int(project.etime.month)>=2:
						qbf = qbf + '02'
					else:
						qbf = qbf + '01'
					try:
						number = models.Account.objects.filter(aid__startswith = qbf).count() + 1
					except:
						number = 1
					qbf = qbf + "%02d"%(number)
					op_aid = qbf
					try:
						account2= models.Account.objects.create(aid=op_aid, pid=op_pid, sid=op_sid, reason=op_reason, money=op_money, checking=op_checking, status=op_status)
						account2.save()
						message='提交成功,报销编号(aid)为'+qbf
					except:
						message='系统繁忙，请稍后再试，报销编号(aid)为'+ qbf
				else:
					message='报销编号已存在'
			else:
				message = '请检查输入的字段内容'
		elif mes2 == 'retin':
			oper_form = forms.retinform(request.POST)
			if oper_form.is_valid():
				rentrec = None
				if rentrec == None:
					oo_pid = request.POST['pid']
					op_pid = models.Project.objects.get(pid=oo_pid)
					oo_sid=request.session['this_sid']
					op_sid = models.Student.objects.get(sid=oo_sid)
					op_day =request.POST['day_year']+'-'+request.POST['day_month']+'-'+request.POST['day_day']
					op_room=request.POST['room']
					op_type = request.POST['type']
					op_stime = request.POST['stime']
					op_etime = request.POST['etime']
					
					student = models.Student.objects.get(sid = op_sid)
					qbf="R"+student.department+request.POST['day_year'][2:4]+"%02d"%(int(request.POST['day_month']))+"%02d"%(int(request.POST['day_day']))
					try:
						number = models.Roomrent.objects.filter(rid__startswith = qbf).count() + 1
					except:
						number = 1
					qbf = qbf + "%02d"%(number)
					op_rid = qbf
					
					try:
						rentrec2= models.Roomrent.objects.create(rid=op_rid, pid=op_pid, sid=op_sid, day=op_day, room=op_room, type=op_type, stime=op_stime, etime=op_etime, status=0)
						rentrec2.save()
						message='提交成功,租借号(rid)为'+ op_rid
					except:
						message='系统繁忙，请稍后再试，租借号(rid)为'+ op_rid
				else:
					message='报销编号已存在'
			else:
				message = '请检查输入的字段内容'
	else:
		if mes2 == 'proin':
			oper_form = forms.projinform(request.POST)
		elif mes2 == 'accin':
			oper_form = forms.accinform(request.POST)
		elif mes2 == 'retin':
			oper_form = forms.retinform(request.POST)
	template = get_template('operate.html')
	projects = Project.objects.all()
	departments = Department.objects.all()
	student = models.Student.objects.get(sid=request.session['this_sid'])
	if student.ismanager==1:
		message3='您的身份是：管理员'
	else:
		message3='您的身份是：普通用户'
	request_context = RequestContext(request)
	request_context.push(locals())
	html= template.template.render(request_context)
	return HttpResponse(html)