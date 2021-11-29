#!/bin/bash
docker rm -f simplay
docker build -t simplay . && \
docker run --name=simplay --rm -p1337:80 -it simplay