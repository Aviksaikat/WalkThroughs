#!/bin/bash

echo -n $(cat new_header) |  openssl dgst -sha256 -mac HMAC -macopt hexkey:$(cat hex) | grep "[a-z0-9]" | cut -d ' ' -f2 > new_hex