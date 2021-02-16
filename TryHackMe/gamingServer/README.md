# TryHackMe GamingServer

# Saikat Karmakar | Jan 9:2021

# Task 1 
1. hat is the user flag?
```
a5c2ff8b9c2e3d4fe9d4ff2f1a5a6e7e
```
2. What is the root flag?
```
2e337b8c9f3aff0c2b3e8d4e6a7c88fc
```

***Notes***

user : john
after ssh2john got pass passphrase for ssh key : letmein
lxd priv escalation : https://github.com/carlospolop/hacktricks/blob/master/linux-unix/privilege-escalation/interesting-groups-linux-pe/lxd-privilege-escalation.md
cd /mnt/root/root //bcz. we have mounted the original file system to this /mnt/root