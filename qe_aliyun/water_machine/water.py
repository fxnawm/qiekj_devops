# coding=utf-8
import datetime
import pymysql
import os

start = '2016-06-01'
end = '2017-01-01'

datestart = datetime.datetime.strptime(start, '%Y-%m-%d')
dateend = datetime.datetime.strptime(end, '%Y-%m-%d')

while datestart <= dateend:
    print(datestart.strftime('%Y-%m-%d'))
    datestart += datetime.timedelta(days=1)



#
# class MySQL:
#     def __init__(self):
#         try:
#             self.con = pymysql.connect(host='***',
#                                        user='***', passwd='***', db='qiekj_orders_c4ul_0000',
#                                        charset='utf8mb4', port=3306, )
#             self.cursor = self.con.cursor()
#         except Exception as e:
#             msg = "\033[31;1mError:Can't connect,{}".format(e.args[1])
#             print(msg)
#             os._exit(0)
#
#     def check_machine_work(self, sql):
#         self.cursor.execute(sql)
#         return self.cursor.fetchall()
#
#     def update_machine_work(self, sql):
#         self.cursor.execute(sql)
#         return self.cursor.fetchall()
#
#     def update_machine(self, sql):
#         self.cursor.execute(sql)
#         return self.cursor.fetchall()
#
# if __name__ == '__main__':
#     with open('check_machine_work.sql',encoding='utf-8') as f:
#         check_sql = f.read()
#     with open('update_machine_work.sql',encoding='utf-8') as f:
#         update_machine_work_sql = f.read()
#     with open('update_machine.sql',encoding='utf-8') as f:
#         update_machine_sql = f.read()
#     client = MySQL()
#     data = client.check_machine_work(check_sql)
#     data = int(data[0][0])
#     if data >= 200:
#         client.update_machine_work(update_machine_work_sql)
#         client.update_machine(update_machine_sql)
#         client.con.commit()
#         client.con.close()