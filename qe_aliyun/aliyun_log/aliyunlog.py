# encoding: utf-8
from time import time
from aliyun.log import LogClient
from aliyun.log import GetLogsRequest
import re
import requests

'''
匹配订单号：0[1-6]2019\d{16}
'''

# “华东 1 (杭州)” Region 的日志服务入口。
endpoint = 'cn-shanghai.log.aliyuncs.com'
# 用户访问秘钥对中的 AccessKeyId。
accessKeyId = '***'
# 用户访问秘钥对中的 AccessKeySecret。
accessKey = '***'
# 使用client的方法来操作日志服务
client = LogClient(endpoint, accessKeyId, accessKey)

#列出本region下面的所有可见项目
# res = client.get_project('qiekj-edas-log')
# res.log_print()

# 获取日志信息
# request = GetLogsRequest('qiekj-edas-log','user-log', fromTime=int(time()-3600), toTime=int(time()), topic='', query="*", line=100, offset=0, reverse=False)

# request = GetLogsRequest('qiekj-edas-log','user-log', fromTime="2018-1-1 10:10:10", toTime="2018-1-1 10:20:10", topic='', query="*", line=100, offset=0, reverse=False)

request = GetLogsRequest('qiekj-edas-log','user-log',fromTime="2019-11-05 16:45:17+08:00", toTime="2019-11-12 16:45:17+08:00", topic='', query="* and 支付推送失败", line=100, offset=0, reverse=False)

res = client.get_logs(request)

# print(res.get_count())

# for log in res.get_body():
#     line = re.findall(r'0[1-6]2019\d{16}',log['log'])
#     print(line)

for log in res.get_body():
    line = str(re.findall(r'0[1-6]2019\d{16}',log['log']))
    line = line.replace("['",'https://pre-userapi.qiekj.com/order/sync?token=ae13882d8a074b9496e8a77e12033eed&payType=11&orderNo=')
    line = line.replace("']",'&password=fb07e5de76dc54ed5187f9ecc7bfd7fd')
    print(line)
