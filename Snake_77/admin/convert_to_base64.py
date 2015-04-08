f = open("key.b64", 'r')
cipher = f.read()
f.close()

f = open("key", 'w')
f.write(cipher.encode("base64").replace("\n","") + "\n")
f.close()
