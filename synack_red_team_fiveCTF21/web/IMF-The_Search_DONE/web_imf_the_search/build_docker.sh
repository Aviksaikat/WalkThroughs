#!/bin/bash
docker rm -f the_search
docker build -t the_search . && \
docker run --name=imf --rm -p1337:80 -it the_search
