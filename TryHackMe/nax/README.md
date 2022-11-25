# TryHackMe Nax 

> Saikat Karmakar | Oct 10 : 2022

---

1. What hidden file did you find?
```
/PI3T.PNg //piet esolang
```
2. Who is the creator of the file?
```
Piet Mondrian
```
3. What is the username you found?
```
npiet PI3T.ppm -e 1000 2>/dev/null | grep nagiosadmin
- nagiosadmin%n3p3UQ&9BjLp4$7uhWdYnagiosadmin%n3p3UQ&9BjLp4$7uhWdYnagiosadmin%n3
- nagiosadmin%n3p3UQ&9BjLp4$7uhWdY
```
```
nagiosadmin
```
4. What is the password you found?
```
3p3UQ&9BjLp4$7uhWdY
```
5. What is the CVE number for this vulnerability? This will be in the format: CVE-0000-0000
```
CVE-2019-15949
```
6. After Metasploit has started, let's search for our target exploit using the command 'search applicationame'. What is the full path (starting with exploit) for the exploitation module?
```
exploit/linux/http/nagios_xi_plugins_check_plugin_authenticated_rce
```
7. Compromise the machine and locate user.txt
```
THM{84b17add1d72a9f2e99c33bc568ae0f1}
```
8. Locate root.txt
```
THM{c89b2e39c83067503a6508b21ed6e962}
```