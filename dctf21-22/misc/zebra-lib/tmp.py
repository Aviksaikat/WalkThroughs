#!/usr/bin/python3
from base64 import b64decode
from zlib import decompress

from pwn import *

debug_level = "critical"


c = connect("35.246.158.241", 30948)

c.recvuntil(b"!!!\r\n")

#* https://gist.github.com/perrygeo/ee7c65bb1541ff6ac770
token = c.recvuntil(b"\r\n").strip() + b"==="
token = b'eJwrzy_Kji8oys9Ps03OyMhITMtIKy8tNi62tMxIyTAzTEwtTc1IT81IzcgwBgB07hBs==='

#print(token)
b64_decoded_str = b64decode(token)
print(b64_decoded_str)

print(decompress(b64_decoded_str))

