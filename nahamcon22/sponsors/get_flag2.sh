#!/bin/bash


curl -I -s https://flag.hadrian.app/ | grep "flag" | cut -d ' ' -f2