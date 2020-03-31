import pymysql
import time
import datetime

db = pymysql.connect(
    host = 'qiekjodps-404f1989.cn-shanghai-1.ads.aliyuncs.com',
    port = 10041,
    user = 'LTAIRJ1I0O7F39l5',
    passwd = 'y39zEXrz2n5ww9CoYjvYbcPgP8cjd7',
    db = 'qiekjodps',
    charset = 'utf8mb4'
)

cursor = db.cursor()

x = 0
flag = True
starttime = time.time()
while flag:
    x += 1
    if x == 10:
        flag = False
    cursor.execute("select id from t_machine_work_test where starttime<'2019-04-01 00:00:00' limit 1000")
    data = cursor.fetchall()
    data = str(data)
    data = data.replace('(','')
    data = data.replace(',)','')
    data = data.replace(')','')
    sql = "delete from t_machine_work_test where id in (%s)"
    cursor.execute(sql % data)
    db.commit()
    time.sleep(0.2)
endtime = time.time()
sj = endtime-starttime
print(sj)
db.close()