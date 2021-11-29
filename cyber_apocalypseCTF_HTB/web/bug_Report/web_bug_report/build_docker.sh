#!/bin/bash
docker rm -f web_bug_report
docker build -t web_bug_report . && \
docker run --name=web_bug_report --rm -p1337:1337 -it web_bug_report