import socket

HOST = "127.0.0.1"
PORT = 12345

sock = socket.socket(socket.AF_INET , socket.SOCK_STREAM)
sock.connect((HOST , PORT))

flagchars = []

for i in range(0 , 100):
    received = repr(sock.recv(1024))
    if received == "swag":
        continue;
    else:
        flagchars.append(received)

print flagchars[0].replace(r'\x08 \x08' , "").replace(r'\n' , "").replace("swag", "").split("flag: ")[1]
