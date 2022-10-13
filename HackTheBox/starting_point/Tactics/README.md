# TryHackMe Starting Point Tactics 

> Saikat Karmakar | Dec 21 : 2021

---

1. Which Nmap switch can we use to enumerate machines when our packets are otherwise blocked by the Windows firewall?
```
-Pn
```
2. What does the 3-letter acronym SMB stand for?
```
Server Message Block
```
3. What port does SMB use to operate at?
```
445
```
4. What command line argument do you give to `smbclient` to list available shares?
```
-L
```
5. What character at the end of a share name indicates it's an administrative share?
```
$
```
6. Which Administrative share is accessible on the box that allows users to view the whole file system?
```
C$
```
7. What command can we use to download the files we find on the SMB Share?
```
get
```
8. Which tool that is part of the Impacket collection can be used to get an interactive shell on the system?
```
psexec.py
```
9. Submit root flag 
```
HTB{f751c19eda8f61ce81827e6930a1f40c}
```