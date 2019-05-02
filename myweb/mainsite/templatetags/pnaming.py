# -*- coding: utf-8 -*-
from django import template
import sys
sys.path.append('../../')
import mainsite

register=template.Library() 

@register.filter
def pnaming(ppid):
	project = mainsite.models.Project.objects.get(pid=ppid)
	return project.pname