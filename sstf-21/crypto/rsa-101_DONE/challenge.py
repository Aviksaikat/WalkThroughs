from base64 import b64decode, b64encode
from os import system

from Crypto.Util.number import bytes_to_long, getStrongPrime, long_to_bytes

p = getStrongPrime(512)
q = getStrongPrime(512)
n = p * q
e = 65537
d = pow(e, -1, (p - 1) * (q - 1))

print("[RSA parameters]")
print("n =", hex(n))
print("e =", hex(e))

def sign(msg):
	m = bytes_to_long(msg)
	s = pow(m, d, n)
	return long_to_bytes(s)

def verify(s):
	s = bytes_to_long(s)
	v = pow(s, e, n)
	return long_to_bytes(v)

def welcome():
	print("\nWelcome to command signer/executor.")
	print("Menu : 1. Verify and run a command")
	print("       2. Sign a command")
	print("       3. Exit")

while True:
	welcome()
	sel = input(" > ").strip()
	if sel == "1":
		sgn = input("Signed command: ").strip()
		sgn = b64decode(sgn)
		cmd = verify(sgn)

		commands = ["ls -l", "pwd", "id", "cat flag"]
		if cmd.decode() in commands:
			system(cmd)
		else:
			print("Possible commands: ", commands)

	elif sel == "2":
		cmd = input("Base64 encoded command to sign: ")
		cmd = b64decode(cmd)
		if cmd == "cat flag":
			print("It's forbidden.")
		else:
			print("Signed command:", b64encode(sign(cmd)).decode())

	elif sel == "3":
		print("bye.")
		exit()

	else:
		print("Invalid selection.")
