#!/usr/bin/python3

from pwn import *

debug_level = "critical"
#nc chal.imaginaryctf.org 42015
s = connect("chal.imaginaryctf.org", 42015)

prompt = s.recv().decode().split()
# s.recvuntil('\n\n')
# s.recvuntil('\n\n')
# s.recvuntil('\n\n')
# prompt = s.recv()

# print(prompt)
# exit()
#prompt = ['Welcome', 'to', 'the', 'Imaginary', 'challenge!', "I'm", 'gonna', 'give', 'you', '300', 'imaginary/complex', 'number', 'problems,', 'and', 'your', 'job', 'is', 'to', 'solve', 'them', 'all.', 'Good', 'luck!', 'Sample', 'input:', '(55+42i)', '+', '(12+5i)', '-', '(124+15i)', 'Sample', 'output:', '-57+32i', 'Sample', 'input:', '(23+32i)', '+', '(3+500i)', '-', '(11+44i)', 'Sample', 'output:', '15+488i', '(NOTE:', 'DO', 'NOT', 'USE', 'eval()', 'ON', 'THE', 'CHALLENGE', 'OUTPUT.', 'TREAT', 'THIS', 'IS', 'UNTRUSTED', 'INPUT.', 'Every', 'once', 'in', 'a', 'while', 'the', 'challenge', 'will', 'attempt', 'to', 'forkbomb', 'your', 'system', 'if', 'you', 'are', 'using', 'eval(),', 'so', 'watch', 'out!)', '(10+6i)', '+', '(7+39i)', '>']


operator = prompt[-3]

val1 = prompt[-4]
val2 = prompt[-2]
#print(val1 + operator + val2)

try:
	parts = val1.split('+')
except:
	parts = val1.split('-')

real1 = int(parts[0].strip('('))
imag1 = int(parts[1].strip(')').strip('i'))
#print(imag)

try:
	parts = val2.split('+')
except:
	parts = val2.split('-')

if (operator == '-'):
	real2 = int(parts[0].strip('(')) * - 1 
	imag2 = int(parts[1].strip(')').strip('i'))
else:
	real2 = int(parts[0].strip('('))  
	imag2 = int(parts[1].strip(')').strip('i'))

#print(real2, imag2)

c1 = complex(real1, imag1)
c2 = complex(real2, imag2)

if(operator == '+'):
	ans = str(c1 + c2).strip('(').strip(')')
	print(ans.replace('j', 'i'))
	s.sendline(ans.encode())
	s.recv()
	print(s.recv())

if(operator == '-'):
	ans = str(c1 - c2).strip('(').strip(')')
	print(ans.replace('j', 'i'))
	s.sendline(ans)
	print(s.recv())

