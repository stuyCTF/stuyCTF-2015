CWD=$(shell pwd)
all:
	gcc -m32 -fno-stack-protector -O0 -o format-overflow main.c
	cp main-redacted.c $(CWD)/../release
