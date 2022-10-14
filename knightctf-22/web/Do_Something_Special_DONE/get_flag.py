#!/usr/bin/python3
from requests import get
from re import findall
from urllib.parse import quote

url = "http://do-something-special.kshackzone.com/"
flag_point = "gr@b_y#ur_fl@g_h3r3!"

r = get(url + quote(flag_point))

print(findall("KCTF{.*", r.text)[0].replace("['", '').replace("']", ''))

