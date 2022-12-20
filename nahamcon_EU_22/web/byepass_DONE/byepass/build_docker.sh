#!/bin/bash
docker image rm -f web_byepass
docker build -t web_byepass .
docker run --rm -p1337:80 -it web_byepass