#!/bin/bash
docker build -t bonechewercon .
docker run --name=bonechewercon --rm -p1337:80 -it bonechewercon