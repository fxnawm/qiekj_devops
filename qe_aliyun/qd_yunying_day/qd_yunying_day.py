# coding=utf-8
import datetime
import pymysql
import os

start = '2019-01-19'
end = '2019-10-13'

datestart = datetime.datetime.strptime(start, '%Y-%m-%d')
dateend = datetime.datetime.strptime(end, '%Y-%m-%d')

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
    while datestart <= dateend:
        start = datestart.strftime('%Y-%m-%d')
        with open('qd_yunying_day.sql',encoding='utf-8') as f:
            insert_sql = f.read().replace('dateday',start)
        client = MySQL()
        client.insert_yunying_day(insert_sql)
        print(start)
        datestart += datetime.timedelta(days=1)