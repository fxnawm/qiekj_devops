import json
import os
import pymysql
import linecache

'''
, 
                
                host='qiekjads-3618c398.cn-shanghai-1.ads.aliyuncs.com',
									   user='***', passwd='***', db='qiekjads',
									   charset='utf8mb4', port=10001, 
'''

class MySQL:
	def __init__(self):
		try:
			self.con = pymysql.connect(host='192.168.5.21',
									   user='root', passwd='Qiekj@1qa2ws', db='qiekj',
									   charset='utf8', port=3307,)
			self.cursor = self.con.cursor()
		except Exception as e:
			msg = "\033[31;1mError:Can't connect,{}".format(e.args[1])
			print(msg)
			os._exit(0)

def inset_drds():
    id = 0
    cache_data = linecache.getlines('downloaded_data.txt')
    for line in range(len(cache_data)):
        content = cache_data[line]
        try:
            id += 1
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
            result = []
            result.append((id, machineId, model, uid, phone, msg2G, errMsg,bleMsg, platform, brand))
            if result:
                insert_re = "insert into alipay_log_week(id,machineId,model,uid,phone,msg2G,errMsg,bleMsg,platform,brand) values (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)"
                print(id)
                client = MySQL()
                client.cursor.executemany(insert_re, result)
                client.con.commit()
                #client.con.close()
            else:
                pass
        except Exception as e:
            print(e)

if __name__ == "__main__":
    inset_drds()


