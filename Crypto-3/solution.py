'''
This can be done by implementing your own solution (since you are given the private exponent) OR
http://www.nmichaels.org/rsa.py
'''

f = open('release/rsa.txt', 'r')
c = int(f.readline().strip()[6:], 16)
n = int(f.readline().strip()[3:], 16)
e = int(f.readline().strip()[3:], 16)
d = int(f.readline().strip()[3:], 16)

flag = pow(c, d, n)
print hex(flag)[2:-1].decode("hex")
