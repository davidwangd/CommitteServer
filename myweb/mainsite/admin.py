# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib import admin
from mainsite import models
from .models import Student

# Register your models here.

class  StudentAdmin(admin.ModelAdmin):
	list_display = ('sid','sname','nickname','ismanager')

admin.site.register(models.Student, StudentAdmin)