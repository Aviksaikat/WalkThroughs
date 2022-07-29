# # TryHackMe Fuff

> Saikat Karmakar | July 29 : 2022

---

## Task 2
1. What is the first file you found with a 200 status code?
```
favicon.ico
```

## Task 3
1. What text file did you find?
```
robots.txt
```
2. What two file extensions were found for the index page?
```
php, phps
```
3. What page has a size of 4840?
```
about.php
```
4. How many directories are there?
```
4
```

## Task 4
1. After applying the fc filter, how many results were returned?
```
11
```
2. After applying the mc filter, how many results were returned?
```
6
```
3. Which valuable file would have been hidden if you used -fc 403 instead of -fr?
```
wp-forum.phps
```

## Task 5
1. What is the parameter you found?
```
id
```
2. What is the highest valid id?
```
14
```
3. What is Dummy's password?
```
p@ssword
```

## Task 7
1. How do you save the output to a markdown file (ffuf.md)?
```
-of -o ffuf.md
```
2. How do you re-use a raw http request file?
```
-request
```
3. How do you strip comments from a wordlist?
```
-ic
```
4. How would you read a wordlist from STDIN?
```
-w -
```
5. How do you print full URLs and redirect locations?
```
-v 
```
6. What option would you use to follow redirects?
```
-r 
```
7. How do you enable colorized output?
```
-c 
```
