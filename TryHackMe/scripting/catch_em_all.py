#!/usr/bin/python3

from socket import *
from re import findall, split
from time import sleep
import sys


def cal(operation, oldNum, newNum):

	if operation == "add":
		return oldNum + newNum
	if operation == "minus":
		return oldNum - newNum
	if operation == "multiply":
		return oldNum * newNum
	if operation == "divide":
		return oldNum / newNum
	else:
		return None

def assignData(data):
	#Split data with multi delim
	dataArr = split(r" |\*|\n", data) 

	#Filter null strings
	dataArr = list(filter(None, dataArr))
	
	#Assign the last 3 values of the data
	op = dataArr[-3]
	newNum = float(dataArr[-2])
	nextPort = int(dataArr[-1])

	return op, newNum, nextPort

def main():
	serverIP = sys.argv[1] 
	serverPort = 1337
	#Start at 0 as per instruction
	oldNum = 0

	while serverPort != 9765:
		#try until port 1337 available
		try: 
			if serverPort == 1337:
				print(f"Connecting to {serverIP} waiting for port {serverPort} to become available...")

			#Create socket and connect to server
			s = socket(AF_INET, SOCK_STREAM)
			s.connect((serverIP, serverPort))

			#Send get request to server
			gRequest = f"GET / HTTP/1.0\r\nHost: {serverIP}:{serverPort}\r\n\r\n"
			s.send(gRequest.encode())

			#print("aa")
			#Retrieve data from get request
			while True:
				response = s.recv(1024)
				if (len(response) < 1):
					break
				data = response.decode()
				#print("yha")

			#Format and assign the data into usable variables
			op, newNum, nextPort = assignData(data)
			
			#Perform given calculations
			oldNum = cal(op, oldNum, newNum)
			
			#Display output and move on
			print(f"Current number is {oldNum}, moving onto port {nextPort}")
			serverPort = nextPort

			s.close()

		except:
			s.close()
			sleep(3) #Ports update every 4 sec
			pass

	print(f"The final answer is {round(oldNum, 2)}")


if __name__ == "__main__":
	main()
