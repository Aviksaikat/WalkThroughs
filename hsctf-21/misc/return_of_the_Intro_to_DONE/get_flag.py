#!/usr/bin/python3

import re
import subprocess

from pwn import *

# nc return-of-the-intro-to-netcat.hsc.tf 1337
debug_level = "critical"


c = connect("return-of-the-intro-to-netcat.hsc.tf", 1337)

fn = (re.findall(b"python3.*", c.recv())[0]).decode()

print(fn)

#ans = subprocess.Popen(fn, stdout=subprocess.PIPE)

print(ans)

