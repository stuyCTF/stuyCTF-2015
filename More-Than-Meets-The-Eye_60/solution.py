import socket

HOST = "stuyctf.me"
PORT = 22346

sock = socket.socket(socket.AF_INET , socket.SOCK_STREAM)
sock.connect((HOST , PORT))

flagchars = ""

for i in range(0, 100):
    received = repr(sock.recv(1024))
    flagchars += received

flag = ""
for i in range(0 , len(flagchars)):
    if i % 28 == 1:
        flag += flagchars[i]
        if flagchars[i] == "}":
            break;

print flag
# flag: stuyctf{why_backspace_no_werk}
