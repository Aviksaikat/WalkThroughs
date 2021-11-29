# TryHackMe Web Enumeration

> Saikat Karmakar | AUG 18 : 2021

---

## Task 6

1. Run a directory scan on the host. Other than the standard css, images and js directories, what other directories are available?
```
public, Changes, VIDEO 
```
2. Run a directory scan on the host. In the "C******" directory, what file extensions exist?
```
conf,js
```
3. There's a flag out there that can be found by directory scanning! Find it!
```
thm{n1c3_w0rk}
```
4. There are some virtual hosts running on this server. What are they?
```
learning, products
```
5. There's another flag to be found in one of the virtual hosts! Find it!
```
thm{gobuster_is_fun}
```

## Task 8

1. What would be the full URL for the theme "twentynineteen" installed on the WordPress site: "http://cmnatics.playground"
```
http://cmnatics.playground//wp-content/themes/twentynineteen
```
2. What argument would we provide to enumerate a WordPress site?
```
enumerate
```
3. What is the name of the other aggressiveness profile that we can use in our WPScan command?
```
passive
```

## Task 9

1.  Enumerate the site, what is the name of the theme that is detected as running?
```
twentynineteen
```
2. WPScan says that this theme is out of date, what does it suggest is the number of the latest version?
```
2.0
```
3. Enumerate the site, what is the name of the plugin that WPScan has found?
```
nextgen-gallery
```
4. Enumerate the site, what username can WPScan find?
```
Phreakazoid
```
5. Construct a WPScan command to brute-force the site with this username, using the rockyou wordlist as the password list. What is the password to this user? 
```
linkinpark
```

## Task 11

1. What argument would we use if we wanted to scan port 80 and 8080 on a host?
```
-p 80,8080
```
2. What argument would we use if we wanted to see any cookies given by the web 
server? 
```
-Display 2
```

## Task 12

1. What is the name & version of the web server that  Nikto has determined running on port 80?
```
Apache/2.4.7
```
2. There is another web server running on another port. What is the name & version of this web server?
```
Apache-Coyote/1.1
```
3. What is the name of the Cookie that this JBoss server gives?
```
JSESSIONID
```