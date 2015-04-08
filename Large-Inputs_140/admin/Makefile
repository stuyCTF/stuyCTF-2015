CWD=$(shell pwd)
all:
	gcc -O9 -o large-inputs main.c -lm
	cp main-redacted.c $(CWD)/../release
solve:
	gcc -O9 -o large-inputs-solver solution.c -lm
