#!/bin/bash
docker rm -f web_wild_goosehunt
docker build -t web_wild_goose_hunt . && \
docker run --name=web_wild_goose_hunt --rm -p1337:80 -it web_wild_goose_hunt