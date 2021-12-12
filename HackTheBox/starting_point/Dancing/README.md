# TryHackMe Starting Point Dancing

> Saikat Karmakar | Dec 12 : 2021

---

1. What does the 3-letter acronym SMB stand for? 
```
Server Message Block
```
2. What port does SMB use to operate at?
```
445
```
3. What network communication model does SMB use, architecturally speaking?
```
client-server model
```
4. What is the service name for port 445 that came up in our nmap scan?
```
microsoft-ds
```
5. What is the tool we use to connect to SMB shares from our Linux distribution?
```
smbclient
```
6. What is the `flag` or `switch` we can use with the SMB tool to `list` the contents of the share?
```
-L
```
7. What is the name of the share we are able to access in the end?
```
WorkShares
```
8. What is the command we can use within the SMB shell to download the files we find?
```
get
```
9. Submit root flag
```

```