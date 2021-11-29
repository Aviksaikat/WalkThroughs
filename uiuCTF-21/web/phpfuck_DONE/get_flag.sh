#!/bin/bash

curl -s http://phpfuck.chal.uiuc.tf/flag.php | grep -E "uiuctf{.*}" | cut -d ' ' -f3 