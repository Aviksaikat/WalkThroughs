#!/bin/bash
docker stop web_spybug
docker rm web_spybug
docker rmi $(docker images -f dangling=true -q)
docker rmi $(docker images -q web_spybug)
docker build --tag=web_spybug .
docker run -p 1337:1337 -e API_PORT=1337 -e FLAG="HTB{f4k3_fl4g_f0r_t3st1ng}" -e SESSION_SECRET=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1) -e ADMIN_SECRET=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1) web_spybug