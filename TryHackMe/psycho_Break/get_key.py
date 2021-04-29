#!/usr/bin/python3

import re
import subprocess

with open("random.dic", 'r') as f:
	contents = f.readlines()

#print(contents)

for key in contents:
	key = str(key.replace("\n", ""))
	run = str(subprocess.run(["./program",key]))
	# print(run)

