# TryHackMe Advent of Cyber 3


> Saikat Karmakar | Dec 1 : 2021 


---

## Task 6

1. After finding Santa's account, what is their position in the company?
```
The Boss!
```
2. After finding McStocker's account, what is their position in the company?
```
Build Manager
```
3. After finding the account responsible for tampering, what is their position in the company?
```
Mischief Manager
```
4. What is the received flag when McSkidy fixes the Inventory Management System?
```
THM{AOC_IDOR_2B34BHI3}
```

## Task 7

1. What is the name of the new cookie that was created for your account?
```
user-auth
```
2. What encoding type was used for the cookie value?
```
hexadecimal
```
3. What object format is the data of the cookie stored in?
```
JSON
```
4. Manipulate the cookie and bypass the login portal.What is the value of the administrator cookie? (username = admin)
```
7b636f6d70616e793a2022546865204265737420466573746976616c20436f6d70616e79222c206973726567697374657265643a2254727565222c20757365726e616d653a2261646d696e227d
```
5. What team environment is not responding?
```
HR
```
6. What team environment has a network warning?
```
Application
```

## Task 8

1. Using a common wordlist for discovering content, enumerate http://MACHINE_IP to find the location of the administrator dashboard. What is the name of the folder?
```
admin
```
2. In your web browser, try some default credentials on the newly discovered login form for the "administrator" user. What is the password?
```
administrator
```
3. Access the admin panel. What is the value of the flag?
```
THM{ADM1N_AC3SS}
```

## Task 9

1. What valid password can you use to access the "santa" account?
```
cookie
```
2. What is the flag in Santa's itinerary?
```
THM{SANTA_DELIVERS}
```

## Task 10

1. What flag did you get when you disabled the plugin? 
```
THM{NO_MORE_BUTTMAS}
```

## Task 11

1. Deploy the attached VM and look around. What is the entry point for our web application?
```
err
```
2. Use the entry point to perform LFI to read the /etc/flag file. What is the flag?
```
THM{d29e08941cf7fe41df55f1a7da6c4c06} 
```
3. Use the PHP filter technique to read the source code of the index.php. What is the $flag variable's value?
```
THM{791d43d46018a0d89361dbf60d5d9eb8}
```
4. Now that you read the index.php, there is a login credential PHP file's path. Use the PHP filter technique to read its content. What are the username and password?
```
McSkidy:A0C315Aw3s0m
```
5. Use the credentials to login into the web application. Help McSkidy to recover the server's password. What is the password of the flag.thm.aoc server? 
```
THM{552f313b52e3c3dbf5257d8c6db7f6f1}
```
6. The web application logs all users' requests, and only authorized users can read the log file. Use the LFI to gain RCE via the log file page. What is the hostname of the webserver? The log file location is at ./includes/logs/app_access.log.
```
lfi-aoc-awesome-59aedca683fff9261263bb084880c965
```

## Task 12

1. Interact with the MongoDB server to find the flag. What is the flag? 
```
THM{8814a5e6662a9763f7df23ee59d944f9}
```
2. We discussed how to bypass login pages as an admin. Can you log into the application that Grinch Enterprise controls as admin and retrieve the flag?
Use the knowledge given in AoC3 day 4 to setup and run Burp Suite proxy to intercept the HTTP request for the login page. Then modify the POST parameter.
```zsh
curlie -X POST http://10-10-248-127.p.thmlabs.com/login -d '{"username":"admin","password":{"$ne":"password"}}'

```
```
THM{b6b304f5d5834a4d089b570840b467a8}
```
3. Once you are logged in, use the gift search page to list all usernames that have guest roles. What is the flag?
```zsh
https://10-10-248-127.p.thmlabs.com/search?username[$ne]=ben&role=guest
```
```
THM{2ec099f2d602cc4968c5267970be1326}
```
4. Use the gift search page to perform NoSQL injection and retrieve the mcskidy record. What is the details record?
```zsh
https://10-10-248-127.p.thmlabs.com/search?username=mcskidy&role[$ne]=guest
```
```
ID:6184f516ef6da50433f100f4:mcskidy:admin
```

## Task 13

