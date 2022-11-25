#!/bin/bash
docker rm -f web_evaluation_deck
docker build -t web_evaluation_deck .
docker run --name=web_evaluation_deck --rm -p1337:1337 -it web_evaluation_deck