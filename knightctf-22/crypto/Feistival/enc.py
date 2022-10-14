#!/usr/bin/python3
from binascii import hexlify, unhexlify

m, n = 21, 22
def f(word, key):
    out = ""
    for i in range(len(word)):
        out += chr(ord(word[i]) ^ key)
    return out

# flag = open("flag.txt", "r").read()
# print(flag)
flag = hexlify(b"484057457865666a7077666f013528230616022300150704")

L, R = flag[0:len(flag)//2], flag[len(flag)//2:]
x = "".join(chr(ord(f(R, m)[i]) ^ ord(L[i])) for i in range(len(L)))
y = f(R, 0)

L, R = y, x
x = "".join(chr(ord(f(R, n)[i]) ^ ord(L[i])) for i in range(len(L)))
y = f(R, 0)

ciphertext = x + y
print(hexlify(ciphertext.encode()))
# ct = open("cipher1.txt", "w")
# ct.write(ciphertext)
# ct.close()