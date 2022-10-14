#!/usr/bin/python3
import hashlib

target_hash = "184b5d255817fc0afe9316e67c8f386506a3b28b470c94f47583b76c7c0ec1e5"

# txt =  "Secret" + "read.php"
# print(hashlib.sha256(txt.encode()).hexdigest())
# exit()

with open("/usr/share/wordlists/rockyou.txt", 'r', encoding = "ISO-8859-1") as f:
	l = f.read().strip().replace('\\','').replace(' ','').split()

#print(l)
#exit()
print("[*]Running....")
for hash_ in l:
	txt = hash_ + "read.php"
	#print(txt)
	result = hashlib.sha256(txt.encode())
	result = result.hexdigest()
	#print(f"Hash:{result}")
	if result == target_hash:
		print(f"[!!]Cracked: Secret:{hash_}, Hash:{result}")
		break