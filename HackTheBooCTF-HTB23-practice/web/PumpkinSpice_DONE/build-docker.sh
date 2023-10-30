#!/bin/bash
docker rm -f web_pumpkinspice
docker build -t web_pumpkinspice .
docker run --rm -p1337:1337 -it web_pumpkinspice