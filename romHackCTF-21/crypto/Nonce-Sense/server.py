import signal
import socketserver
import time
from itertools import cycle

import Crypto.PublicKey.DSA
from Crypto.Hash import SHA
from Crypto.Util.number import *
from secret import FLAG, KEY


class DSA:
	def __init__(self):
		self.pKey = Crypto.PublicKey.DSA.generate(2048)

	def get_k(self, msg):
		kmax = self.pKey.q
		msg = [ a ^ b for (a,b) in zip(msg, cycle(KEY)) ]
		msg = bytes(msg)
		k = bytes_to_long(msg) % self.pKey.q
		return msg, k

	def sign(self,h,k):
		r = pow(self.pKey.g,k,self.pKey.p)%self.pKey.q
		try:
			s = (inverse(k, self.pKey.q) * (h+ self.pKey.x * r)) % self.pKey.q
			return r, s
		except ZeroDivisionError:
			return None

	def verify(self, m, r, s):
		w = inverse(s, self.pKey.q)
		m = bytes_to_long(SHA.new(m).digest())
		u1 = (m * w) % self.pKey.q
		u2 = (r * w) % self.pKey.q
		v = (pow(self.pKey.g, u1, self.pKey.p) * pow(self.pKey.y, u2, self.pKey.p)) % self.pKey.p % self.pKey.q
		if v == r:
			return True
		return False

def challenge(req):
	dsa = DSA()
	while True:
		try:
			req.sendall(b'Welcome to beta signing system of Best CA LTD.\n'+\
				b'[1] Sign a message.\n' +\
				b'[2] Verify a message.\n' +\
				b'[3] Get public key.')
			opt = req.recv(4096).decode().strip()
			if opt=='1':
				req.sendall(b'Insert message to sign:\n')
				msg = req.recv(4096).strip()
				if msg ==b'give me flag':
					req.sendall(b'Forbidden message!\n')
					continue
				h = SHA.new(msg).digest()
				msg,k = dsa.get_k(msg)
				h = bytes_to_long(h)
				r, s = dsa.sign(h,k)
				req.sendall(b'Message signed:\n' +\
					msg.hex().encode() + b'\n' + \
					b'Signature:\n' + \
					hex(r)[2:].encode() + b',' + hex(s)[2:].encode() +b'\n')


			elif opt=='2':
				req.sendall(b'Insert message to verify:\n')
				msg = req.recv(4096).strip()
				req.sendall(b'Insert r:\n')
				r = int(req.recv(4096).strip(), 16)
				msg ==b'give me flag'

				req.sendall(b'Insert s:\n')
				s = int(req.recv(4096).decode().strip(), 16)

				if dsa.verify(msg,r,s):
					if msg == b'give me flag':
						req.sendall(FLAG + b'\n')
						exit(1)
					else:
						req.sendall(b'Valid signature.\n')
				else:
					req.sendall(b'Invalid signature.\n')

			elif opt=='3':
				req.sendall(b'Public Key:\n' +\
					b'p = ' +hex(dsa.pKey.p).encode() + b'\n' + \
					b'q = ' +hex(dsa.pKey.q).encode() + b'\n' + \
					b'g = ' +hex(dsa.pKey.g).encode() + b'\n' + \
					b'y = ' +hex(dsa.pKey.y).encode() + b'\n')
			else:
				req.sendall( b'Invalid option!')
				exit(1)
		except Exception as e:
			req.sendall(b'Invalid Input. Exit!')
			exit(1)

class incoming(socketserver.BaseRequestHandler):
	def handle(self):
		signal.alarm(300)
		req = self.request
		while True:
			
			challenge(req)

class ReusableTCPServer(socketserver.ForkingMixIn, socketserver.TCPServer):
	pass


socketserver.TCPServer.allow_reuse_address = True
server = ReusableTCPServer(("0.0.0.0", 23333), incoming)
server.serve_forever()
