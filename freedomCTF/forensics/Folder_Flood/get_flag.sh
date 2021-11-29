#!/bin/bash


#find  ./ -type f -name *.txt | while read line; do cat $line ; done 

find  ./ -type f -iname *.txt |  grep -iR flag
