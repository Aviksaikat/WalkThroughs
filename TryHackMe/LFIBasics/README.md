# TryHackMe LFI Basics

# Saikat Karmakar | Jan 6:2021

# Task 1 

1. What's the message you get when you include the home.html?
```
You included home.html
```
2. What user that it's not by default there is present?
```
lfi
```

# Task 2 

1. Add the "?page=" parameter, and try to include the home page again. Does it work 	(Yes/No)?
```
No
```
2. What are the credit card numbers?
```
1111-2222-3333-4444
```

# Task 3 
1. Can you read the log (Yes/No)?
```
Yes
```
2. Give it a try and run uname -r. What's the output of the command?
```
4.15.0-72-generic
```
3. With this knowledge read the flag from the lfi user home directory.
```
THM{a352a5c2acfd222251c33a94105b718fea}
```