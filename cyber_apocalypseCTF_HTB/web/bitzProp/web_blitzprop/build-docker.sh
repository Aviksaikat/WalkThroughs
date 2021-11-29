#!/bin/bash
docker rm -f web_blitzprop
docker build --tag=web_blitzprop . && \
docker run --name=web_blitzprop --rm -p1337:1337 -it web_blitzprop
