#!/usr/bin/python

import sys
import math
import struct

u = lambda x: struct.unpack('f', x)[0]
p = lambda x: struct.pack('b', x)

if len(sys.argv) != 5:
	sys.exit(1)

filename = sys.argv[1]
r = float(sys.argv[2])
keyx = int(sys.argv[3])
keyy = int(sys.argv[4])


print r
print "(%d, %d)" % (keyx, keyy)

bs = open(filename, 'rb').read()
dec = open(filename[0:-8] + "_decoded" + sys.argv[2] + ".jpg", 'wb') # add "/decoded\ test/" before the filename for the actual flag

for i in range(0,len(bs),8):
	x, y = u(bs[i:i+4]), u(bs[i+4:i+8])
        try:
            dec.write(p(round(((r ** 2) * (x - keyx)) / ((x - keyx)** 2 + (y -
                keyy) ** 2))) + p(round(((r ** 2) * (y - keyy)) / ((x - keyx)**
                2 + (y - keyy) ** 2))))
        except ZeroDivisionError:
            dec.write(p(round(x)) + p(round(y)))
	# F**K YOU PYTHON, YOU STUPID TRUNCATION, LEARN HOW TO ROUND YOU DING DONG
	#dec.write(p(round(x * math.cos(key) + y * math.sin(key), 0)) + p(round(y * math.cos(key) - x * math.sin(key), 0)))
