#!/bin/bash

cat public.pem |  xxd -p | tr -d "\\n" > hex
