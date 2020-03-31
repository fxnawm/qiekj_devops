# coding=utf-8
import datetime
import pymysql
import os
from dateutil.relativedelta import relativedelta

start = '2018-01'
end = '2019-12'

datestart = datetime.datetime.strptime(start, '%Y-%m')
dateend = datetime.datetime.strptime(end, '%Y-%m')

#dates = ['2017-09','2017-12','2018-03','2018-06','2018-09','2018-12','2019-03','2019-06','2019-09']

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
        with open('gzms_qt_sbs.sql',encoding='utf-8') as f:
            gzms_qt_sbs = f.read().replace('dateday',start)
        with open('gzms_xyj_sbs.sql',encoding='utf-8') as f:
            gzms_xyj_sbs = f.read().replace('dateday',start)
        with open('gzms_ysj_sbs.sql',encoding='utf-8') as f:
            gzms_ysj_sbs = f.read().replace('dateday',start)
        with open('jmms_qt_sbs.sql',encoding='utf-8') as f:
            jmms_qt_sbs = f.read().replace('dateday',start)
        with open('jmms_xyj_sbs.sql',encoding='utf-8') as f:
            jmms_xyj_sbs = f.read().replace('dateday',start)
        with open('jmms_ysj_sbs.sql',encoding='utf-8') as f:
            jmms_ysj_sbs = f.read().replace('dateday',start)
        with open('lyms_qt_sbs.sql',encoding='utf-8') as f:
            lyms_qt_sbs = f.read().replace('dateday',start)
        with open('lyms_xyj_sbs.sql',encoding='utf-8') as f:
            lyms_xyj_sbs = f.read().replace('dateday',start)
        with open('lyms_ysj_sbs.sql',encoding='utf-8') as f:
            lyms_ysj_sbs = f.read().replace('dateday',start)
        client = MySQL()
        client.insert_yunying_day(gzms_qt_sbs)
        client.insert_yunying_day(gzms_xyj_sbs)
        client.insert_yunying_day(gzms_ysj_sbs)
        client.insert_yunying_day(jmms_qt_sbs)
        client.insert_yunying_day(jmms_xyj_sbs)
        client.insert_yunying_day(jmms_ysj_sbs)
        client.insert_yunying_day(lyms_qt_sbs)
        client.insert_yunying_day(lyms_xyj_sbs)
        client.insert_yunying_day(lyms_ysj_sbs)
        print(start)
        datestart = datestart + relativedelta(months=1)