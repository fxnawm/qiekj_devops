from wsgiref.simple_server import make_server,demo_app
import webob
from webob.dec import wsgify
from webob import Response,Request


def application(environ:dict,start_response):
    # 请求处理
    request = webob.Request(environ)
    print(request.method)
    print(request.path)
    print(request.query_string)
    print(request.GET)
    print(request.POST)
    print('params = {}'.format(request.params))

    # 响应处理
    res = webob.Response()
    res.status = 200
    print(res.content_type)
    html = '<h1>企鹅科技欢迎你</h1>'.encode('utf-8')

# @wsgify
# def app(request:webob.Request) -> webob.Response:
#     print(request.method)
#     print(request.path)
#     print(request.query_string)
#     print(request.GET)
#     print(request.POST)
#     print('params = {}'.format(request.params))
#     res = webob.Response('<h1>企鹅科技欢迎你</h1>')
#     return res

# class App:
#     @wsgify
#     def __call__(self, request:Request):
#         return '<h1>企鹅科技欢迎你</h1>'
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









































































