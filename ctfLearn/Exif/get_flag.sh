#!/bin/bash

#strings com.jpg | grep -E "flag"
# usage ./get_flag.sh fileName

strings $1 | grep -E "flag"

#flag{3l1t3_3x1f_4uth0r1ty_dud3br0}
