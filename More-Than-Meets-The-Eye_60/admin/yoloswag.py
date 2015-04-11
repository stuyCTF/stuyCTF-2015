#!/usr/bin/python
import sys, itertools
import time

flag = "stuyctf{why_backspace_no_werk}"

class UnbufferedStream(object):
    def __init__(self, stream):
        self.stream = stream
    def write(self, data):
        self.stream.write(data)
        self.stream.flush()
    def __getattr__(self, attr):
        return getattr(self.stream, attr)

sys.stdout = UnbufferedStream(sys.stdout)

for c in itertools.cycle(flag):
    time.sleep(0.1)
    print c + "\b \b" + "TRANSFORMERS"
