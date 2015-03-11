import hashlib

blah = hashlib.md5()
blah.update("stuyctf{red_345_manhattan}")
print blah.hexdigest()
