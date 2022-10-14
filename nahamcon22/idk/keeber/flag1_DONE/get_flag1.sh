#!/bin/bash


whois keebersecuritygroup.com | grep "flag" | head -1 | cut -d ' ' -f3