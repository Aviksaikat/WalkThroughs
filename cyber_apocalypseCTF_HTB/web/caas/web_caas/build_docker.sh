#!/bin/bash
docker rm -f web_caas
docker build -t web_caas . && \
docker run --name=web_caas --rm -p1337:80 -it web_caas