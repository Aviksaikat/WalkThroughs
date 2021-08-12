# TryHackMe What the Shell?


> Saikat Karmakar | Aug 12 : 2021

---

## Task 3

1. Which type of shell connects back to a listening port on your computer, Reverse (R) or Bind (B)?
```
R
```
2. You have injected malicious shell code into a website. Is the shell you receive likely to be interactive? (Y or N)
```
N
```
3. When using a bind shell, would you execute a listener on the Attacker (A) or the Target (T)?
```
T
```

## Task 4

1. Which option tells netcat to listen?
```
-l
```
2. How would you connect to a bind shell on the IP address: 10.10.10.11 with port 8080?
```
nc 10.10.10.11 8080
```

## Task 5

1. How would you change your terminal size to have 238 columns?
```
stty -cols 238
```
2. What is the syntax for setting up a Python3 webserver on port 80?
```
sudo python3 -m http.server
```

## Task 6

1. How would we get socat to listen on TCP port 8080?
```
tcp-l:8080
```

## Task 7

1. What is the syntax for setting up an OPENSSL-LISTENER using the tty technique from the previous task? Use port 53, and a PEM file called "encrypt.pem"
```

```
2. If your IP is 10.10.10.5, what syntax would you use to connect back to this listener?
```

```

## Task 8

1. What command can be used to create a named pipe in Linux?
```

```

## Task 9

1. Which symbol is used to show that a shell is stageless?
```

```
2. What command would you use to generate a staged meterpreter reverse shell for a 64bit Linux target, assuming your own IP was 10.10.10.5, and you were listening on port 443? The format for the shell is elf and the output filename should be shell
```

```

## Task 10

1. What command can be used to start a listener in the background?
```

```
2. If we had just received our tenth reverse shell in the current Metasploit session, what would be the command used to foreground it?
```

```
