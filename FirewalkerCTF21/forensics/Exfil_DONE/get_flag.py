#!/usr/bin/python3
import string

mappings = {}

def gen_mapping():
	for letter in string.printable:
		# for each char gen all possible results
		letter_res = []
		for i in range(7, -1, -1):
			# add the time the query would have taken for the result
			letter_res.append((ord(letter) >> i & 1) * 3)
		mappings[letter] = letter_res

def get_letter(times):
	for mapping in mappings:
		if mappings[mapping] == times:
			return mapping


def main():
	result = ""
	gen_mapping()
	# extract data from capture file
	# tshark -Y mysql -r capture.pcap > data

	with open("data", ) as f:
		times = []
		new_time = 0
		for line in f:
			if line[-9:] == "Response\n":
				# old time
				prev_time = new_time
				# getting the time of new response
				new_time = float(line.split()[1])
				diff = round(new_time - prev_time)
				times.append(diff)
				#total 8 req will be send for each lettre i.e. 7-0
				if len(times) == 8:
					result += get_letter(times)
					#print(f"[!]Data: {result}")
					times = []

	print(result[-31:])


if __name__ == '__main__':
	main()