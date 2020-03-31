import getpass

user_name = getpass.getpass()
print('User name: %s' %user_name)

while True:
    passwd = getpass.getpass("Enter your password:")
    if passwd.lower() == '123':
        print('Welcome!')
        break
    else:
        print('The password entered is incorrect!!')