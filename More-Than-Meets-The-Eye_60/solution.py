import socket

HOST = "stuyctf.me"
PORT = 22346

sock = socket.socket(socket.AF_INET , socket.SOCK_STREAM)
sock.connect((HOST , PORT))

flagchars = ""

for i in range(0, 100):
    received = sock.recv(1024)
    flagchars += received

print ''.join([flagchar[0] for flagchar in flagchars.split('\n')[:-1]])
# flag: stuyctf{why_backspace_no_werk}
