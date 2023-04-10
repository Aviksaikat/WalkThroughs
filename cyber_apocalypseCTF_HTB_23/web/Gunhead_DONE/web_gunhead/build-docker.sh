#!/bin/bash
docker rm -f web_gunhead
docker build -t web_gunhead .
docker run --name=web_gunhead --rm -p1337:80 -it web_gunhead