1. Open the first transcription log. You can see the commands and output for everything that ran within PowerShell, like whoami and systeminfo!
```
Microsoft Windows 11
```
2. What was the password set for the new "backdoor" account?
```
grinchstolechristmas
```
3. In one of the transcription logs,  the bad actor interacts with the target under the new backdoor user account, and copies a unique file to the Desktop. Before it is copied to the Desktop, what is the full path of the original file? 
```
C:\Users\santa\AppData\Local\Microsoft\Windows\UsrClass.dat
```
4. The actor uses a Living Off The Land binary (LOLbin) to encode this file, and then verifies it succeeded by viewing the output file. What is the name of this LOLbin?
```
certutil.exe
```
5. Drill down into the folders and see if you can find anything that might indicate how we could better track down what this SantaRat really is. What specific folder name clues us in that this might be publicly accessible software hosted on a code-sharing platform?
```
.github
```
6. Additionally, there is a unique folder named "Bag of Toys" on the Desktop! This must be where Santa prepares his collection of toys, and this is certainly sensitive data that the actor could have compromised. What is the name of the file found in this folder? 
```
bag_of_toys.zip
```
7. What is the name of the user that owns the SantaRat repository?
```
Grinchiest
```
8. Explore the other repositories that this user owns. What is the name of the repository that seems especially pertinent to our investigation?
```
operation-bag-of-toys
```
9. Read the information presented in this repository. It seems as if the actor has, in fact, compromised and tampered with Santa's bag of toys! You can review the activity in the transcription logs. It looks as if the actor installed a special utility to collect and eventually exfiltrate the bag of toys. What is the name of the executable that installed a unique utility the actor used to collect the bag of toys?
```
uharc-cmd-install.exe
```
10. Following this, the actor looks to have removed everything from the bag of toys, and added in new things like coal, mold, worms, and more!  What are the contents of these "malicious" files (coal, mold, and all the others)?
```
GRINCHMAS
```
11. What is the password to the original bag_of_toys.uha archive? (You do not need to perform any password-cracking or bruteforce attempts)
```
TheGrinchiestGrinchmasOfAll
```
12. How many original files were present in Santa's Bag of Toys?
```
228
```

## Task 14

1. In the HTTP #1 - GET requests section, which directory is found on the web server?
```
login
```
2. What is the username and password used in the login page in the HTTP #2 - POST section? 
```
McSkidy:Christmas2021
```
3. What is the User-Agent's name that has been sent in HTTP #2 - POST section?
```
TryHackMe-UserAgent-THM{d8ab1be969825f2c5c937aec23d55bc9}
```
4. In the DNS section, there is a TXT DNS query. What is the flag in the message of that DNS query?
```
THM{dd63a80bf9fdd21aabbf70af7438c257}
```
5. In the FTP section, what is the FTP login password?
```
TryH@ckM3!
```
6. In the FTP section, what is the FTP command used to upload the secret.txt  file?
```
STOR
```
7. In the FTP section, what is the content of the secret.txt file?
```
123^-^321
```

## Task 15

1. Help McSkidy and run nmap -sT 10.10.66.126. How many ports are open between 1 and 100?
```
2
```
2. What is the smallest port number that is open?
```
22CVE-2021-41773
```
3. What is the service related to the highest port number you found in the first question?
```
HTTP
```
4. Now run nmap -sS 10.10.66.126. Did you get the same results? (Y/N)
```
Y
```
5. If you want Nmap to detect the version info of the services installed, you can use nmap -sV 10.10.66.126. What is the version number of the web server?
```
Apache httpd 2.4.49
```
6. By checking the vulnerabilities related to the installed web server, you learn that there is a critical vulnerability that allows path traversal and remote code execution. Now you can tell McSkidy that Grinch Enterprises used this vulnerability. What is the CVE number of the vulnerability that was solved in version 2.4.51?
```
CVE-2021-42013
```
7. You are putting the pieces together and have a good idea of how your web server was exploited. McSkidy is suspicious that the attacker might have installed a backdoor. She asks you to check if there is some service listening on an uncommon port, i.e. outside the 1000 common ports that Nmap scans by default. She explains that adding -p1-65535 or -p- will scan all 65,535 TCP ports instead of only scanning the 1000 most common ports. What is the port number that appeared in the results now?
```
20212
```
8. What is the name of the program listening on the newly discovered port?
```
telnetd
```