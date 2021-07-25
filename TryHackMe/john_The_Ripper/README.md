# TryHackMe John The Ripper

> Saikat Karmakar | Jul 25 : 2021


---

## Task 4

1. What type of hash is hash1.txt?
```
md5
```
2. What is the cracked value of hash1.txt?
```
biscuit
```
3. What type of hash is hash2.txt?
```
sha1
```
4. What is the cracked value of hash2.txt
```
kangeroo
```
5. What type of hash is hash3.txt?
```
sha256
```
6. What is the cracked value of hash3.txt
```
microphone
```
7. What type of hash is hash4.txt?
```
Whirlpool
```
8. What is the cracked value of hash4.txt
```
colossal
```

## Task 5

1. What do we need to set the "format" flag to, in order to crack this?
```
nt
```
2. What is the cracked value of this password?
```
mushroom
```

## Task 6 

1. What is the root password?
```
1234
```

## Task 7

1. What is Joker's password?
```
Jok3r //john --single --format=raw-md5 hash7.txt 
```

## Task 8

1. What do custom rules allow us to exploit?
```
Password complexity predictability
```
2. What rule would we use to add all capital letters to the end of the word?
```
Az"[A-Z]"
```
3. What flag would we use to call a custom rule called "THMRules"
```
--rule=THMRules
```

## Task 9

1. What is the password for the secure.zip file?
```
pass123
```
2. What is the contents of the flag inside the zip file?
```
THM{w3ll_d0n3_h4sh_r0y4l}
```

## Task 10

1. What is the password for the secure.rar file?
```
password
```
2. What is the contents of the flag inside the zip file?
```
THM{r4r_4rch1ve5_th15_t1m3}
```

## Task 11

1. What is the SSH private key password?
```
mango
```
