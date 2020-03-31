# coding=utf-8
import datetime
import pymysql
import os
from dateutil.relativedelta import relativedelta

start = '2018-01'
end = '2019-12'

datestart = datetime.datetime.strptime(start, '%Y-%m')
dateend = datetime.datetime.strptime(end, '%Y-%m')

start1 = '2018-02-01'
end1 = '2020-01-01'

datestart1 = datetime.datetime.strptime(start1, '%Y-%m-%d')
dateend1 = datetime.datetime.strptime(end1, '%Y-%m-%d')
class MySQL:
    def __init__(self):
        try:
            self.con = pymysql.connect(host='qiekjads-3618c398.cn-shanghai-1.ads.aliyuncs.com',
                                       user='***', passwd='***', db='qiekjads',
                                       charset='utf8mb4', port=10001, )
            self.cursor = self.con.cursor()
        except Exception as e:
            msg = "\033[31;1mError:Can't connect,{}".format(e.args[1])
            print(msg)
            os._exit(0)

    def insert_yunying_day(self, sql):
        self.cursor.execute(sql)

if __name__ == '__main__':
    #for start in dates:
    while datestart <= dateend:
        start = datestart.strftime('%Y-%m')
        start1 = datestart1.strftime('%Y-%m-%d')
        with open('jmms_qt_je.sql',encoding='utf-8') as f:
            jmms_qt_je = f.read().replace('dateday',start)
            jmms_qt_je = jmms_qt_je.replace('createdate',start1)
        with open('jmms_xyj_je.sql',encoding='utf-8') as f:
            jmms_xyj_je = f.read().replace('dateday',start)
            jmms_xyj_je = jmms_xyj_je.replace('createdate',start1)
        with open('jmms_ysj_je.sql',encoding='utf-8') as f:
            jmms_ysj_je = f.read().replace('dateday',start)
            jmms_ysj_je = jmms_ysj_je.replace('createdate',start1)
        with open('lyms_qt_je.sql',encoding='utf-8') as f:
            lyms_qt_je = f.read().replace('dateday',start)
            lyms_qt_je = lyms_qt_je.replace('createdate',start1)
        with open('lyms_xyj_je.sql',encoding='utf-8') as f:
            lyms_xyj_je = f.read().replace('dateday',start)
            lyms_xyj_je = lyms_xyj_je.replace('createdate',start1)
        with open('lyms_ysj_je.sql',encoding='utf-8') as f:
            lyms_ysj_je = f.read().replace('dateday',start)
            lyms_ysj_je = lyms_ysj_je.replace('createdate',start1)
        with open('zgms_qt_je.sql',encoding='utf-8') as f:
            zgms_qt_je = f.read().replace('dateday',start)
            zgms_qt_je = zgms_qt_je.replace('createdate',start1)
        with open('zgms_xyj_je.sql',encoding='utf-8') as f:
            zgms_xyj_je = f.read().replace('dateday',start)
            zgms_xyj_je = zgms_xyj_je.replace('createdate',start1)
        with open('zgms_ysj_je.sql',encoding='utf-8') as f:
            zgms_ysj_je = f.read().replace('dateday',start)
            zgms_ysj_je = zgms_ysj_je.replace('createdate',start1)
        client = MySQL()
        client.insert_yunying_day(jmms_qt_je)
        client.insert_yunying_day(jmms_xyj_je)
        client.insert_yunying_day(jmms_ysj_je)
        client.insert_yunying_day(lyms_qt_je)
        client.insert_yunying_day(lyms_xyj_je)
        client.insert_yunying_day(lyms_ysj_je)
        client.insert_yunying_day(zgms_qt_je)
        client.insert_yunying_day(zgms_xyj_je)
        client.insert_yunying_day(zgms_ysj_je)
        print(start, start1)
        datestart = datestart + relativedelta(months=1)
        datestart1 = datestart1 + relativedelta(months=1)