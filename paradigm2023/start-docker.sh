#!/bin/bash

challenge_dir=$1

cd "$1/challenge/project" && docker build -t $1 . && docker run --privileged -p 1337:1337 -p 8545:8545 -e PERSIST_ETH_RPC_URL="$WEB3_TENDERLY_RPC" -it --rm $1