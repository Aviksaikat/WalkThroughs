#!/bin/bash
docker rm -f web_spooktastic
docker build -t web_spooktastic .
docker run --rm -p1337:1337 -it web_spooktastic