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

## Task 16

1. There is an open port related to MS SQL Server accessible over the network. What is the port number?
```
1433
```
2. If the connection is successful, you will get a prompt. What is the prompt that you have received?
```
1>
```
3. We can see four columns in the table displayed above: id, first (name), last (name), and nickname. What is the first name of the reindeer of id 9?
```
Rudolph
```
4. Check the table schedule. What is the destination of the trip scheduled on December 7?
```
Prague
```
5. Check the table presents. What is the quantity available for the present “Power Bank”?
```
25000
```
6. There is a flag hidden in the grinch user's home directory. What are its contents?
```
THM{YjtKeUy2qT3v5dDH}
```

## Task 17

1. Scan the target server with the IP MACHINE_IP. Remember that MS Windows hosts block pings by default, so we need to add -Pn, for example, nmap -Pn MACHINE_IP for the scan to work correctly. How many TCP ports are open?
```
7
```
2. In the scan results you received earlier, you should be able to spot NFS or mountd, depending on whether you used the -sV option with Nmap or not. Which port is detected by Nmap as NFS or using the mountd service?
```
2049
```
3. How many shares did you find?
```
4
```
4. How many shares show “everyone”?
```
3
```
5. What is the title of file 2680-0.txt?
```
Meditations
```
6. It seems that Grinch Enterprises has forgotten their SSH keys on our system. One of the shares contains a private key used for SSH authentication (id_rsa). What is the name of the share?
```
confidential
```
7. We can calculate the MD5 sum of a file using md5sum FILENAME. What is the MD5 sum of id_rsa?
```
3e2d315a38f377f304f5598dc2f044de
```

## Task 18

1. Complete the username: p.....
```
pepper
```
2. What is the OS version?
```
10.0.17763 N/A Build 17763
```
3. What backup service did you find running on the system?
```
IperiusSvc
```
4. What is the path of the executable for the backup service you have identified?
```
C:\Program Files (x86)\Iperius Backup\IperiusService.exe
```
5. Run the whoami command on the connection you have received on your attacking machine. What user do you have?
```
the-grinch-hack\thegrinch
```
6. What is the content of the flag.txt file?
```
THM-736635221
```
7. The Grinch forgot to delete a file where he kept notes about his schedule! Where can we find him at 5:30?
```
jazzercize
```

## Task 19

1. How many pages did the dirb scan find with its default wordlist?
```
4
```
2. How many scripts do you see in the /home/thegrinch/scripts folder?
```
4
```
3. What are the five characters following $6$G in pepper's password hash?
```
ZUP42
```
4. What is the content of the flag.txt file on the Grinch's user’s desktop?
```
DI3H4rdIsTheBestX-masMovie!
```

## Task 21

1. What is the operator's username?
```
GrinchWho31
```
2. What social media platform is the username associated with?
```
twitter
```
3. What is the cryptographic identifier associated with the operator?
```
1GW8QR7CWW3cpvVPGMCF5tZz4j96ncEgrVaR
```
4. What platform is the cryptographic identifier associated with?
```
Keybase.io
```
5. What is the bitcoin address of the operator?
```
bc1q5q2w2x6yka5gchr89988p2c8w8nquem6tndw2f
```
6. What platform does the operator leak the bitcoin address on? 
```
github
```
7. What is the operator's personal email?
```
DonteHeath21@gmail.com
```
8. What is the operator's real name?
```
Donte Heath
```

## Task 22

1. What is the name of the S3 Bucket used to host the HR Website announcement?
```
images.bestfestivalcompany.com
```
2. What is the message left in the flag.txt object from that bucket?
```
It's easy to get your elves data when you leave it so easy to find!
```
3. What other file in that bucket looks interesting to you?
```
wp-backup.zip
```
4. What is the AWS Access Key ID in that file?
```
AKIAQI52OJVCPZXFYAOI
```
5. What is the AWS Account ID that access-key works for?
```
019181489476
```
6. What is the Username for that access-key?
```
ElfMcHR@bfc.com
```
7. There is an EC2 Instance in this account. Under the TAGs, what is the Name of the instance?
```
HR-Portal
```
8. What is the database password stored in Secrets Manager?
```
Winter2021!
```

## Task 23

1. What command will list container images stored in your local container registry?
```
docker images
```
2. What command will allow you to save a docker image as a tar archive?
```
docker save
```
3. What is the name of the file (including file extension) for the configuration, repository tags, and layer hash values stored in a container image?
```
manifest.json
```
4. What is the token value you found for the bonus challenge?
```
7095b3e9300542edadbc2dd558ac11fa
```

## Task 24

