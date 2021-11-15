from Crypto.Cipher import AES
import socketserver
import signal
import os
import random
import time
from secret import flag

KEY_LENGTH = 16
BLOCK_SIZE = AES.block_size

key = os.urandom(KEY_LENGTH)

def add_padding(msg):
	pad_len = BLOCK_SIZE - (len(msg) % BLOCK_SIZE)
	padding = bytes([pad_len]) * pad_len
	return msg + padding

def remove_padding(data):
	pad_len = data[-1]
	if pad_len < 1 or pad_len > BLOCK_SIZE:
		return None
	for i in range(1, pad_len):
		if data[-i-1] != pad_len:
			return None
	return data[:-pad_len]

def encrypt(msg):
	iv = os.urandom(BLOCK_SIZE)
	cipher = AES.new(key, AES.MODE_CBC, iv)
	return (iv + cipher.encrypt(add_padding(msg))).hex()


def decrypt(data):
	iv = data[:BLOCK_SIZE]

	cipher = AES.new(key, AES.MODE_CBC, iv)
	return remove_padding(cipher.decrypt(data[BLOCK_SIZE:]))

def is_padding_ok(data):
	if decrypt(data) is not None:
		return 'This is a valid ciphertext!\n'
	else:
		return 'Invalid ciphertext\n'



def challenge(req):
	req.sendall(bytes('This crypto service is used for Chasa\'s delivery system!\n'
		'Not your average gangster.\n'
		'Options:\n'
		'1. Get encrypted message.\n'
		'2. Send your encrypted message.\n', 'utf-8'))
	try:
		choice = req.recv(4096).decode().strip()

		index = int(choice)

		if index == 1:
			req.sendall(bytes(encrypt(flag) + '\n','utf-8'))
		elif index == 2:
			req.sendall(bytes('Enter your  ciphertext:\n', 'utf-8'))
			ct = req.recv(4096).decode().strip()
			req.sendall(bytes(is_padding_ok(bytes.fromhex(ct)), 'utf-8'))
		else:
			req.sendall(bytes('Invalid option!\n', 'utf-8'))
			exit(1)
	except:
		exit(1)



class incoming(socketserver.BaseRequestHandler):
	def handle(self):
		signal.alarm(300)
		random.seed(time.time())

		req = self.request
		while True:
			challenge(req)

class ReusableTCPServer(socketserver.ForkingMixIn, socketserver.TCPServer):
	pass

socketserver.TCPServer.allow_reuse_address = True
server = ReusableTCPServer(("0.0.0.0", 23333), incoming)
server.serve_forever()
