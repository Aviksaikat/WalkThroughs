#!/bin/bash


passfile=$1

while read pass; 
do
	#statements
	echo "Trying $pass"
	echo "$pass" | /home/avik/bb-tools/firefox_decrypt/firefox_decrypt.py 3x6l3w88.default-release
done < $passfile