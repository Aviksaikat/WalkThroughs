#!/bin/bash

curl -I HEAD -s http://mercury.picoctf.net:47967/index.php\? | grep  "flag" | cut -d ":" -f2
