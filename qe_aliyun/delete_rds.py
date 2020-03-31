import pymysql
import time
import datetime

db = pymysql.connect(
    host = 'rm-uf6vqbk67o5090gg8ko.mysql.rds.aliyuncs.com',
    port = 3306,
    user = '***',
    passwd = '***',
    db = 'qiekj_iot',
    charset = 'utf8mb4'
)

cursor = db.cursor()

x = 0
flag = True
starttime = time.time()
while flag:
    x += 1
    if x == 600:
        flag = False
    cursor.execute("DELETE FROM	iot_device_cmdback WHERE	cmd NOT IN ( '0200040600', '000000060400', '0200040309', '020004060600', '000000060000', '020004060100', '0200040308', '000000060200', '000000060100' ) 	LIMIT 10000;")
    db.commit()
    time.sleep(0.2)
endtime = time.time()
sj = endtime-starttime
print(sj)
db.close()