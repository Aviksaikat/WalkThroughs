# TryHackMe Nessus

# Saikat Karmakar | Dec 31:2020


# Task 3 
1.	As we log into Nessus, we are greeted with a button to launch a scan, what 		is the name of this button?
```
new scan
```
2.	Nessus allows us to create custom templates that can be used during the 	scan selection as additional scan types, what is the name of the menu 		where we can set these?
```
policies
```
3.	Nessus also allows us to change plugin properties such as hiding them or 		changing their severity, what menu allows us to change this?
```
plugin rules
```
4.	Nessus can also be run through multiple 'Scanners' where multiple 			installations can work together to complete scans or run scans on remote 	 networks, what menu allows us to see all of these installations?
```
scanners
```
5.	Let's move onto the scan types, what scan allows us to see simply what 		hosts are 'alive'?
```
host discovery
```
6.	One of the most useful scan types, which is considered to be 'suitable for 		any	host'?
```
basic network scan
```
7.	Following a few basic scans, it's often useful to run a scan wherein the 		scanner can authenticate to systems and evaluate their patching level. 			What scan allows you to do this?
```
credential patch audit
```
8.	When performing Web App tests it's often useful to run which scan? This 	can be 	incredibly useful when also using nitko, zap, and burp to gain a 	 full picture of an application. 
```
web application tests
```

# Task 4
1. Create a new 'Basic Network Scan' targeting the deployed VM. What option 	can we set under 'BASIC' to set a time for this scan to run? This can be 	 very useful when network congestion is an issue.
```
schedule
```
2.	Under discovery set the scan to cover ports 1-65535. What is this type 		called?
```
Port scan (all ports)
```
3.	As we are connected to the network via a VPN, it may be to our benefit to 	  'tone down' the scan a bit. What scan type can we change to under 			'ADVANCED' for this lower bandwidth connection?
```
Scan low bandwidth links
```
4.	After the scan completes, which 'Vulnerability' can we view the details of 		to see the open ports on this host?
```
nessus SYN scanner
```
5.	There seems to be a chat server running on this machine, what port is it 	 on?
```
6667
```
6.	There seems to be a chat server running on this machine, what port is it 	 on?Looks like we have a medium level vulnerability relating to SSH, what 		is this vulnerability named?
```
SSH Weak Algorithms Supported
```
7.	What web server type and version is reported by Nessus?
```
Apache/2.4.99
```

# Task 6
1.	What is the plugin id of the plugin that determines the HTTP server type 	 and version?
```
10107
```
2.	What authentication page is discovered by the scanner that transmits 		credentials in cleartext?
```
login.php
```
3.	What is the file extension of the config backup?
```
.bak
```
4.	What is the file extension of the config backup?
	Which directory contains example documents? (This will be in a php directory)
```
/external/phpids/0.6/docs/examples/
```
5.	What vulnerability is this application susceptible to that is associated 	 with X-Frame-Options?
```
Clickjacking
```
6.	What version of php is the server using?
```
5.5.9-1ubuntu4.26
```