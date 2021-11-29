#!/bin/bash

# Saikat Karmakar | Jun 6 : 2021 | FreedomCTF-Spring T-Rex

unzip -o -qq 33333pass.zip
cat 33333pass.txt | grep "^[A].[t].*[0-9].[o]$" | while read line; do echo "flag{$(echo "$line")}";done

rm -f 33333pass.txt