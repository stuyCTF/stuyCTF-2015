import binascii

FLAG = "stuyctf{morse_code_is_not_binary}"

encrypt = FLAG

for i in range(0, 5):
    encrypt = bin(int(encrypt.encode("hex"), 16))
    if i % 2 == 0:
        encrypt = str(encrypt[2:]).replace("0", ".").replace("1", "-")
    else:
        encrypt = str(encrypt[2:]).replace("0", "-").replace("1", ".")

f = open("not-morse-code.txt", "w")
f.write(encrypt)

print encrypt
