# TryHackMe Starting Point Included 

> Saikat Karmakar | Dec 30 : 2021

---

1. What service is running on the target machine over UDP?
```
tftp
```
2. What class of vulnerability is the webpage that is hosted on port 80 vulnerable to?
```
Local file inclusion
```
3. What is the default system folder that TFTP uses to store files?
```
/var/lib/tftpboot/
```
4. Which interesting file is located in the web server folder and can be used for Lateral Movement?
```
.htpasswd
```
5. What is the group that user Mike is a part of and can be exploited for Privilege Escalation?
```
lxd
```
6. When using an image to exploit a system via containers, we look for a very small distribution. Our favorite for this
```
alpine
```
7. What flag do we set to the container so that it has root privileges on the host system?
```
security.privileged=true
```
8. If the root filesystem is mounted at /mnt in the container, where can the root flag be found on the container after the host system is mounted?
```
/mnt/root/
```
9. Submit user flag
```
HTB{a56ef91d70cfbf2cdb8f454c006935a1}
```
10. Submit root flag 
```
HTB{c693d9c7499d9f572ee375d4c14c7bcf}
```