#!/usr/bin/env python
#coding=utf-8

from aliyunsdkcore.client import AcsClient
from aliyunsdkcore.acs_exception.exceptions import ClientException
from aliyunsdkcore.acs_exception.exceptions import ServerException
from aliyunsdkcms.request.v20190101.DescribeMonitorGroupsRequest import DescribeMonitorGroupsRequest
from aliyunsdkcms.request.v20190101.DeleteMonitorGroupRequest import DeleteMonitorGroupRequest
import json

def DeleteMonitor(groupid,client):
    request = DeleteMonitorGroupRequest()
    request.set_accept_format('json')
    request.set_GroupId(groupid)
    response = client.do_action_with_exception(request)
    return response


client = AcsClient('***', '***', 'cn-shanghai')

request = DescribeMonitorGroupsRequest()
request.set_accept_format('json')

request.set_PageSize(50)
request.set_Keyword("machine")

response = client.do_action_with_exception(request)
userinfo = json.loads(response)
total = int(userinfo['Total'])
i = 0
flag = True
while flag:
    gid = userinfo['Resources']['Resource'][i]['GroupId']
    DeleteMonitor(gid,client)
    i += 1
    if total <= i:
        flag = False

