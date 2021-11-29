# TryHackMe Hacking with PowerShell

> Saikat Karmakar | Aug 6 : 2021

---

## Task 2

1. What is the command to get help about a particular cmdlet(without any parameters)?
```
Get-Help
```

## Task 3

1. What is the location of the file "interesting-file.txt"
```
Get-ChildItem -Path C:\ -Include *interesting-file.txt* -File -Recurse -ErrorAction SilentlyContinue
```
```
C:\Program Files
```
2. Specify the contents of this file
```
notsointerestingcontent 
```
3. How many cmdlets are installed on the system(only cmdlets, not functions and aliases)?
```
Get-Command | Where-Object -Parameter CommandType -eq Cmdlet | measure
```
```
6638
```
4. Get the MD5 hash of interesting-file.txt
```
Get-FileHash -Path "C:\Program Files\interesting-file.txt.txt" -Algorithm MD5
```
```
49A586A2A9456226F8A1B4CEC6FAB329 
```
5. What is the command to get the current working directory?
```
Get-Location
```
6. Does the path "C:\Users\Administrator\Documents\Passwords" Exist(Y/N)?
```
Get-Location -Path "C:\Users\Administrator\Documents\Passwords"
```
```
N
```
7. What command would you use to make a request to a web server?
```
Invoke-WebRequest
```
8. Base64 decode the file b64.txt on Windows. 
```
ihopeyoudidthisonwindows 
```


## Task 4

1. How many users are there on the machine?
```
5
```
2. Which local user does this SID(S-1-5-21-1394777289-3961777894-1791813945-501) belong to?
```
Guest
```
3. How many users have their password required values set to False?
```
Get-LocalUser | Where-Object -Property PasswordRequired -Match false
```
```
4
```
4. How many local groups exist?
```
24
```
5. What command did you use to get the IP address info?
```
Get-NetIPAddress
```
6. How many ports are listed as listening?
```
Get-NetTCPConnection | Where-Object -Property State -Match Listen | measure
```
```
20
```
7. What is the remote address of the local port listening on port 445?
```
Get-NetTCPConnection | Where-Object -Property State -Match Listen
```
```
::
```
8. How many patches have been applied?
```
Get-Hotfix | measure
```
```
20
```
9. When was the patch with ID KB4023834 installed?
```
Get-Hotfix -Id KB4023834
```
```
6/15/2017 12:00:00 AM
```
10. Find the contents of a backup file.
```
Get-ChildItem -Path C:\ -Include *.bak* -File -Recurse -ErrorAction SilentlyContinue

Get-Content "C:\Program Files (x86)\Internet Explorer\passwords.bak.txt"
```
```
backpassflag
```
11. Search for all files containing API_KEY
```
fakekey123
```
```
Get-ChildItem C:\* -Recurse | Select-String -pattern API_KEY
```
12. What command do you do to list all the running processes?
```
Get-Process
```
13. What is the path of the scheduled task called new-sched-task?
```
Get-ScheduleTask -TaskName new-sched-task
```
```
/
```
14. Who is the owner of the C:\
```
Get-Acl c:/
```
```
NT SERVICE\TrustedInstaller
```


## Task 5

1. What file contains the password?
```
Get-ChildItem .\emails\ -Recurse | Select-String -pattern password 
```
```
Doc3M
```
2. What is the password?
```
johnisalegend99 
```
3. What files contains an HTTPS link?
```
Doc2Mary
```

## Task 6

1. How many open ports did you find between 130 and 140(inclusive of those two)?
```
11
```