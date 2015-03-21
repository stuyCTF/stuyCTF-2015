#!/usr/bin/python

f = open("flag.txt" , 'r')
flag = f.read().strip()
f.close()

while True:
    for c in flag:
        print c + "\b \b" + "swag"
