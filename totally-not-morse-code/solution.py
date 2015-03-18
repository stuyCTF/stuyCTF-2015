import binascii

f = open("not-morse-code.txt", "r")
stream = f.read()

stream_bin = stream.replace("-", "1").replace(".", "0")
n = int(stream_bin, 2)
output = binascii.unhexlify('%x' % n)

for i in range(0, 4):
    if i % 2 == 0:
        stream_bin = output.replace("-", "0").replace(".", "1")
    else:
        stream_bin = output.replace("-", "1").replace(".", "0")
    n = int(stream_bin, 2)
    output = binascii.unhexlify('%x' % n)

print output
