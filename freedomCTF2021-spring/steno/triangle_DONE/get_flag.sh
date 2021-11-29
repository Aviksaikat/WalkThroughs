#!/bin/bash

strings triANGLE.png | grep "flag{.*}" | tr '&' " "
