# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib import admin
from mainsite import models
from .models import Student

# Register your models here.

class  StudentAdmin(admin.ModelAdmin):
	list_display = ('sid','sname','nickname','department', 'job', 'isjobed', 'jobedtime','ismanager')

admin.site.register(models.Student, StudentAdmin)

class  ProjectAdmin(admin.ModelAdmin):
	list_display = ('pid','pname','department', 'sid','stime','etime','place','checking','borrow','status')

admin.site.register(models.Project, ProjectAdmin)

class  AccountAdmin(admin.ModelAdmin):
	list_display = ('aid','pid','sid','money','stime','etime','checking','status')

admin.site.register(models.Account, AccountAdmin)

class  DepartmentAdmin(admin.ModelAdmin):
	list_display = ('did','dname')

admin.site.register(models.Department, DepartmentAdmin)

class  RoomrentAdmin(admin.ModelAdmin):
	list_display = ('rid','pid','sid','day')

admin.site.register(models.Roomrent, RoomrentAdmin)