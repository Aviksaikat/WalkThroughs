#!/usr/bin/env python3
#Aoc-1 day 9
import traceback

import requests

url = "http://10.10.169.100:3000/"
_next = ""
flag = ""

def req(url):
	global _next,flag
	
	try:
		while(_next!="end"):
			r = requests.get(f"{url}{_next}")
			#print(r.text[21])
			
			_next = r.text[21]
			jsonVal = r.json()

			flag+= jsonVal['value']
			#print(_next)
			#print(f"nextVal->{_next}\n{r.json()}")
			print(flag)
	
	except Exception as error:
		 #traceback.print_exc()
		 pass

req(url)
print("-"*50)
print(f"Flag:{flag[:-3]}")
print("-"*50)