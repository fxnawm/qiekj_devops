import json

import linecache

id = 0
cache_data = linecache.getlines('zuotian_log.txt')
for line in range(len(cache_data)):
    content = cache_data[line]
    try:
        id+=1
        machineId = str(json.loads(content)['machineId'])
        model = str(json.loads(content)['model'])
        uid = str(json.loads(json.loads(content)['user'])['uid'])
        phone = str(json.loads(json.loads(content)['user'])['phone'])
        msg2G = str(json.loads(content)['msg2G'])
        errMsg = str(json.loads(content)['errMsg'])
        try:
            bleMsg = str(json.loads(content)['bleMsg'])
        except Exception as e:
            bleMsg = ''
        platform = str(json.loads(content)['platform'])
        brand = str(json.loads(content)['brand'])
        print(id,machineId,model,uid,phone,msg2G,bleMsg,errMsg,platform,brand)
        # result = []
        # result.append((id,machineId,model,uid,phone,msg2G,errMsg,platform,brand))
        # #print(result)
        # if result:
        #     insert_re = "insert into hemq_ad(id,machineId,model,uid,phone,msg2G,errMsg,platform,brand) values (%s,%s,%s,%s,%s,%s,%s,%s,%s)"
        #     print(insert_re)
        #     client = MySQL()
        #     client.cursor.executemany(insert_re, result)
        #     client.con.commit()
        # else:
        #     pass
    except Exception as e:
        print(e)

