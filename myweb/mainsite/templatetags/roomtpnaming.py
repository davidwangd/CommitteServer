# -*- coding: utf-8 -*-
from django import template
import sys
sys.path.append('../../')
import mainsite

register=template.Library() 

@register.filter
def roomtpnaming(type):
	roomtp = ('教室', '会议室', '报告厅')
	return roomtp[type]