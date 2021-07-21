# TryHackMe OWASP Top 10

> Saikat Karmakar | Apr 28 : 2021

---

## Task 5
1.	What strange text file is in the website root directory?
```
drpepper.txt
```
2.	How many non-root/non-service/non-daemon users are there?
```
0
```
3.	What user is this app running as?
```
www-data
```
4.	What is the user's shell set as?
```
/usr/sbin/nologin
```
5.	What version of Ubuntu is running?
```
18.04.4
```
6.	Print out the MOTD.  What favorite beverage is shown?
```
DR PEPPER
```

## Task 7
1.	What is the flag that you found in darren's account? 
```
fe86079416a21a3c99937fea8874b667
```
2.	What is the flag that you found in arthur's account?
```
d9ac0f7db4fda460ac3edeb75d75e16e
```

## Task 11
1.	What is the name of the mentioned directory?
```
/assets
```
2.	Navigate to the directory you found in question one. What file stands out as being likely to contain sensitive data?
```
webapp.db
```
3.	Use the supporting material to access the sensitive data. What is the password hash of the admin user?
```
6eea9b7ef19179a06954edd0f6c05ceb
```
4.	Crack the hash.What is the admin's plaintext password?
```
qwertyuiop
```
5.	Login as the admin. What is the flag?
```
THM{Yzc2YjdkMjE5N2VjMzNhOTE3NjdiMjdl}
```

## Task 13
1.	Full form of XML
```
eXtensible Markup Language
```
2.	Is it compulsory to have XML prolog in XML documents?
```
no
```
3.	Can we validate XML documents against a schema?
```
yes
```
4.	How can we specify XML version and encoding in XML document?
```
XML prolog
```

## Task 14
1.	How do you define a new ELEMENT?
```
!ELEMENT 
```
2.	How do you define a ROOT element?
```
!DOCTYPE
```
3.	How do you define a new ENTITY?
```
!ENTITY
```

## Task 16
1.	What is the name of the user in /etc/passwd
```
falcon
```
2.	Where is falcon's SSH key located?
```
/home/falcon/.ssh/id_rsa
```
3.	What are the first 18 characters for falcon's private key
```
MIIEogIBAAKCAQEA7
```

## Task 18
1.	Look at other users notes. What is the flag?
```
flag{fivefourthree}
```

## Task 19
1.	Hack into the webapp, and find the flag!
```
thm{4b9513968fd564a87b28aa1f9d672e17}
```

## Task 20
1.	Navigate to http://MACHINE_IP/ in your browser and click on the "Reflected XSS" tab on the navbar; craft a reflected XSS payload that will cause a popup saying "Hello".
```
ThereIsMoreToXSSThanYouThink
```
2.	On the same reflective page, craft a reflected XSS payload that will cause a popup with your machines IP address.
```
ReflectiveXss4TheWin // <script>alert(window.location.host)</script>
```
3.	Now navigate to http://MACHINE_IP/ in your browser and click on the "Stored XSS" tab on the navbar; make an account.Then add a comment and see if you can insert some of your own HTML.
```
HTML_T4gs 
```
4.	On the same page, create an alert popup box appear on the page with your document cookies.
```
W3LL_D0N3_LVL2 //<script>alert(document.cookie)</script>
```
5.	Change "XSS Playground" to "I am a hacker" by adding a comment and using Javascript.
```
websites_can_be_easily_defaced_with_xss
// <script>document.querySelector('#thm-title').textContent = 'I am a hacker'</script>
```

## Task 21
1.	 Who developed the Tomcat application?
```
The Apache Software Foundation
```
2.	What type of attack that crashes services can be performed with insecure deserialization?
```
Denial of service
```

## Task 22
1.	Select the correct term of the following statement:

if a dog was sleeping, would this be:

A) A State
B) A Behaviour 
```
A Behaviour
```

## Task 23
1.	 What is the name of the base-2 formatting that data is sent across a network as?  
```

```

## Task 24
1.	If a cookie had the path of webapp.com/login , what would the URL that the user has to visit be?
```

```
2.	What is the acronym for the web technology that Secure cookies work over?
```

```

## Task 25
1.	1st flag (cookie value)
```

```
2.	2nd flag (admin dashboard)
```

```

## Task 26
1.	flag.txt 
```

```

## Task 29
1.	How many characters are in /etc/passwd (use wc -c /etc/passwd to get the answer)
```

```

## Task 30
1.	What IP address is the attacker using?
```

```
2.	What kind of attack is being carried out?
```

```