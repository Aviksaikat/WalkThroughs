#!/bin/bash

unzip forensics_baby_apt.zip 2>/dev/null

binwalk -e christmaswishlist.pcap 2>/dev/null 

grep -iR "cmd" 2>/dev/null | strings | grep echo | cut -d " " -f 26 | base64 -d

rm -r _christmaswishlist.pcap.extracted christmaswishlist.pcap