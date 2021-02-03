#!/bin/bash

find . -type f -exec cat {} + 2>/dev/null | grep -R "flag{.*}" | head -n 1

