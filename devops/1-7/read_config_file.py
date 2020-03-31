# from configparser import ConfigParser
#
# p = ConfigParser()
# p.read('read_simple.ini')
# print(p.get('bug_tracker','url'))

from configparser import ConfigParser

p = ConfigParser()
files = ['hello.ini','bye.ini','read_simple.ini','welcome.ini']
files_found = p.read(files)
files_missing = set(files) - set(files_found)

print('Files found:',sorted(files_found))

print('Files missing:',sorted(files_missing))