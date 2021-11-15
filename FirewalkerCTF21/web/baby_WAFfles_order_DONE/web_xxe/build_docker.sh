#!/bin/bash
docker build -t web_baby_waffles_order .
docker run --rm -p1337:80 -it web_baby_waffles_order