import json
import os
import pymysql
import linecache

class MySQL:
	def __init__(self):
		try:
			self.con = pymysql.connect(host='192.168.5.21',
									   user='root', passwd='***', db='hemq',
									   charset='utf8', port=3306, )
			self.cursor = self.con.cursor()
		except Exception as e:
			msg = "\033[31;1mError:Can't connect,{}".format(e.args[1])
			print(msg)
			os._exit(0)

def inset_drds():
    cache_data = linecache.getlines('tbt.txt')
    for line in range(len(cache_data)):
        try:
            content = cache_data[line]
            ad = json.loads(content)['holder_address']
            ce = json.loads(content)['balance']
            ce = int(ce)/1000000000000000000
            result = []
            result.append((ad, ce))
            print(result)
            if result:
                insert_re = "insert into hemq_ad(ad,ce) values (%s,%s)"
                client = MySQL()
                client.cursor.executemany(insert_re, result)
                client.con.commit()
            else:
                pass
        except Exception as e:
            print(str(e))
            break
if __name__ == "__main__":
    inset_drds()