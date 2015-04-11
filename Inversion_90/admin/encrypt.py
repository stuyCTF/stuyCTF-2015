#!/usr/bin/python

import sys
import math
import struct

p = lambda x: struct.pack('f', x)
u = lambda x: struct.unpack('b', x)[0]

if len(sys.argv) != 5:
    sys.exit(1)

filename = sys.argv[1]
r = float(sys.argv[2])
keyx = int(sys.argv[3])
keyy = int(sys.argv[4])

print r
print "(%d, %d)" % (keyx, keyy)

bs = open(filename, 'rb').read()
enc = open(filename + '.enc', 'wb')

for i in range(0, len(bs), 2):
    x, y = u(bs[i]), u(bs[i+1])
    try:
        enc.write(p(((r ** 2) * (x - keyx)) / ((x - keyx)** 2 + (y - keyy) ** 2)) +
            p(((r ** 2) * (y - keyy)) / ((x - keyx)** 2 + (y - keyy) ** 2)))
    except ZeroDivisionError:
        enc.write(p(float(x)) + p(float(y)))
