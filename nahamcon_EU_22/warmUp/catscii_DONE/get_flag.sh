#!/bin/bash

cat catscii | grep "flag{.*}" | cut -d ' ' -f11

