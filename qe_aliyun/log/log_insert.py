import json
import os
import pymysql
import linecache

class MySQL:
	def __init__(self):
		try:
			self.con = pymysql.connect(host='qiekjodps-404f1989.cn-shanghai-1.ads.aliyuncs.com',
									   user='***', passwd='***', db='qiekjodps',
									   charset='utf8mb4', port=10041, )
			self.cursor = self.con.cursor()
		except Exception as e:
			msg = "\033[31;1mError:Can't connect,{}".format(e.args[1])
			print(msg)
			os._exit(0)

def inset_drds():
    cache_data = linecache.getlines('downloaded_data.txt')
    with open('new_sql.txt','a+',encoding='utf8') as f:
        for line in range(len(cache_data)):
            try:
                content = cache_data[line]
                # response_time = json.loads(content)['response_time']
                # sql = json.loads(content)['sql']
                # user = json.loads(content)['user']
                # sql_type = json.loads(content)['sql_type']
                # db_name = json.loads(content)['db_name']
                # data = db_name + '\t' + user + '\t' + sql_type + '\t' + response_time +'\t'+sql
                data = json.loads(content)['orderNo']
                data = "'" + data + "',"
                f.write(data+'\n')

                # result = []
                # result.append((line))
                # insert_re = "insert into logdata(request_uri) values (%s)"
                # client = MySQL()
                # client.cursor.executemany(insert_re,result)
            except Exception as e:
                print(str(e))
                break

if __name__ == "__main__":
    inset_drds()


