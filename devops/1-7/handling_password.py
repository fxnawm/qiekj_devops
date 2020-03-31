import sys
import paramiko
import time

ip_address = '192.168.5.21'
username = 'root'
password = 'Qiekj@1115'
ssh_client = paramiko.SSHClient()
ssh_client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
ssh_client.load_system_host_keys()
ssh_client.connect(hostname=ip_address,username=username,password=password)
print("Successful connection",ip_address)
ssh_client.invoke_shell()
#remote_connection = ssh_client.exec_command('cd /data;mkdir work\n')
#remote_connection = ssh_client.exec_command('mkdir test_folder\n')
stdin, stdout, stderr = ssh_client.exec_command('ps -ef | grep mysql')
print(stdout.read().decode('utf-8'))
ssh_client.close()