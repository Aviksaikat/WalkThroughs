#!/bin/bash


curl -s https://failedinspection.freedomctf.org/ | grep -E "flag{.*}?" | cut -d '!' -f3 | cut -d '-' -f1
