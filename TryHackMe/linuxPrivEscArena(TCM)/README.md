# TryHackMe Linux PrivEsc Arena 

# Saikat Karmakar | Jan 3:2021


# Task 4
1. What password did you find?
```
password321
```
2. What user's credentials were exposed in the OpenVPN auth file?
```
user
```

# Task 5
1. What was TCM trying to log into?
```
mysql
```
2. Who was TCM trying to log in as?
```
root
```
3. Naughty naughty.  What was the password discovered?
```
password123
```

# Task 6 
1. What were the file permissions on the /etc/shadow file?
```
-rw-rw-r--
```

# Task 7
1.  What's the full file path of the sensitive file you discovered? 
```
/backups/supersecretkeys/id_rsa
```

# Task 12
1. What CVE is being exploited in this task?
```
CVE-2016-1247
```
2. What binary is SUID enabled and assists in the attack?
```
sudo
```

# Task 13
1. What is the last line of the "strings /usr/local/bin/suid-env" output?
```
service apache2 start
```

# Task 14
1. What is the last line of the "strings /usr/local/bin/suid-env2" output?
```
/usr/sbin/service apache2 start
```