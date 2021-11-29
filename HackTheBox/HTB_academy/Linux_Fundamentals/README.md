# HackTheBox Academy : Linux Fundamentals  


> Saikat Karmakar | Mar 24:2021
-------------------------------------------------------------------------------

# System Information

1.	Find out the machine hardware name and submit it as the answer.
```
x86_64
```
2.	What is the path to htb-student's home directory?
```
/home/htb-student
```
3.	What is the path to the htb-student's mail?
```
/var/mail/htb-student //cmd = env | grep MAIL
```
4.	Which shell is specified for the htb-student user?
```
/bin/bash
```
5.	Which kernel version is installed on the system? (Format: 1.22.3)
```
4.15.0
```
6.	What is the name of the network interface that MTU is set to 1500?
```
ens192
```

# User Management
1.	Which option needs to be set to create a home directory for a new user 		using "useradd" command?
```
-m
```
2.	Which option needs to be set to lock a user account using the "usermod" 	command? (long version of the option)
```
--lock
```
3.	Which option needs to be set to execute a command as a different user 		using the "su" command? (long version of the option)
```
--command
```

# Service and Process Management

1.	Use "systemctl" command to list all units of services and submit the unit 	  name with the description "Load AppArmor profiles" as the answer.
```
snapd.apparmor.service
```

# Working with Web Services

1.	Find a way to start a simple HTTP server using "npm". Submit the command 	 that starts the web server on port 8080 (use the short argument to specify 	the port number).
```
http-server -p 8080
```
2.	Find a way to start a simple HTTP server using "php". Submit the command 	 that starts the web server on the localhost (127.0.0.1) on port 8080.
```
php -S 127.0.0.1:8080
```

# Navigation
1.	What is the name of the hidden "history" file in the htb-user's home 		directory? 
```
.bash_history
```
2.	What is the index number of the "sudoers" file in the "/etc" directory?
```
1573625
```

# Working with Files and Directories
1.	 What is the name of the last modified file in the "/var/backups" 			 directory?
```
apt.extended_states.0
```
2.	What is the inode number of the "shadow.bak" file in the "/var/backups" 	directory?
```
265293
```

# Find Files and Directories
1.	What is the name of the config file that has been created after 			2020-03-03 and is smaller than 28k but larger than 25k?
```
00-mesa-defaults.conf
```
2.	How many files exist on the system that have the ".bak" extension?
```
4
```
3.	 Submit the full path of the "xxd" binary.
```
/usr/bin/xxd
```

# File Descriptors and Redirections
1.	How many files exist on the system that have the ".log" file extension?
```
30
```
2. How many total packages are installed on the target system?
```
737
```

# Filter Contents

1.	How many services are listening on the target system on all interfaces? (	 Not on localhost and IPv4 only)
```
7 
```
```bash
ss -l -4 | grep -v "127\.0\.0" | grep "LISTEN" | wc -l
Where:

-l: show only listening services
-4: show only ipv4
-grep -v "127.0.0": exclude all localhost results
-grep "LISTEN": better filtering only listening services
wc -l: count results
```
2.	Determine what user the ProFTPd server is running under. Submit the 		username as the answer.
```
proftpd
```
3.	Use cURL from your Pwnbox (not the target machine) to obtain the source 	code of the "https://www.inlanefreight.com" website and filter all unique 	  paths of that domain. Submit the number of these paths as the answer.
```
33
```
```bash
 curl https://www.inlanefreight.com/ | grep -Po 'https://www.inlanefreight.com/\K[^"]+' | sort -u | wc -l
```

