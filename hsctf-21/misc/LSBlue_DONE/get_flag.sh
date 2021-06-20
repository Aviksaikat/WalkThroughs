#!/bin/bash

zsteg lsblue.png | cut -d ":" -f2 | grep "flag{.*}" | cut -d '"' -f2
