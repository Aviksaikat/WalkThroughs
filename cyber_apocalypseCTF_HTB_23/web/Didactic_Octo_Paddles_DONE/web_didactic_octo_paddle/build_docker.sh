#!/bin/bash
docker rm -f web_didactic_octo_paddles
docker build -t web_didactic_octo_paddles . 
docker run --name=web_didactic_octo_paddles --rm -p1337:1337 -it web_didactic_octo_paddles