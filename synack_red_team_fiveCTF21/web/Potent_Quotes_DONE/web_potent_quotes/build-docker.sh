#!/bin/bash
docker build --tag=potent_quotes .
docker run -p 1337:80 --rm --name=potent_quotes -it potent_quotes
