# TryHackMe ToolsRus


> Saikat Karmakar | Jul 27 : 2021

---

## Task 1

1. What directory can you find, that begins with a "g"?
```
guidelines
```
2. Whose name can you find from this directory?
```
bob
```
3. What directory has basic authentication?
```
protected
```
4. What is bob's password to the protected part of the website?
```
bubbles
```
5. What other port that serves a webs service is open on the machine?
```
1234
```
6. Going to the service running on that port, what is the name and version of the software?
```
Apache Tomcat/7.0.88
```
7. Use Nikto with the credentials you have found and scan the /manager/html directory on the port found above.How many documentation files did Nikto identify?
```
5
```
8. What is the server version (run the scan against port 80)?
```
Apache/2.4.18
```
9. What version of Apache-Coyote is this service using?
```
1.1
```
10. Use Metasploit to exploit the service and get a shell on the system.What user did you get a shell as?
```
root
```
11. What text is in the file /root/flag.txt
```
ff1fc4a81affcc7688cf89ae7dc6e0e1
```