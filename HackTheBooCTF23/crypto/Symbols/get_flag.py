#!/usr/bin/python3

p = 307163712384204009961137975465657319439
g = 1337


# Encrypted values
encrypted_values = []

with open("output.txt", 'r') as f:
	data = eval(f.read())

for value in data:
	encrypted_values.append(int(value))

def decrypt(encrypted_data, p, g):
	decrypted_bits = []

	for encrypted_num in encrypted_data:
		# Calculate the modular inverse of g^r mod p
		r_inverse = pow(encrypted_num, -1, p)

		# Extract the least significant bit of r_inverse to recover the original bit
		original_bit = r_inverse & 1

		# Append the original bit to the decrypted bits
		decrypted_bits.append(original_bit)

	# Convert the list of bits back to an integer
	decrypted_message = int("".join(map(str, decrypted_bits)), 2)
	return decrypted_message


# Decrypt the data
decrypted_message = decrypt(encrypted_values, p, g)

# Convert the decrypted message to bytes
original_message_bytes = decrypted_message.to_bytes((decrypted_message.bit_length() + 7) // 8, 'big')

# Print the original message
print(original_message_bytes.decode())
