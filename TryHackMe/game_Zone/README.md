# TryHackMe Game Zone

> Saikat Karmakar | AUG 3 : 2021

---

## Task 1

1. What is the name of the large cartoon avatar holding a sniper on the forum?
```
Agent 47
```

## Task 2

1. When you've logged in, what page do you get redirected to?
```
portal.php
```

## Task 3

1. In the users table, what is the hashed password?
```
ab5db915fc9cea6c78df88106c6500c57f2b52901ca6c0c6218f04122c3efd14
```
2. What was the username associated with the hashed password?
```
agent47
```
3. What was the other table name?
```
post
```


## Task 4

1. What is the de-hashed password?
```
videogamer124
```
2. Now you have a password and username. Try SSH'ing onto the machine.What is the user flag?
```
649ac17b1480ac13ef1e4fa579dac95c
```

## Task 5

1. How many TCP sockets are running?
```
5
```
2. What is the name of the exposed CMS?
```
webmin
```
3. What is the CMS version?
```
1.580
```

## Task 6

1. What is the root flag?
```
a4b945830144bdd71908d12d902adeee
```


- new thing learned `reveal services using a reverse SSH tunnel`