#!/usr/bin/env python3
from hashlib import sha256
import sys
from pwn import *
from pwnlib.util.iters import mbruteforce
import string
from re import findall


prefixes = sys.argv[1]


def brute(cur):

    content = prefixes + str(cur)
    s = sha256(content.encode())
    if s.hexdigest().startswith("000000") and int(s.hexdigest()[6:8], 16) < 0x40:
        return True

    return False

poW = mbruteforce(brute, string.ascii_lowercase + string.digits, method = "upto", length = 6, threads = 25)
print(poW)


# don't know how to use pwntools for this

# c = connect("47.89.251.203", 1337)
# task = c.recvuntil(b"zero:")

# prefixes = findall(b"sha256(.*)$", task)[0].decode().split(' ')[0].strip('(').strip(')')

# prefixes = prefixes.split('"')[1]
# print(prefixes)

#poW = mbruteforce(brute, string.ascii_lowercase + string.digits, method = 'upto', length=6,  threads = 30)

#exit()

# c.sendline(poW.encode())
# print(c.recvuntil(b"# "))
# print(c.recvline())
# print(c.sendline(b"cat flag; cat flag; cat flag"))
# print(c.recvuntil(b"rwctf"))