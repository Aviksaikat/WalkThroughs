#!/usr/bin/python3
import re
import subprocess
from base64 import b64decode
from urllib.parse import unquote

with open("access.log") as f:
	access_log = f.read()

# Split the access log into lines
log_lines = access_log.strip().split("\n")

# Regular expression pattern to match lines with "200" status
pattern = re.compile(r'(\d+\.\d+\.\d+\.\d+) .* "GET ([^"]+)" 200')

# Iterate through log lines to extract IP and URL for "200" responses
for line in log_lines:
	match = pattern.search(line)
	if match:
		ip = match.group(1)
		url = match.group(2)
		#print(f"IP: {ip}, URL: {url}")

url_decoded_str = unquote(re.findall(".*base64.*",access_log)[0].split(' ')[6])

cmd = url_decoded_str.split(';')[-1].split('|')[0]

# print(cmd)

b64Strings = re.findall("Nz.*", url_decoded_str)[0].split(';')[:7]
b64str = ""

# Join the list elements with a semicolon to create the desired format
formatted_string = ";".join(b64Strings)

# Create the final echo command using the desired variables
echo_command = f"{formatted_string};{cmd}"


result = subprocess.run(echo_command, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)


# Print the final echo command
print(b64decode(result.stdout)[::-1].decode())
