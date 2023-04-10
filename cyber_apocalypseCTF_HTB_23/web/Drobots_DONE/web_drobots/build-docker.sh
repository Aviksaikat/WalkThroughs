#!/bin/bash
docker rm -f web_drobots
docker build --tag=web_drobots .
docker run -p 1337:1337 --rm --name=web_drobots web_drobots