1. Who was the email sent to? (Answer is the email address)
```
elfmcphearson@tbfc.com
```
2. Phishing emails use similar domains of their targets to increase the likelihood the recipient will be tricked into interacting with the email. Who does it say the email was from? (Answer is the email address)
```
customerservice@t8fc.info
```
3. Sometimes phishing emails have a different reply-to email address. If this email was replied to, what email address will receive the email response?
```
fisher@tempmailz.grinch
```
4. Less sophisticated phishing emails will have typos. What is the misspelled word?
```
stright
```
5. The email contains a link that will redirect the recipient to a fraudulent website in an effort to collect credentials. What is the link to the credential harvesting website?
```
https://89xgwsnmo5.grinch/out/fishing/
```
6. View the email source code. There is an unusual email header. What is the header and its value?
```
X-GrinchPhish: >;^)
```
7. You received other reports of phishing attempts from other colleagues. Some of the other emails contained attachments. Open attachment.txt. What is the name of the attachment?
```
password-reset-instaructions.pdf
```
8. What is the flag in the PDF file?
```
THM{A0C_Thr33_Ph1sh1ng_An4lys!s}
```

## Task 25

1. Open the terminal and navigate to the file on the desktop named 'testfile'. Using the 'strings' command, check the strings in the file. There is only a single line of output to the 'strings' command. What is the output?
```
X5O!P%@AP[4\PZX54(P^)7CC)7}$EICAR-STANDARD-ANTIVIRUS-TEST-FILE!$H+H*
```
2. Check the file type of 'testfile' using the 'file' command. What is the file type?
```
EICAR virus test files
```
3. Calculate the file's hash and search for it on VirusTotal. When was the file first seen in the wild?
```
2005-10-17 22:03:48 
```
4. On VirusTotal's detection tab, what is the classification assigned to the file by Microsoft?
```
Virus:DOS/EICAR_Test_File
```
5. Go to this link to learn more about this file and what it is used for. What were the first two names of this file?
```
ducklin.htm or ducklin-html.htm
```
6. The file has 68 characters in the start known as the known string. It can be appended with whitespace characters upto a limited number of characters. What is the maximum number of total characters that can be in the file?
```
128
```

## Task 26

1. We changed the text in the string $a as shown in the eicaryara rule we wrote, from X5O to X50, that is, we replaced the letter O with the number 0. The condition for the Yara rule is $a and $b and $c and $d. If we are to only make a change to the first boolean operator in this condition, what boolean operator shall we replace the 'and' with, in order for the rule to still hit the file?
```
or
```
2. What option is used in the Yara command in order to list down the metadata of the rules that are a hit to a file? 
```
-m
```
3. What section contains information about the author of the Yara rule?
```
metadata
```
4. What option is used to print only rules that did not hit?
```
-n
```
5. Change the Yara rule value for the $a string to X50. Rerun the command, but this time with the -c option. What is the result?
```
0
```

## Task 27

1. What is the username (email address of Grinch Enterprises) from the decoded script?
```
Grinch.Enterprises.2021@gmail.com
```
2. What is the mailbox password you found?
```
S@ntai$comingt0t0wn
```
3. What is the subject of the email?
```
Christmas Wishlist
```
4. What port is the script using to exfiltrate data from the North Pole?
```
587
```
5. What is the flag hidden found in the document that Grinch Enterprises left behind? (Hint: use the following command oledump.py -s {stream number} -d, the answer will be in the caption).
```
YouFoundGrinchCookie
```
6. There is still a second flag somewhere... can you find it on the machine?
```
S@nt@c1Au$IsrEAl
```

## Task 28

1. What command was executed as Elf McNealy to add a new user to the machine?
```
Invoke-Nightmare
```
2. What user executed the PowerShell file to send the password.txt file from the administrator's desktop to a remote server?
```
adm1n
```
3. What was the IP address of the remote server? What was the port used for the remote connection? (format: IP,Port)
```
10.10.148.96,4321
```
4. What was the encryption key used to encrypt the contents of the text file sent to the remote server?
```
j3pn50vkw21hhurbqmxjlpmo9doiukyb
```
5. What application was used to delete the password.txt file?
```
sdelete.exe
```
6. What is the date and timestamp the logs show that password.txt was deleted? (format: MM/DD/YYYY H:MM:SS PM)
```
11/11/2021 7:29:27 PM
```
7. What were the contents of the deleted password.txt file?
```
Mission Control:letitsnowletitsnowletitsnow
```


## Task 29

1. What is the username of the other user on the system?
```
emily
```
2. What is the NTLM hash of this user?
```
8af326aa4850225b75c592d4ce19ccf5
```
3. What is the password for this user?
```
1234567890
```