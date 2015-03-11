CWD=$(shell pwd)
all:
	cp main-binary.c /tmp/impossible.c; cd /tmp; gcc -m32 -g -o impossible impossible.c; rm /tmp/impossible.c; mv impossible $(CWD);
