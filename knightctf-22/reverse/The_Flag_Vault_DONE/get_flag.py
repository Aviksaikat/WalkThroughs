#!/usr/bin/python3

l = {"local_72" : "0x4b","local_70" : "0x7d","local_6e" : "0x77","local_6a" : "0x30","local_68" : "0x54","local_66" : "0x46","local_64" : "0x43","local_62" : "0x5f","local_60" : "0x6d","local_5e" : "0x74","local_5c" : "0x72","local_5a" : "0x76","local_58" : "0x73","local_56" : "0x7b","local_54" : "0x6e","local_52" : "0x33","local_50" : "0x65","local_4e" : "0x67","local_4c" : "0x6c","local_4a" : "0x69","local_18" : "0x61", "local_6c" : "0x99", "uVar2" : "0x1012d9"}

var = ["local_72","local_64","local_68","local_66","local_56","local_6e","local_50","local_4c","local_6a","local_60","local_50","local_62","local_5e","local_6a","local_62","local_5c","local_50","local_5a","local_50","local_5c","local_58","local_50","local_62","local_52","local_54","local_4e","local_4a","local_54","local_50","local_50","local_5c","local_4a","local_54","local_4e","local_70"]

for k in var:
	print(bytearray.fromhex(l[k].replace("0x",'')).decode(), end="")
