# TryHackMe Anthem

# Saikat Karmakar | Dec 11:2020

# Task 1 Website Analysis 
1. What port is for the web server?
```
80
```
2. What port is for remote desktop service?
```
3389
```
3. What is a possible password in one of the pages web crawlers check for?
```
UmbracoIsTheBest!
```
4. What CMS is the website using?
```
Umbraco
```
5. What is the domain of the website?
```
Anthem.com
```
6. What's the name of the Administrator
```
Solomon Grundy
```
7. Can we find find the email address of the administrator?
```
SG@anthem.com
```

# Spot the flags 
1. What is flag 1?
```
THM{L0L_WH0_US3S_M3T4}
```
2. What is flag 2?
```
THM{G!T_G00D}
```
3. What is flag 3?
```
THM{L0L_WH0_D15}
```
4. What is flag 4?
```
THM{AN0TH3R_M3TA}
```

# Final stage 
1. Gain initial access to the machine, what is the contents of user.txt?
```
THM{N00T_NO0T}
```
2. Can we spot the admin password?
```
ChangeMeBaby1MoreTime
```
3. Escalate your privileges to root, what is the contents of root.txt?
```
xfreerdp /u:administrator /p:ChangeMeBaby1MoreTime /v:10.10.249.181
THM{Y0U_4R3_1337}
```