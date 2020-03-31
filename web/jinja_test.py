from jinja2 import Environment,PackageLoader,FileSystemLoader

env = Environment(loader=FileSystemLoader('webarch/templates'))

template = env.get_template('index.html')

userlist = [
    (3,'tom',20),
    (5,'jerry',16),
    (6,'asm',23),
    (8,'kevin',18)
]

d = {'userlist':userlist,'usercount':len(userlist)}
print(template.render(**d))