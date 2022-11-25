#!/bin/bash

strings capture.pcap | grep -E "\"==" | cut -d ' ' -f9 | rev | sed 's/"//g' | base64 -d