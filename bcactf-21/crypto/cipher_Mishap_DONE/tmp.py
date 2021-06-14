#!/usr/bin/python3

def caesar(encrypted_text, shift):

	plain_text = ""

	for c in encrypted_text:
		if(c == '_'):
			plain_text += '_'

		# check if character is an uppercase letter
		if c.isupper():
			# find the position in 0-25
			c_unicode = ord(c)
			c_index = ord(c) - ord("A")
			# perform the negative shift
			new_index = (c_index - shift) % 26
			# convert to new character
			new_unicode = new_index + ord("A")
			new_character = chr(new_unicode)
			# append to plain string
			plain_text = plain_text + new_character

		else:
			plain_text += chr((ord(c) - shift))

	return plain_text.replace('\\', '')

with open("text.txt", 'r') as f:
	data = f.read().strip().split(',')

#print(data)
digits = []
caps = []
for i in data:
	try:
		a, b = i.split('-')
		digits.append(a)
		caps.append(b)
	except :
		digits.append(i)
		caps.append(' ')

	#print(digits)	


# print(len(digits))
# print(len(caps))

flag = ""

for i, j in zip(digits,caps):
	#print(i, j)
	if(j == 'N'):
		#print(chr(int(i, 8)))
		flag += chr(int(i, 8)).lower()
	else:
		flag += chr(int(i, 8))

print(flag)

# # for i in range(10):
# # 	print(caesar(flag, i))

print("bcactf{%s}" % (caesar(flag, 3)))