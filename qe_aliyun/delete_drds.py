import pymysql
import time
import datetime

db = pymysql.connect(
    host = 'drdsfacb44lv8021public.drds.aliyuncs.com',
    port = 3306,
    user = 'qiekj_orders',
    passwd = '3&3A$hAYCJ8eJy8t',
    db = 'qiekj_orders',
    charset = 'utf8mb4'
)

cursor = db.cursor()

x = 0
flag = True
starttime = time.time()
while flag:
    x += 1
    if x == 5193:
        flag = False
    cursor.execute("delete from  voucher_user where status=2 and create_time<'2019-05-01 00:00:00' limit 2000")
    # data = cursor.fetchall()
    # data = str(data)
    # data = data.replace('(','')
    # data = data.replace(',)','')
    # data = data.replace(')','')
    # sql = "delete from t_machine_work_test where id in (%s)"
    # cursor.execute(sql % data)
    db.commit()
    time.sleep(0.2)
endtime = time.time()
sj = endtime-starttime
print(sj)
db.close()