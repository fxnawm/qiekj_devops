#!/usr/bin/env python
# coding: utf-8

import pymysql
import gevent
import time
import json
import linecache


class MyPyMysql:
    def __init__(self, host, port, username, password, db, charset='utf8'):
        self.host = host  # mysql主机地址
        self.port = port  # mysql端口
        self.username = username  # mysql远程连接用户名
        self.password = password  # mysql远程连接密码
        self.db = db  # mysql使用的数据库名
        self.charset = charset  # mysql使用的字符编码,默认为utf8
        self.pymysql_connect()  # __init__初始化之后，执行的函数

    def pymysql_connect(self):
        # pymysql连接mysql数据库
        # 需要的参数host,port,user,password,db,charset
        self.conn = pymysql.connect(host=self.host,
                                    port=self.port,
                                    user=self.username,
                                    password=self.password,
                                    db=self.db,
                                    charset=self.charset
                                    )
        # 连接mysql后执行的函数
        self.asynchronous()

    def run(self, nmin, nmax):
        # 创建游标
        self.cur = self.conn.cursor()

        # 定义sql语句,插入数据id,name,gender,email
        sql = "insert into hemq_logdata(id,request_uri,shopid,machineid,result) values (%s,%s,%s,%s,%s)"

        # 定义总插入行数为一个空列表
        data_list = []
        cache_data = linecache.getlines('test_data.txt')

        for i in range(nmin, nmax):
            if i < len(cache_data):
                # 添加所有任务到总的任务列表
                content = cache_data[i]
                http_referer = json.loads(content)['http_referer']
                request_uri = json.loads(content)['request_uri']
                http_split = str(http_referer).split('&')
                if len(http_split)>2:
                    shopid = http_split[2].split('=')[1]
                    machineid = http_split[1].split('=')[1]
                    result = (i, http_referer,shopid,machineid,request_uri)
                    data_list.append(result)
                else:
                    pass
            else:
                pass

        # 执行多行插入，executemany(sql语句,数据(需一个元组类型))
        content_data = self.cur.executemany(sql, data_list)
        if content_data:
            print('成功插入第{}条数据'.format(nmax - 1))

        # 提交数据,必须提交，不然数据不会保存
        self.conn.commit()

    def asynchronous(self):
        # g_l 任务列表
        # 定义了异步的函数: 这里用到了一个gevent.spawn方法
        max_line = 10000  # 定义每次最大插入行数(max_line=10000,即一次插入10000行)
        g_l = [gevent.spawn(self.run, i, i + max_line) for i in range(1, 30000, max_line)]

        # gevent.joinall 等待所以操作都执行完毕
        gevent.joinall(g_l)
        self.cur.close()  # 关闭游标
        self.conn.close()  # 关闭pymysql连接


if __name__ == '__main__':
    start_time = time.time()  # 计算程序开始时间
    st = MyPyMysql('qiekjodps-404f1989.cn-shanghai-1.ads.aliyuncs.com', 10041, '***', '***', 'qiekjodps')  # 实例化类，传入必要参数
    print('程序耗时{:.2f}'.format(time.time() - start_time))  # 计算程序总耗时