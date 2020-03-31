import pymysql
import json

db = pymysql.connect(
    host = 'qiekjodps-404f1989.cn-shanghai-1.ads.aliyuncs.com',
    port = 10041,
    user = '***',
    passwd = '***',
    db = 'qiekjodps',
    charset = 'utf8mb4'
)

cursor = db.cursor()
sql = """SELECT
	o.order_no,
	o.pay_price,
	o.order_status,
	o.create_time,
	o.shop_name,
	m.phone	
FROM
	vip_order o
	LEFT JOIN t_member m ON o.user_id = m.id 
WHERE 	m.phone = '%s' or o.order_no = '%s' order by o.create_time desc"""
phone = '0020190602104927485959'
cursor.execute(sql %(phone,phone))
data = cursor.fetchall()
if data:
    count = len(data)
    count1 = len(data[0])
    for i in range(count):
        for j in range(count1):
            print(data[i][j],end=' ')
        print()
else:
    print('未查到订单号！')
db.close()

