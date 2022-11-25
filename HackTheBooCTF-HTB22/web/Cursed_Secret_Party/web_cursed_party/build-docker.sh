#!/bin/bash
docker rm -f web_cursed_party
docker build -t web_cursed_party .
docker run --name=web_cursed_party --rm -p1337:1337 -it web_cursed_party