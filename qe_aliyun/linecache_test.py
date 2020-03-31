import json
import os
import pymysql
import linecache

def get_content(path):
    if os.path.exists(path):
        cache_data = linecache.getlines(path)
        for line in range(len(cache_data)):
            content = cache_data[line]
            id = abs(hash(content))
            line = json.loads(content)['http_referer']
            request_uri = json.loads(content)['request_uri']
            shopid = str(line).split('&')[2].split('=')[1]
            machineid = str(line).split('&')[1].split('=')[1]
            # # content += cache_data[line]
            #print(type(content),content)
            print(id,shopid,machineid)
        return content
    else:
        print('the path [{}] is not exits!'.format(path))

def main():
    path = 'test_data.txt'
    content = get_content(path)
    print(content)

if __name__ == "__main__":
    main()



# class MySQL:
# 	def __init__(self):
# 		try:
# 			self.con = pymysql.connect(host='qiekjodps-404f1989.cn-shanghai-1.ads.aliyuncs.com',
# 									   user='***', passwd='***', db='qiekjodps',
# 									   charset='utf8mb4', port=10041, )
# 			self.cursor = self.con.cursor()
# 		except Exception as e:
# 			msg = "\033[31;1mError:Can't connect,{}".format(e.args[1])
# 			print(msg)
# 			os._exit(0)
#
# def inset_drds():
#     with open('test_data.txt',encoding='utf-8') as f:
#         while True:
#             try:
#                 lines = f.readline()
#                 id = abs(hash(lines))
#                 line = json.loads(lines)['http_referer']
#                 request_uri = json.loads(lines)['request_uri']
#                 shopid = str(line).split('&')[2].split('=')[1]
#                 machineid = str(line).split('&')[1].split('=')[1]
#                 result = []
#                 result.append((id,line,shopid,machineid,request_uri))
#                 print(result)
#                 insert_re = "insert into hemq_logdata(id,request_uri,shopid,machineid,result) values (%s,%s,%s,%s,%s)"
#                 client = MySQL()
#                 client.cursor.executemany(insert_re,result)
#                 # client.commit()
#             except Exception as e:
#                 print(str(e))
#                 break
#
# if __name__ == "__main__":
#     inset_drds()