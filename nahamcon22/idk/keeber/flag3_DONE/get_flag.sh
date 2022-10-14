#!/bin/bash

curl -s https://app.asana.com/api/1.0/users/me -H "Authorization: Bearer 1/1202152286661684:f136d320deefe730f6c71a91b2e4f7b1" | jq '.data.name' | sed -e s/\"//g