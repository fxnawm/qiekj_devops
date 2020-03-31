a = 35
b = 37

try:
    c = a + b
    print(c)
    d = b / 0
    print(d)
except:
    print('division by zero is not possible')