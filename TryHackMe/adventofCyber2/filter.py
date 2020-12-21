#!/usr/bin/env python3

import requests

#api_key = 1
for api_key in range(1,100,2):
	#if(api_key % 2!=0):
		#requesting 
	html = requests.get(f"http://10.10.7.198:8000/api/{api_key}")

	print(html.text)