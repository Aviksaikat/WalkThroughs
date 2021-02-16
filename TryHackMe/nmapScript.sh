#!/bin/bash
if [ "$1" == "" ]
then
	echo "Missing Arguments"

else
	nmap $1 | cut -d " " -f 1 | tr -cd '[:digit:]\n' | sed '/^$/d;s/[[:blank:]]//g' > ports
	function scan()
	{
		#Reading file by omitting backslash escape by using `-r` 
		for port in `ports[*]`
		do
			nmap -sV -p $port $1
		done
	}


	fileName = ports
	i = 0

	while read -r line;
	do
		ports[$i] = $line
	done < fileName

	#passing array name to the fn. by name reference
	scan `ports[*]`