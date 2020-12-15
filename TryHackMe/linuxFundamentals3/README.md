# TryHackMe Linux Walkthrough (SSH-Only) Part-3 

# Saikat Karmakar | Dec 15:2020

# Task 3
1. Using relative paths, how would you cd to your home directory.
```
cd ~
```
2. Using absolute paths how would you make a directory called test in /tmp
```
mkdir /tmp/test
```

# Task 4 
1. How would I link /home/test/testfile to /tmp/test
```
ln /home/test/testfile /tmp/test
```

# Task 5
1. How do you find files that have specific permissions?
```
-perm
```
2. How would you find all the files in /home
```
find /home
```
3. How would you find all the files owned by paradox on the whole system
```
find / user paradox
```

# Task 6
1. What flag lists line numbers for every string found?
```
-n
```
2. How would I search for the string boop in the file aaaa in the directory /tmp
```
grep boop  /tmp/aaaa
```

# Task 7
1. What is shiba4's password
```
test1234
```

# Task 9
1. How do you specify which user you want to run a command as.
```
-u
```
2. How would I run whoami as user jen?
```
sudo -u jen whoami
```
3. How do you list your current sudo privileges(what commands you can run, who you 	   can run them as etc.)    
```
-l
```

# Task 10
1. How would I add the user test to the group test
```
sudo usermod -a -G test test
```

# Task 11
1. 
