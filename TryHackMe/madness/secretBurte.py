#!/usr/bin/env python3
import requests
from bs4 import BeautifulSoup as bs4

url = "http://10.10.53.147/th1s_1s_h1dd3n/?secret="

def req(url):
	for i in range(0,99):
		r = requests.get(url+str(i)).text
		#print(r.text)
		soup = bs4(r,"lxml")
		pTag = soup.find_all('p')
		#print(soup.p.text)
		print(pTag)

req(url)