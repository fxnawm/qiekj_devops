# encoding=utf-8
import pymysql
import openpyxl
from datetime import datetime,date,timedelta
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart
from email.header import Header
import smtplib

from_date = (date.today() + timedelta(days = -7)).strftime("%Y-%m-%d")
to_date = (date.today() + timedelta(days = -1)).strftime("%Y-%m-%d")

my_file_name = '企鹅科技'+from_date+'至'+to_date+'订单数.xlsx'

print('attachment; filename=' + '"' + my_file_name +'"')