# TryHackMe Blue

#Task 1.
How many ports are open with a port number under 1000?
```
3
```
What is this machine vulnerable to? (Answer in the form of: ms??-???, ex: ms08-067)
```
MS17-010
```
#Task 2.
basic metasploit

#Task 3.
If you haven't already, background the previously gained shell (CTRL + Z). Research online how to convert a shell to meterpreter shell in metasploit. What is the name of the post module we will use? (Exact path, similar to the exploit we previously selected) 
```
post/multi/manage/shell_to_meterpreter
```
Select this (use MODULE_PATH). Show options, what option are we required to change? (All caps for answer)
```
SESSION
```
#Task 4.
Within our elevated meterpreter shell, run the command 'hashdump'. This will dump all of the passwords on the machine as long as we have the correct privileges to do so. What is the name of the non-default user? 
```
jon
```
Copy this password hash to a file and research how to crack it. What is the cracked password?
```
alqfna22 
```
#Task 5.
Flag1? (Only submit the flag contents {CONTENTS})
```
flag{access_the_machine}
```
Flag2? *Errata: Windows really doesn't like the location of this flag and can occasionally delete it. It may be necessary in some cases to terminate/restart the machine and rerun the exploit to find this flag. This relatively rare, however, it can happen. 
Location: C:\Windows\System32\config
```
flag{sam_database_elevated_access}
```
Flag3?
```
flag{admin_documents_can_be_valuable}
```



