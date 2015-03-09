#!/usr/bin/python

# USE PYTHON 2.7
# Do not give ctf players the source code :)

import string
import random

del __builtins__.__dict__['__import__']
del __builtins__.__dict__['reload']

ALPHANUMCHARS = list(string.ascii_lowercase + string.ascii_uppercase +
        string.digits)

def generateString():
    l = random.randint(24 , 64)
    tmp = ""
    for i in range(0 , l):
        tmp += ALPHANUMCHARS[random.randint(0 , len(ALPHANUMCHARS) - 1)]
    return tmp

# MAIN #

otp = generateString()

USER_USERNAME = ""

for i in range(1 , 3):
    print "Attempt " + str(i) + " of 3."
    try:
        USER_USERNAME = str(input("Username: "))
    except:
        print "Entry failed. Using randomly generated username."
        USER_USERNAME = generateString()
    try:
        USER_ATTEMPT = str(raw_input("Password for " + USER_USERNAME + " : "))
        if str(USER_ATTEMPT).strip() == str(otp).strip():
            f = open("flag.txt")
            print(f.read())
            f.close()
            quit(0)
        else:
            print "Incorrect!"
    except:
        print "Incorrect!"
