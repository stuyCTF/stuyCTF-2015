import random
import string

random.seed(12345)

list_of_chars = []
printable = string.ascii_letters + string.punctuation

for i in range(0, 10000):
    list_of_chars.append(random.choice(printable))

f = open('../release/what_is_the_md5.txt', 'w')
f.write("".join(list_of_chars))
f.close()
