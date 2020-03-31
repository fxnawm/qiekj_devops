# from webob import Request,Response
# from webob.dec import wsgify
# from wsgiref.simple_server import make_server
# from webob.exc import HTTPNotFound
#
# class Router:
#     ROUTETABLE = {}
#
#     @classmethod
#     def register(cls,path):
#         def wrapper(handler):
#             cls.ROUTETABLE[path] = handler
#             return handler
#         return wrapper
#
# @Router.register('/')
# def indexhandler(request):
#     return '<h1>企鹅科技欢迎你！</h1>'
# @Router.register('/python')
# def pythonhandler(request):
#     return '<h1>Welcome to qiekj</h1>'
#
# class App:
#     _Router = Router
#
#     @wsgify
#     def __call__(self, request:Request):
#         try:
#             return self._Router.ROUTETABLE[request.path](request)
#         except:
#             raise HTTPNotFound('<h1>你访问的页面被外星人劫持了！</h1>')
#
# if __name__ == '__main__':
#     ip = '127.0.0.1'
#     port = 9999
#     server = make_server(ip,port,App())
#     try:
#         server.serve_forever()
#     except KeyboardInterrupt:
#         server.shutdown()
#         server.server_close()

# from webob import Request,Response
# from webob.dec import wsgify
# from wsgiref.simple_server import make_server
# from webob.exc import HTTPNotFound
# import re
#
# class Router:
#     ROUTETABLE = []  # 列表，有序的
#
#     @classmethod # 注册路由，装饰器
#     def route(cls,pattern,*methods):
#         def wrapper(handler):
#             cls.ROUTETABLE.append((tuple(map(lambda x:x.upper(),methods)),re.compile(pattern),handler)) # 预编译正则对象，处理函数
#             return handler
#         return wrapper
#
#     @classmethod
#     def get(cls,pattern):
#         return cls.route(pattern,'GET')
#
#     @classmethod
#     def post(cls,pattern):
#         return cls.route(pattern,'POST')
#
#     @classmethod
#     def head(cls,pattern):
#         return cls.route(pattern,'HEAD')
#
# @Router.get(r'^/$')
# @Router.route(r'^/(?P<id>\d+)$')
# def indexhandler(request):
#     print(request.groups)
#     print(request.groupdict)
#     return '<h1>企鹅科技欢迎你！</h1>'
#
# @Router.get('^/python$')
# def pythonhandler(request):
#     res = Response()
#     res.charset = 'utf-8'
#     res.body = '<h1>Welcome to qiekj</h1>'.encode()
#     return res
#
# class App:
#     _Router = Router
#
#     @wsgify
#     def __call__(self, request:Request):
#         for methods,pattern,handler in self._Router.ROUTETABLE:
#             if not methods or request.method.upper() in methods:
#                 matcher = pattern.match(request.path)
#                 if matcher: # 正则匹配
#                     # 动态为request增加属性
#                     request.groups = matcher.groups() # 所有分组组成的元祖，包括命名分组
#                     request.groupdict = matcher.groupdict() # 命名分组组成的字典
#                     return handler(request)
#         raise HTTPNotFound('<h1>你访问的页面被外星人劫持了！</h1>')
# if __name__ == '__main__':
#     ip = '127.0.0.1'
#     port = 9999
#     server = make_server(ip,port,App())
#     try:
#         server.serve_forever() # server.handle_request() 一次
#     except KeyboardInterrupt:
#         server.shutdown()
#         server.server_close()

from webob import Response,Request
from webob.dec import wsgify
from wsgiref.simple_server import make_server
from webob.exc import HTTPNotFound
import re

class AttrDict:
    def __init__(self,d:dict):
        self.__dict__.update(d if isinstance(d,dict) else {})

    def __setattr__(self, key, value):
        raise NotImplementedError

    def __repr__(self):
        return "<AttrDict {}>".format(self.__dict__)

    def __len__(self):
        return len(self.__dict__)



class Router:
    def __init__(self,prefix:str=''):
        self.__prefix = prefix.rstrip('/\\') #前缀，例如：/product
        self.__routetable = [] #存三元组，列表，有序的

    def route(self,pattern,*methods): #注册路由，装饰器
        def wrapper(handler):
            self.__routetable.append(
                (tuple(map(lambda x:x.upper(),methods)),re.compile(pattern),handler))
            return handler
        return wrapper

    def get(self,pattern):
        return self.route(pattern,'GET')
    def post(self,pattern):
        return self.route(pattern,'POST')
    def head(self,pattern):
        return self.route(pattern,'HEAD')

    def match(self,request:Request):
        # 必须先匹配前缀
        if not request.path.startswith(self.__prefix):
            return None
        # 前缀匹配，说明必须这个Router实例处理，后序匹配不上，依然返回None
        for methods,pattern,handler in self.__routetable:
            if not methods or request.method.upper() in methods:
                matcher = pattern.match(request.path.replace(self.__prefix,'',1))
                if matcher:
                    request.groups = matcher.group()
                    request.groupdict = matcher.groupdict()
                    return handler(request)

class App:
    _ROUTERS = []

    @classmethod
    def register(cls,*routers:Router):
        for router in routers:
            cls._ROUTERS.append(router)

    @wsgify
    def __call__(self, request:Request):
        for router in self._ROUTERS:
            response = router.match(request)
            if response:
                return response
        raise HTTPNotFound('<h1>您访问的页面被外星人劫持了</h1>')

idx = Router()
py = Router('/python')
li = Router('/linux')
user = Router('/user')
App.register(idx,py)
App.register(user)

@idx.get(r'^/$')
@idx.route(r'^/(?P<id>\d+)$')
def indexhandler(request):
    print(request.groups)
    print(request.groupdict)
    return '<h1>企鹅科技欢迎您！</h1>'.encode()

@py.get('^/(\w+)$')
def pythonhandler(request):
    res = Response()
    res.charset = 'utf-8'
    res.body = '<h1>Welcome to Python</h1>'.encode()
    return res

@li.get('^/(\w+)$')
def linuxhandler(request):
    res = Response
    res.charset = 'utf-8'
    res.body = '<h1>Welcome to Linux</h1>'.encode()
    return res

@user.get(r'^/?$')
def userhandler(request):
    userlist = [
        (3, 'tom', 20),
        (5, 'jerry', 16),
        (6, 'asm', 23),
        (8, 'kevin', 18)
    ]

    d = {'userlist': userlist, 'usercount': len(userlist)}
    return render('index.html',d)

if __name__ == '__main__':
    ip = '127.0.0.1'
    port = 9999
    server = make_server(ip,port,App())
    try:
        server.serve_forever()
    except KeyboardInterrupt:
        server.shutdown()
        server.server_close()


































