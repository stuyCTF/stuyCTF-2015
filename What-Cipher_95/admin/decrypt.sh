#!/bin/bash
DECRYPT=""

function check_decrypted() {
    PASS=$1
    if echo $DECRYPT | grep "stuyctf" > /dev/null; then
        echo "Password: ${PASS}"
        echo "Decrypted: ${DECRYPT}"
        echo $DECRYPT > decrypted.txt
        exit 0
    fi
}

function decrypt_all() {
    PASS=$1
    DECRYPT=$(openssl enc -d -aes-128-cbc -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -aes-128-cbc-hmac-sha1 -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -aes-128-cfb -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -aes-128-cfb1 -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -aes-128-cfb8 -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -aes-128-ctr -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -aes-128-ecb -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -aes-128-gcm -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -aes-128-ofb -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -aes-128-xts -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -aes-192-cbc -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -aes-192-cfb -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -aes-192-cfb1 -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -aes-192-cfb8 -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -aes-192-ctr -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -aes-192-ecb -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -aes-192-gcm -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -aes-192-ofb -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -aes-256-cbc -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -aes-256-cbc-hmac-sha1 -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -aes-256-cfb -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -aes-256-cfb1 -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -aes-256-cfb8 -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -aes-256-ctr -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -aes-256-ecb -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -aes-256-gcm -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -aes-256-ofb -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -aes-256-xts -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -aes128 -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -aes192 -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -aes256 -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -bf -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -bf-cbc -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -bf-cfb -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -bf-ecb -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -bf-ofb -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -blowfish -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -camellia-128-cbc -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -camellia-128-cfb -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -camellia-128-cfb1 -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -camellia-128-cfb8 -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -camellia-128-ecb -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -camellia-128-ofb -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -camellia-192-cbc -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -camellia-192-cfb -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -camellia-192-cfb1 -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -camellia-192-cfb8 -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -camellia-192-ecb -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -camellia-192-ofb -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -camellia-256-cbc -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -camellia-256-cfb -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -camellia-256-cfb1 -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -camellia-256-cfb8 -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -camellia-256-ecb -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -camellia-256-ofb -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -camellia128 -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -camellia192 -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -camellia256 -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -cast -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -cast-cbc -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -cast5-cbc -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -cast5-cfb -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -cast5-ecb -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -cast5-ofb -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -des -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -des-cbc -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -des-cfb -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -des-cfb1 -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -des-cfb8 -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -des-ecb -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -des-ede -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -des-ede-cbc -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -des-ede-cfb -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -des-ede-ofb -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -des-ede3 -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -des-ede3-cbc -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -des-ede3-cfb -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -des-ede3-cfb1 -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -des-ede3-cfb8 -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -des-ede3-ofb -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -des-ofb -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -des3 -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -desx -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -desx-cbc -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -id-aes128-GCM -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -id-aes192-GCM -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -id-aes256-GCM -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -rc2 -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -rc2-40-cbc -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -rc2-64-cbc -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -rc2-cbc -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -rc2-cfb -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -rc2-ecb -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -rc2-ofb -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -rc4 -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -rc4-40 -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -rc4-hmac-md5 -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -seed -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -seed-cbc -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -seed-cfb -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -seed-ecb -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
    DECRYPT=$(openssl enc -d -seed-ofb -pass pass:$PASS -in ciphertext.txt 2> /dev/null)
    check_decrypted $PASS
}

alphabet="abcdefghijklmnopqrstuvwxyz"
for (( i=0; i < ${#alphabet}; i++ )); do
    first="${alphabet:$i:1}"
    for (( j=0; j < ${#alphabet}; j++ )); do
        second="${alphabet:$j:1}"
        PASS="$first$second"
        echo $PASS
        decrypt_all $PASS
    done
done
