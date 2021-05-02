# TryHackMe h4cked

> Saikat Karmakar | 2 May:2021

---
## Task 1 
1.	The attacker is trying to log into a specific service. What service is this?
```
FTP
```
2.	There is a very popular tool by Van Hauser which can be used to brute force a series of services. What is the name of this tool?
```
hydra
```
3.	The attacker is trying to log on with a specific username. What is the username?
```
jenny
```
4.	What is the user's password?
```
password123
```
5.	What is the current FTP working directory after the attacker logged in?
```
/var/www/html
```
6.	The attacker uploaded a backdoor. What is the backdoor's filename?
```
shell.php
```
7.	The backdoor can be downloaded from a specific URL, as it is located inside the uploaded file. What is the full URL?
```
http://pentestmonkey.net/tools/php-reverse-shell
```
8.	Which command did the attacker manually execute after getting a reverse shell?
```
whoami
```
9.	What is the computer's hostname?
```
wir3
```
10.	Which command did the attacker execute to spawn a new TTY shell?
```
python3 -c 'import pty; pty.spawn("/bin/bash")'
```
11.	Which command was executed to gain a root shell?
```
sudo su
```
12.	The attacker downloaded something from GitHub. What is the name of the GitHub project?
```
Reptile
```
13.	The project can be used to install a stealthy backdoor on the system. It can be very hard to detect. What is this type of backdoor called?
```
rootkit
```

## Task 2
1.	Read the flag.txt file inside the Reptile directory
```
ebcefd66ca4b559d17b440b6e67fd0fd
```


-----------
***Notes***
-----------
[21][ftp] host: 10.10.85.40   login: jenny   password: 987654321

