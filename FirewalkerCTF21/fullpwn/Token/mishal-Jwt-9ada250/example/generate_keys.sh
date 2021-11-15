#!/usr/bin/env bash

openssl genrsa -out key.pem 2048 -pubout
openssl rsa -in key.pem -pubout > key.pub

# http://stackoverflow.com/questions/4294689/how-to-generate-a-key-with-passphrase-from-the-command-line
openssl genrsa -aes128 -passout file:passphrase.txt -out key_passphrase.pem 2048
openssl rsa -passin file:passphrase.txt -pubout -in key_passphrase.pem > key_passphrase.pub
