#!/usr/bin/env python3

import json

from pwn import *


def main():
	with open('incidents.json', 'r')as f:
		json_string = json.load(f)

	answer = 0.00
	while True:

		r = remote('2018shell1.picoctf.com', 10493)

		print(r.recvuntil("questions."))

		# Question 1

		question_1 = r.recvuntil("ones.").strip()
		print("The first question is: " + str(question_1))

		source_ip_list = []
		for value in json_string["tickets"]:
			source_ip_list.append(value["src_ip"])

		most_common_source_ip = max(set(source_ip_list), key=source_ip_list.count)
		print(most_common_source_ip)
		r.send(most_common_source_ip + "\n")
		r.recv()
		print("Result: " + str(r.recvline()))
		r.recvline()
		r.recvline()

		# Question 2

		question_2 = str(r.recvuntil("?"))

		print("The second question is: " + question_2)

		ip_address = re.findall(r'[0-9]+(?:\.[0-9]+){3}', question_2)

		unique_destination_ip_addresses = []
		for value in json_string['tickets']:
			if (value['src_ip'] == ip_address.__getitem__(0) 
			and value['dst_ip'] not in unique_destination_ip_addresses):
				unique_destination_ip_addresses.append(value['dst_ip'])

		print(str(len(unique_destination_ip_addresses)))
		r.send(str(len(unique_destination_ip_addresses)) + "\n")
		r.recv()
		print("Result: " + str(r.recvline()))
		r.recvline()
		r.recvline()

		# Question 3

		question_3 = str(r.recvuntil("places."))

		print(("The third question is: " + question_3))

		print("{:.2f}".format(answer))
		r.send("{:.2f}".format(answer) + "\n")
		r.recv()
		result = str(r.recvline())
		print("Result: " + result)

		if result == "Correct!\n":
			print(r.recv())
			break
		elif result == "Incorrect!\n":
			r.close()
			print("\nAnswer is incorrect retrying after 2 sec ...\n")
			time.sleep(2)
			answer += 0.01
			continue


if __name__ == '__main__':
	main()