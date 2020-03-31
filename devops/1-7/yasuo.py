# import shutil
# shutil.make_archive('work','zip','work1/')

# import tarfile
#
# tar_file = tarfile.open('work.tar.gz','w:gz')
# for name in ['welcome.py', 'hello.py', 'hello.txt', 'sample.txt', 'sample1.txt']:
#     tar_file.add(name)
# tar_file.close()

import tarfile
tar_file = tarfile.open('work.tar.gz','r:gz')
print(tar_file.getnames())