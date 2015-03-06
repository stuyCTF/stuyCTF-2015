import string

data = list(open("doc.txt", "r").read())

alphabet = list(string.ascii_lowercase + string.ascii_uppercase)
cipherlist =['h', 'p', 'm', 'g', 'n', 'r', 'o', 's', 'd', 'x', 'c', 'i', 'u', 'w', 'f', 'a', 'b', 'j', 'k', 'z', 'y', 't', 'e', 'l', 'v', 'q', 'H', 'P', 'M', 'G', 'N', 'R', 'O', 'S', 'D', 'X', 'C', 'I', 'U', 'W', 'F', 'A', 'B', 'J', 'K', 'Z', 'Y', 'T', 'E', 'L', 'V', 'Q']

result = ""

for char in data:
    try:
        result += cipherlist[alphabet.index(char)]
    except:
        result += char

fout = open("encrypted.enc", "w")
fout.write(result)
