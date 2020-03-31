import pymysql
import json

# db = pymysql.connect(
#     host = 'rr-uf68kn40560r4i20oho.mysql.rds.aliyuncs.com',
#     port = 3306,
#     user = 'hemq',
#     passwd = '8162393@Hr',
#     db = 'qiekj_statis',
#     charset = 'utf8mb4'
# )
#
# cursor = db.cursor()
# sql = "select state from iot_device_cmdback where imei='%s' and length(state)>50 limit 1"
# imei = '865933035996152'
# cursor.execute(sql % imei)
# data = cursor.fetchall()
# if data:
#     data_dic = json.loads(data[0][0])
#     print(data_dic['Simiccid'])
# else:
#     print('None')
# db.close()

db = pymysql.connect(
    host = 'qiekjodps-404f1989.cn-shanghai-1.ads.aliyuncs.com',
    port = 10041,
    user = '***',
    passwd = '***',
    db = 'qiekjodps',
    charset = 'utf8mb4'
)

cursor = db.cursor()
sql = """select ccid from module where imei ='%s'"""
imei = '869300038701185'
cursor.execute(sql % imei)
print(cursor.fetchall()[0][0])
db.close()

