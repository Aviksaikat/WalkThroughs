#!/usr/bin/python3

def decrypt(encrypted_message):
	decrypted_message = ""
	for char in encrypted_message:
		c = ord(char) ^ 23
		b = (c + 7) // 3
		a = (b - 5) ^ 42
		original_char = (a - 10) // 2
		decrypted_message += chr(original_char)
	return decrypted_message

with open("flag.txt.enc", 'r') as f:
	data = f.read()

hex_data = data
#print(hex_data)

print(decrypt(hex_data))