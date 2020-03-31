from qiniu import build_batch_stat,build_batch_delete,Auth,BucketManager
access_key = '***'
secret_key = '***'
q = Auth(access_key, secret_key)
bucket = BucketManager(q)

bucket_name = 'image'

keys = '2019/01/29/407538353802575877'

ret,info = bucket.stat(bucket_name,keys)


print(info)