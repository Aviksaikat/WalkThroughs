# TryHackMe Ninja Skills

# Saikat Karmakar | Dec 19:2020

1. Which of the above files are owned by the best-group group(enter the answer 			separated by spaces in alphabetical order)
```
D8B3 v2Vb
```
2. Which of these files contain an IP address?
```
oiMO
```
3. Which file has the SHA1 hash of 9d54da7584015647ba052173b84d45e8007eba94
```
c4ZX
```
4. Which file contains 230 lines?
```
bny0
```
5. Which file's owner has an ID of 502?
```
X1Uy
```
6. Which file is executable by everyone?
```
8V2L 
```

```
find / -type f \( -name 8V2L -o -name bny0 -o -name c4ZX -o -name D8B3 -o -name FHl1 -o -name oiM0 -o -name PFbD -o -name rmfX -o -name SRSq -o -name uqyw -o -name v2Vb -o -name X1Uy \) 2>>/dev/null
```

```
#!/bin/bash
for i in $(find / -type f \( -name 8V2L -o -name bny0 -o -name c4ZX -o -name D8B3 -o -name FHl1 -o -name oiM0 -o -name PFbD -o -name rmfX -o -name SRSq -o -name uqyw -o -name v2Vb -o -name X1Uy \) 2>>/dev/null)
do
  	cat $i | grep -Eo "([0-9]{1,3}[\.]){3}[0-9]{1,3}"
done
```