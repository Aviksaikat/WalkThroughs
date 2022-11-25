#!/bin/bash
docker rm -f web_spookfier
docker build --tag=web_spookfier .
docker run -p 1337:1337 --rm --name=web_spookfier web_spookfier