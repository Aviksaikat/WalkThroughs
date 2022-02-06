# TryHackMe sqlmap

> Saikat Karmakar | Feb 6 : 2022

---

## Task 2

1. Which flag or option will allow you to add a URL to the command?
```
-u
```
2. Which flag would you use to add data to a POST request?
```
--data
```
3. There are two parameters: username and password. How would you tell sqlmap to use the username parameter for the attack?
```
-p username
```
4. Which flag would you use to show the advanced help menu?
```
-hh
```
5. Which flag allows you to retrieve everything?
```
-a
```
6. Which flag allows you to select the database name?
```
-D
```
7. Which flag would you use to retrieve database tables?
```
--tables
```
8. Which flag allows you to retrieve a table’s columns?
```
--columns
```
9. Which flag allows you to dump all the database table entries?
```
--dump-all
```
10. Which flag will give you an interactive SQL Shell prompt?
```
--sql-shell
```
11. You know the current db type is 'MYSQL'. Which flag allows you to enumerate only MySQL databases?
```
--dbms=mysql
```

## Task 3

1. What is the name of the interesting directory ?
```
blood
```
2. Who is the current db user? 
```
root
```
3. What is the final flag? 
```
thm{sqlm@p_is_L0ve}
```