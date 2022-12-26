#!/usr/bin/python3
from pwn import *


c = connect("challs.htsp.ro", 9000)

print(c.recv())