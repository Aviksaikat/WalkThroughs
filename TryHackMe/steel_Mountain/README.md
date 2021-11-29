# TryHackMe Steel Mountain

> Saikat Karmakar | Jul 29 : 2021

---

## Task 1

1. Who is the employee of the month?
```
Bill Harper
```

## Task 2

1. Scan the machine with nmap. What is the other port running a web server on?
```
8080
```
2. Take a look at the other web server. What file server is running?
```
Rejetto Http File Server
```
3. What is the CVE number to exploit this file server?
```
2014-6287 
```
4. Use Metasploit to get an initial shell. What is the user flag?
```
b04763b6fcf51fcd7c13abc7db4fd365
```

## Task 3

1. Take close attention to the CanRestart option that is set to true. What is the name of the service which shows up as an unquoted service path vulnerability?
```
AdvancedSystemCareService9
```
2. What is the root flag?
```
9af5f314f57607c00fd09803a587db80
```

## Task 4 
1. What powershell -c command could we run to manually find out the service name?
*Format is "powershell -c "command here"*
```
powershell -c "Get-Services"
```
