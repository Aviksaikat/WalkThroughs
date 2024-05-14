import struct

# Open the output file in binary mode
with open("chall/output", "rb") as f:
   output = f.read()

# Reverse the XOR operation
array = [42, 77, 3, 8, 69, 86, 60, 99, 50, 76, 15, 14, 41, 87, 45, 61, 16, 50, 20, 5, 13, 33, 62, 70, 70, 77, 28, 85, 82, 26, 28, 32, 56, 22, 21, 48, 38, 42, 98, 20, 44, 66, 21, 55, 98, 17, 20, 93, 99, 54, 21, 43, 80, 99, 64, 98, 55, 3, 95, 16, 56, 62, 42, 83, 72, 23, 71, 61, 90, 14, 33, 45, 84, 25, 24, 96, 74, 2, 1, 92, 25, 33, 36, 6, 26, 14, 37, 33, 100, 3, 30, 1, 31, 31, 86, 92, 61, 86, 81, 38]
result = bytearray()
for i in range(len(output)):
  index = i % len(array)
  result.append((output[i] ^ (array[index] ^ 0x266E + 0x1537 + 0x1B37 - 0x43A5)) % 256)

# Convert the result to a string and print it
print(result.decode())

