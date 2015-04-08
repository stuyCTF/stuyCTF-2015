#!/bin/bash
openssl enc -e -camellia-256-ecb -pass pass:qq -in plaintext.txt -out ciphertext.txt
