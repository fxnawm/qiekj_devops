# import tarfile,shutil
# shutil.make_archive('work_sample','gztar',root_dir='..',base_dir='work')
# print('Archive contents:')
# with tarfile.open('work_sample.tar.gz','r') as t_file:
#     for names in t_file.getnames():
#         print(names)

# import shutil,os,tarfile
# print('create archive')
# shutil.make_archive('work','tar',root_dir='..',base_dir='work')
# print('\nArchive contents:')
# with tarfile.open('work.tar','r') as t_file:
#     for names in t_file.getnames():
#         print(names)
#
#     os.system('touch sample.txt')
#     with tarfile.open('work.tar','a') as a_file:
#         a_file.add('sample.txt')
#     print('contents:')
#     with tarfile.open('work.tar','r') as t_file:
#         print([m.name for m in t_file.getmembers()])

# import tarfile,time
#
# with tarfile.open('work.tar','r') as t:
#     for file_info in t.getmembers():
#         print(file_info.name)
#         print('Size:',file_info.size,'bytes')
#         print('Type:',file_info.type)

import tarfile,os

os.mkdir('work')
with tarfile.open('work.tar','r') as t:
    t.extractall('work')

print(os.listdir('work'))