#!/bin/bash
docker rm -f web_hauntmarts
docker build --tag=web_hauntmarts .
docker run -p 1337:1337 --rm --name=web_hauntmarts web_hauntmarts