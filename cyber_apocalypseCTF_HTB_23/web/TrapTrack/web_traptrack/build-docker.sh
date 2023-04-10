#!/bin/bash
docker build --tag=web_traptrack .
docker run -p 1337:1337 --rm --name=web_traptrack web_traptrack