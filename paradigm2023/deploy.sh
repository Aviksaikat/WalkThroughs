#!/bin/bash

challenge_dir=$1
PORT=8547
ANVIL_RPC_URL="http://127.0.0.1:$PORT"

# make it background
anvil --fork-url $WEB3_INFURA_RPC --auto-impersonate --port $PORT & #--derivation-path "m/44'/60'/0'/"

sleep 5

cd "$1/challenge/project" && forge script --rpc-url "$ANVIL_RPC_URL" script/Deploy.s.sol:Deploy --broadcast --unlocked --sender $(cast az)