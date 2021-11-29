#!/bin/bash

curl -s https://no-right-click.hsc.tf/useless-file.css | grep "flag{.*}" | cut -d " " -f2
