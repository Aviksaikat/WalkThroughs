#!/usr/bin/python3

from os import system

from pwn import *

context.binary = e = ELF("./machine", checksec=False)

e.write(e.sym.ghost, asm("ret"))
e.save("./machine-patched")

system("chmod +x ./machine-patched")
system("./machine-patched")