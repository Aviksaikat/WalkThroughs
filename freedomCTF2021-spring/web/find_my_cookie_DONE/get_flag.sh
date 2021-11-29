#!/bin/bash


curl -s -I https://findmycookie.freedomctf.org/ | grep "flag{.*}" | cut -d '"' -f2
