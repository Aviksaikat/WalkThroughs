#!/usr/bin/python3

from Crypto.Cipher import AES
from Crypto.Util.Padding import pad, unpad
from binascii import hexlify, unhexlify
from os import urandom
import requests
from pwn import xor

url = "https://cookie-stream.chal.imaginaryctf.org/"
s = requests.Session()
r = s.post(url + "backend", data={"username" : "ImaginaryCTFUser", "password" : "idk"})


#print(r.text)

username = "admin"
password = "idk"
cookie1 = "46c4846a154f691388bdea430c500e710c67def10a7e1ba43b013a93ac58d39dc8234d49bd883a0c"
cookie2 = "42c443ff90c6b608b564f053fa48b48314a3a9e8a8e45d26f24b31a8b70ee38cc6d484b30d822c39"
# while True:
# 	key = urandom(16)
# 	nonce = unhexlify(cookie[:16])

# 	cipher = AES.new(key, AES.MODE_CTR, nonce=nonce) # my friend told me that cbc had some weird bit flipping attack? ctr sounds way cooler anyways
# 	ans = hexlify(nonce + cipher.encrypt(pad(username.encode(), 16))).decode()
# 	print(ans)
# 	#
# 	# nonce = unhexlify(cookie[:16])
# 	# cipher = AES.new(key, AES.MODE_CTR, nonce=nonce)
# 	# username = unpad(cipher.decrypt(unhexlify(ans[16:])), 16).decode()

# 	# print(username)
# 	#exit()
# 	cookies = {"auth" : f"{ans}"}
# 	r = s.get(url + "home", cookies=cookies)
# 	#print(r.text)
# 	if("ImaginaryCTFUser" not in r.text):
# 		print(f"ans{ans}")
# 		print(r.text)
# 		exit()


flag = ""
plain_txt = cookie1[:16].encode()

for i in range(len(cookie1)):
    flag += xor(cookie1[i], cookie2[i],plain_txt[i]).decode()

print(flag)
