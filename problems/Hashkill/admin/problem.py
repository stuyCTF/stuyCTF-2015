import hashlib

flag = "stuyctf{345_manhattan_10282}"

md5_flag = hashlib.md5()
md5_flag.update(flag)
print md5_flag.hexdigest()
