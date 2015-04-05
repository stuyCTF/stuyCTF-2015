import sys, hashlib

boroughs = ["manhattan", "queens", "staten island", "brooklyn", "bronx"]

for address in range(0, 1000):
    for borough in boroughs:
        for zip_code in range(10000, 15000):
            plaintext = "stuyctf{%d_%s_%d}" % (address, borough, zip_code)
            #print "Status: ", plaintext
            hashed = hashlib.md5(plaintext)
            if hashed.hexdigest() == "76370c8b218eacfdf6a33bd4c311575a":
                print plaintext
                sys.exit(0)
