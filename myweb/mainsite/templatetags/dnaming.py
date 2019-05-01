# -*- coding: utf-8 -*-
from django import template

register=template.Library() 

@register.filter
def dnaming(did):
	bumen = {
		'01': '文艺部', 
		'02': '学术部', 
		'03': '体育部', 
		'04': '外联部', 
		'05': '国际部', 
		'06': '新媒体中心', 
		'07': '组织部', 
		'08': '班联部', 
		'09': '实践部', 
		'10': '信息事务部', 
		'11': '监察部',
	}
	return bumen[did]