#!/bin/bash

curl -s -H "user-agent: gerald" http://web.bcactf.com:49156/ | grep "bcactf{.*}" | cut -d ":" -f2 | cut -d " " -f2
