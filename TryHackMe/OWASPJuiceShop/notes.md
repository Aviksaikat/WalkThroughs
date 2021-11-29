# TryHackMe OWASP Juice Shop

-----------------------------
Saikat Karmakar | Jan 22:2021
-----------------------------

---------
Injection
--
==========================================================================
SQL Injection
	SQL Injection is when an attacker enters a malicious or malformed query to either retrieve or tamper data from a database. And in some cases, log into accounts.
Command Injection
	Command Injection is when web applications take input or user-controlled data and run them as system commands. An attacker may tamper with this data to execute their own system commands. This can be seen in applications that perform misconfigured ping tests. 
Email Injection
	Email injection is a security vulnerability that allows malicious users to send email messages without prior authorization by the email server. These occur when the attacker adds extra data to fields, which are not interpreted by the server
	 correctly. 
==========================================================================

-------------------------------------------
XSS: <iframe src="javascript:alert(`xss`)">
-------------------------------------------

 