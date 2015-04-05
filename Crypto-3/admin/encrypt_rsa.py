f = open('flag.txt', 'r')
flag = f.read().strip()
f.close()

p = 53245435789023475987384751495703145701475682361492138469816374878921365781230423804158991876789461879677891657896174938657027187
q = 7120369081238704129056732814123605213071591467398123401658973216498127306521374891235172364712364912384618991899

def egcd(a, b):
    if a == 0:
        return (b, 0, 1)
    else:
        g, y, x = egcd(b % a, a)
        return (g, x - (b // a) * y, y)

def modinv(a, m):
    g, x, y = egcd(a, m)
    if g != 1:
        raise Exception('Modular inverse does not exist')
    else:
        return x % m

def generate_key():
    n = p * q
    t = (p-1) * (q-1)
    e = 3
    if n % e != 1:
        e = 5
        if n % e != 1:
            e = 7
            if n % e != 1:
                e = 65537
                if n % e == 1:
                    print "I don't want to math no more :("
                    return
    d = modinv(e, t)
    return (n, e, d)

n, e, d = generate_key()
rsa_encrypted = pow(int(flag.encode("hex"), 16), e, n)

f = open('../release/rsa.txt', 'w')
f.write("Flag: " + hex(rsa_encrypted)[2:-1] + "\n")
f.write("N: " + hex(n)[2:-1] + "\n")
f.write("E: " + hex(e)[2:] + "\n")
f.write("D: " + hex(d)[2:-1] + "\n")
f.close()
