#!/usr/bin/python
#-*- coding:utf-8 -*-
# Author: hemq

import requests
import json
import sys
import os

headers = {'Content-Type': 'application/json;charset=utf-8'}
api_url = "https://oapi.dingtalk.com/robot/send?access_token=ef1446cafaf9a53b136418289e0367d2a89aefbd004d06a03b7040eb034bfdda"

def msg(text):
    json_text = {
        "msgtype":"text",
        "at":{
            "atMobiles":["15805814076"],
            "isAtAll":False
        },
        "text":{
            "content":text
        }
    }
    print(requests.post(api_url,json.dumps(json_text),headers=headers).content)

if __name__ == '__main__':
    text = sys.argv[1]
    msg(text)