#!/bin/ash

# Secure entrypoint
chmod 600 /entrypoint.sh
# Random flag
FLAG=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 5 | head -n 1)
mv /flag /flag$FLAG
mkdir /tmp/mongodb
mongod --noauth --dbpath /tmp/mongodb/ &
mongo imf --eval "db.createCollection('agents')"
mongo imf --eval 'db.agents.insert( { name: "Ilsa Faust", identifier: "5baaf43b-1e15-4a29-9f04-2578e1f7c4b7" , score: 10 } )'
mongo imf --eval 'db.agents.insert( { name: "Ethan Hunt", identifier: "de44e4a6-cd40-41c5-86f1-4706289af331" , score: 9.9 } )'
mongo imf --eval 'db.agents.insert( { name: "Jane Carter", identifier: "652b5bf0-9ece-481d-b89b-fbe44dbc050a" , score: 9.9 } )'
mongo imf --eval 'db.agents.insert( { name: "Franz Krieger", identifier: "8af4f002-8b3a-46a9-94c4-5e09cd2ce8f1" , score: 9.7 } )'
mongo imf --eval 'db.agents.insert( { name: "White Widow", identifier: "2f581aae-bd48-4970-9b95-17e5902d7f33" , score: 9.6 } )'
mongo imf --eval 'db.agents.insert( { name: "August Walker", identifier: "7b8dbeec-3b96-45bb-a784-c7baa59c98b6" , score: 9.5 } )'
mongo imf --eval 'db.agents.insert( { name: "Owen Davian", identifier: "6be81ea5-bbd0-4d99-8c62-0a7b0677a4c4" , score: 9.3 } )'
mongo imf --eval 'db.agents.insert( { name: "Solomon Lane", identifier: "5c943c89-38bd-4304-a584-f6134a19e117" , score: 9.2 } )'
mongo imf --eval 'db.agents.insert( { name: "Benji Dunn", identifier: "cd8a635f-a184-44be-9260-db1742118dbd" , score: 9.2 } )'
mongo imf --eval 'db.agents.insert( { name: "Luther Stickell", identifier: "7297352f-f4a1-465f-adf1-8248530a2a13" , score: 9 } )'
/usr/bin/supervisord -c /etc/supervisord.conf