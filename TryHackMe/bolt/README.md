#TryHackMe Bolt

# Saikat Karmakar | Feb 25:2021

--------------------------------------------------------------------------

# Task 2
1.	What port number has a web server with a CMS running?
```
8000
```
2.	What is the username we can find in the CMS?
```
bolt
```
3.	What is the password we can find for the username?
```
boltadmin123
```
4.	What version of the CMS is installed on the server? (Ex: Name 1.1.1)
```
bolt 3.7.1
```
5.	There's an exploit for a previous version of this CMS, which allows 	authenticated RCE. Find it on Exploit DB. What's its EDB-ID?
```
48296
```
6.	Metasploit recently added an exploit module for this vulnerability. 	What's the full path for this exploit? (Ex: exploit/....)
	Note: If you can't find the exploit module its most likely because your metasploit isn't updated. Run `apt update` then `apt install metasploit-framework`
```
exploit/unix/webapp/bolt_authenticated_rce
```	
7.	Look for flag.txt inside the machine.
```
THM{wh0_d035nt_l0ve5_b0l7_r1gh7?}
```


--
-----------
***Notes***
-----------
look for login page locations, file structure etc. in the CMS