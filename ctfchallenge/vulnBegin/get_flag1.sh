#!/bin/bash

nslookup -type=TXT vulnbegin.co.uk | grep '\"\[*' | cut -d '"' -f2