#!/bin/bash

strace ./encodedpayload 2>&1 | grep -E "HTB{.*}" | head -1 | cut -d ' ' -f5 | cut -d '"' -f1