# TryHackMe Vulnversity

> Saikat Karmakar | Aug 9 : 2021

---

## Task 2

1. Scan the box, how many ports are open?
```
6
```
2. What version of the squid proxy is running on the machine?
```
3.5.12
```
3. How many ports will nmap scan if the flag -p-400 was used?
```
400
```
4. Using the nmap flag -n what will it not resolve?
```
DNS
```
5. What is the most likely operating system this machine is running?
```
Ubuntu
```
6. What port is the web server running on?
```
3333
```

## Task 3

1. What is the directory that has an upload form page?
```
/internal/
```

## Task 4

1. Try upload a few file types to the server, what common extension seems to be blocked?
```
.php
```
2. Run this attack, what extension is allowed?
```
.phtml
```
3. What is the name of the user who manages the webserver?
```
bill
```
4. What is the user flag?
```
8bd7992fbe8a6ad22a63361004cfcedb
```

## Task 5

1. On the system, search for all SUID files. What file stands out?
```
/bin/systemctl
```
2. Become root and get the last flag (/root/root.txt)
```
a58ff8579f0a9270368d33a9966c7fd5
```