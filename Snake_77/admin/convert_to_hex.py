f = open("cipher.hex", 'r')
cipher = f.read()
f.close()

f = open("cipher", 'w')
f.write(cipher.encode("hex"))
f.close()
