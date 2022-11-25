#!/bin/bash
docker rm -f web_juggling_facts
docker build --tag=web_juggling_facts .
docker run -p 1337:1337 --rm --name=web_juggling_facts web_juggling_facts