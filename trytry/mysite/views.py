# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.http import HttpResponse
from django.shortcuts import render
from .models import Student

# Create your views here.

def index(requeset):
	students = Student.objects.all()
	std_lists = list()
	for count, post in enumerate(students):
		std_lists.append("No.{}:".format(str(count))++str(post)+"<br>")
	return HttpResponse(std_lists)

