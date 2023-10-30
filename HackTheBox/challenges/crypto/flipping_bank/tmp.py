#!/usr/bin/python3
from binascii import unhexlify

from Crypto.Cipher import AES

user = "admin"
passwd = "g0ld3n_b0y"

msg = 'logged_username=' + user +'&password=' + passwd


def decrypt_data(encryptedParams):
	cipher = AES.new(key, AES.MODE_CBC,iv)
	paddedParams = cipher.decrypt( unhexlify(encryptedParams))
	print(paddedParams)
	#print(unpad(paddedParams,16,style='pkcs7'))
	


decrypt_data("02ef1bc5e42c4975591e271efa9fb1b8eea763746ddf6a40c7fbff4d1c7a77071e86c565980ac5b9649a4912c4644c07")