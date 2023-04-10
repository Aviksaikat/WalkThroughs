#!/bin/bash
docker rm -f web_orbital
docker build --tag=web_orbital .
docker run -p 1337:1337 --rm --name=web_orbital web_orbital -d