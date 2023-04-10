#!/bin/bash
docker build -t web_passman .
docker run --name=web_passman --rm -p1337:1337 -it web_passman
