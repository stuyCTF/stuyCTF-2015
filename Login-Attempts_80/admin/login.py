#!/usr/bin/python2.7

import string
import random
import sys

del __builtins__.__dict__['__import__']
del __builtins__.__dict__['reload']

ALPHANUMCHARS = list(string.ascii_lowercase + string.ascii_uppercase +
        string.digits)
LEN_ALPHANUMCHARS = len(ALPHANUMCHARS)

def generateString():
    tmp = ""
    for i in range(0 , random.randint(24, 64)):
        tmp += ALPHANUMCHARS[random.randint(0 , LEN_ALPHANUMCHARS - 1)]
    return tmp

def hasValidChars(s):
    valid_chars = string.ascii_lowercase +\
                  string.ascii_uppercase +\
                  string.digits +\
                  "+-/`!@#$%^&()"
    for c in s:
        if c not in valid_chars:
            return False
    return True

class UnbufferedStream(object):
    def __init__(self, stream):
        self.stream = stream
    def write(self, data):
        self.stream.write(data)
        self.stream.flush()
    def __getattr__(self, attr):
        return getattr(self.stream, attr)

# MAIN #
sys.stdout = UnbufferedStream(sys.stdout)
otp = generateString()

USER_USERNAME = ""

for i in range(1 , 4):
    print "Attempt " + str(i) + " of 3."
    try:
        USER_USERNAME = str(raw_input("Username: "))
        if len(USER_USERNAME) < 9 and hasValidChars(USER_USERNAME):
            USER_USERNAME = str(eval(USER_USERNAME.strip()))
    except Exception, e:
        print "Entry failed. Using randomly generated username."
        USER_USERNAME = generateString()
    try:
        USER_ATTEMPT = str(raw_input("Password for " + USER_USERNAME + " : "))
        if USER_ATTEMPT == otp:
            with open('flag.txt', 'r') as f:
                print f.read()
            sys.exit(0)
        else:
            print "Incorrect!"
    except Exception, e: # Only catch exceptions and not system exit
        print "Incorrect!"
