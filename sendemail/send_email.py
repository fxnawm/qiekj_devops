import smtplib
from email.mime.text import MIMEText

host_name = 'smtp.qiekj.com'
prot = 465

u_name = 'service@qiekj.com'
password = '***'
sender = '企鹅科技'

# 发件人
receivers = ['hmq@qiekj.com','314805693@qq.com']

# 邮件内容
text = MIMEText('企鹅科技2020-03-05至2020-03-12订单数')
# 邮件标题
text['Subject'] = '企鹅科技2020-03-05至2020-03-12订单数'
text['From'] = sender
text['To'] = ','.join(receivers)

s_obj = smtplib.SMTP_SSL(host_name,prot)
s_obj.login(u_name,password)
s_obj.sendmail(u_name,receivers,text.as_string())
s_obj.quit()
print('Mail sent successully!')
