#!/bin/bash
docker rm -f web_candyvault
docker build -t web_candyvault .
docker run --name=web_candyvault --rm -p1337:1337 -it web_candyvault