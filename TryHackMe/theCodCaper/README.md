# TryHackMe The Cod Caper

# Saikat Karmakar | Nov 26:2020

# Task 2: Host Enumeration 
1. How many ports are open on the target machine?
```
2
```
2. What is the http-title of the web server?
```
Apache2 Ubuntu Default Page: It works
```
3. What version is the ssh service? 
```
OpenSSH 7.2p2 Ubuntu 4ubuntu2.8
```
4. What is the version of the web server?
```
Apache/2.4.18 
```

# Task 3: Web Enumeration 
1. What is the name of the important file on the server?
```
administrator.php
```

# Task 4: Web Exploitation 
1. What is the admin username?
```
pingudad
```
2. What is the admin password?
```
secretpass
```
3. How many forms of SQLI is the form vulnerable to?
```
3
```

# Task 4: Command Execution 
1. How many files are in the current directory?
```
3
```
2. Do I still have an account
```
yes
```
3. What is my ssh password?
```
pinguapingu
```

# Task 5: LinEnum 
1. What is the interesting path of the interesting suid file?
```
find / -perm -u=s -type f 2>/dev/null

/opt/secret/root
```

# Task 6: pwndbg 
```
No ans nedded
```

# Task 7: Binary-Exploitaion: Manually 
```
No ans nedded same for 8 & 9 & 10
```

# Task 10: Finishing the job 
```
love2fish
```

# Notes
```
find / -user pingu 2>/dev/null

find dir owned by pingu & redirect all error to /dev/null i.e. no error will be shown on the promt

user pass: postman
root pass: love2fish
```