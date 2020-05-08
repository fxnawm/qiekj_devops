# -*- coding:utf-8 -*-
# def my_asb(x):
#     if not isinstance(x,(int,float)):
#         raise TypeError('Bad Type Error!')
#     if x >= 0:
#         return x
#     else:
#         return -x
#
# try:
#     print(my_asb('A'))
# except:
#     pass

# import math
#
# def move(x,y,step,angle=0):
#     nx = x + step * math.cos(angle)
#     ny = y - step * math.sin(angle)
#     return nx,ny
#
# r = move(100,100,60,math.pi / 6)
#
# print(r)

# def power(x,n):
#     s = 1
#     while n > 0:
#         n = n - 1
#         s = s * x
#     return s


# def fib(max):
#     n,a,b = 0,0,1
#     while n < max:
#         print(b)
#         a,b = b,a + b
#         n = n + 1
#     return 'done'
#
# fib(10)

# def add(x,y,f):
#     return f(x) + f(y)
#
# print(add(-5,6,abs))

#
# from functools import reduce
# def fn(x,y):
#     return x*10+y
#
# print(reduce(fn,[1,3,5,7,9]))


# def _odd_iter():
#     n = 1
#     while True:
#         n = n + 2
#         yield n
#
# def _not_divisible(n):
#     return lambda x:x%n>0
#
# def primes(n):
#     yield 2
#     it = _odd_iter()
#     while True:
#         n = next(it)
#         yield n
#         it = filter(_not_divisible(n),it)
#
# for n in primes(1000):
#     if n < 1000:
#         print(n)
#     else:
#         break




# def count():
#     fs = []
#     for i in range(1,4):
#         def f():
#             return i*i
#         fs.append(f)
#     return fs
#
# f1,f2,f3 = count()
#
#
# print(f1(),f2(),f3())

def log(func):
    def wrapper(*wargs,**kw):
        print('call %s()' % func.__name__)
        return func(*wargs,**kw)
    return wrapper

@log
def now():
    print('2020-04-20')



now()























