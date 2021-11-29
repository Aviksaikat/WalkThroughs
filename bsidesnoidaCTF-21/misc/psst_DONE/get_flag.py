#!/usr/bin/python3

import os 

folder = "/home/avik/Desktop/ctf/WalkThroughs/bsidesnoidaCTF-21/misc/psst_DONE/chall/Security"
results = ""

for root, _, filenames in os.walk(folder):
	#print(filenames)
	for file in filenames:
		#print(file)
		fileExt = os.path.splitext(file)[-1]
		if fileExt == ".txt":
			with open(os.path.join(root, file), 'r') as f:
				results += f.read().strip()

print(results)