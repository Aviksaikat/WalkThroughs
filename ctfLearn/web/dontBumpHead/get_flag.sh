#!/bin/bash

##### Don't Bump Your Head(er) #####


curl --referer  awesomesauce.com http://165.227.106.113/header.php -A "Sup3rS3cr3tAg3nt" 

#all works the same
curl -X GET http://165.227.106.113/header.php -H "user-agent:Sup3rS3cr3tAg3nt" -e "awesomesauce.com"

curl --get http://165.227.106.113/header.php -H "user-agent:Sup3rS3cr3tAg3nt" -H "referer:awesomesauce.com"
