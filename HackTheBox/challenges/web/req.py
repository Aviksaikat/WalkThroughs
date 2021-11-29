#!/usr/bin/env python3
import requests
from bs4 import BeautifulSoup as bs4
import hashlib

url = "http://167.99.86.47:31661/"

request = requests.session()

def req(url):
	r = request.get(url).text
	#print(r)
	soup = bs4(r,"lxml")
	#pTag = soup.find_all('h3')
	#print(soup.h3.text)
	Hash = soup.h3.text
	#print(pTag)
	#print(Hash)
	encryptedHash = hashlib.md5(Hash.encode("utf-8")).hexdigest()
	#print(updatedHash)
	sentHash = request.post(url,data={
		"hash" : encryptedHash,
		"submit": "Submit", 
		})
	print(sentHash.text)

req(url)