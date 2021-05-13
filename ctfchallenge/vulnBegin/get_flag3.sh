#!/bin/bash

curl -s server.vulnbegin.co.uk | jq | grep flag | cut -d '"' -f4
