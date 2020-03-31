# coding=utf-8
import datetime
import pymysql
import os
from dateutil.relativedelta import relativedelta

'''
10月-11月上线的设备在10月、11月的支付宝订单数
'''


start = '2020-01'
end = '2020-02'

datestart = datetime.datetime.strptime(start, '%Y-%m')
dateend = datetime.datetime.strptime(end, '%Y-%m')

class MySQL:
    def __init__(self):
        try:
            self.con = pymysql.connect(host='***',
                                       user='***', passwd='***', db='***',
                                       charset='utf8mb4', port=3306, )
            self.cursor = self.con.cursor()
        except Exception as e:
            msg = "\033[31;1mError:Can't connect,{}".format(e.args[1])
            print(msg)
            os._exit(0)

    def insert_yunying_day(self, sql):
        self.cursor.execute(sql)

if __name__ == '__main__':
    while datestart <= dateend:
        start = datestart.strftime('%Y-%m')
        with open('hl_alipay_02.sql',encoding='utf-8') as f:
            insert_sql = f.read().replace('datestart',start)
        client = MySQL()
        client.insert_yunying_day(insert_sql)
        print(start)
        datestart += relativedelta(months=1)