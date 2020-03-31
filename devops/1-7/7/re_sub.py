import re

str_line = 'Peter Piper picked a peck of pickled peppers. How many pickled peppers did Peter Piper pick?'

print('old: ',str_line)
p = re.subn('Peter','Mary ',str_line)
print('new: ',p)