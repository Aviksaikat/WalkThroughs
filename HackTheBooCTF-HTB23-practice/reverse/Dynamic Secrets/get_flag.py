#!/usr/bin/python3


f = open("dynamic_secrets", "rb")
data = list(f.read())
f.close()

start = 0x11c6
end = 0x1759

i = 0
while start != end:
    data[start] = data[start] ^ (i&0xff)
    start += 1
    i+=1

f = open("challenge", "wb")
f.write(bytes(data))
f.close()