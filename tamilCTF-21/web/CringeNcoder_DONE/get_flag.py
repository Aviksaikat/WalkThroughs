#!/usr/bin/python3
import requests
import string
from bs4 import BeautifulSoup
from re import findall

url = "http://45.79.195.170:5000/"

char_set = string.digits + string.ascii_lowercase

ct = ["cR1Ng3e","crinG3","cringE","cringe","cRINGe","cRINGe","cring3","crinG3","cringE","cringE","cRinG3","Cr1nGe","cRimG3","criNG3","cRinge","cRimG3","cringe","cR1Ng3e","cRiNge","cRinG3","cR1Ng3","CrInGe","cRInGE","cr1ngE","criNG3","cringE","cring3","cRinge","cR1Ng3","crinGE","cringE","criNgee","cRinG3","CrInGe"] 

dt = {"a":"cringe","b":"cr1nge","c":"cRinge","d":"crIng3","e":"cRimG3","f":"cR1Ng3e","g":"criNgee","h":"CRINGE","i":"crinGE","j":"ccR1nge","k":"CriNGE","l":"cRINGe","m":"cr1ngE","n":"cringE","o":"CRIng3","p":"Cr1nGe","q":"cR1nnge","r":"cR1Ng3","s":"CrInGe","t":"cRingE","u":"cR1NGE","v":"CRiNg3","w":"CRINGe","x":"CR1NGe","y":"cring3","z":"CRIMNGE","0":"cRInGE","1":"crinG3","2":"cRInge","3":"cRinG3","4":"criNG3","5":"cr1NG3","6":"crinGe","7":"cRiNge","8":"CrInGE","9":"CRinGE"}

flag = ''

print(f"[*]Running...")

for i in ct:
	for j in char_set: 
		r = requests.post(url + "encode", data={"text": f"{j}"})

		soup = BeautifulSoup(r.text , 'html.parser')

		class_ = str(soup.find(class_= "result"))

		encoded = findall(r"[\">].*", class_)[1].split('>')[4]

		if i in encoded:
			flag += j
			print(f"[*]Flag: {flag}")
			break

#flag = "f1nally1nn3pe4ceaf73fs0m4nycfing3s"



# key_list = list(dt.keys())
# val_list = list(dt.values())

# for i in ct:
# 	flag += key_list[val_list.index(i)]

print(f"[!]Flag: TamilCTF{{{flag}}}")

