import socket

HOST = "stuyctf.me"
PORT = 12347

sock = socket.socket(socket.AF_INET , socket.SOCK_STREAM)
sock.connect((HOST , PORT))

flagchars = []

for i in range(0 , 100):
    received = repr(sock.recv(1024))
    flagchars.append(received)

print ''.join([flagchar[0] for flagchar in flagchars])

# flag: stuyctf{why_backspace_no_werk}
