#!/usr/bin/python2.7
import random #woohoo the random module is lots of fun
import math
import sys

class UnbufferedStream(object):
    def __init__(self, stream):
        self.stream = stream
    def write(self, data):
        self.stream.write(data)
        self.stream.flush()
    def __getattr__(self, attr):
        return getattr(self.stream, attr)

sys.stdout = UnbufferedStream(sys.stdout)

random.seed(999999999999999999999999999999999999) #heheheh super high number so hax0rs will never get it
key=0
with open('flag.txt','r') as f:
    flag=f.read()
i=math.floor(random.random()*100)
while i > 0:
    random.random() #to mix it up a little
    i-=1
key=math.floor(random.random()*1000000)
stoopid_user=raw_input("What's your guess?")
if str(key)==stoopid_user:
    print "darnit.  here's the flag: "+flag
else:
    print "Hahahahhahahaahaahahha I knew you couldn't do it."
