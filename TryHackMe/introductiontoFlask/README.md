# TryHackMe Introduction to Flask

# Saikat Karmakar | Jan 9:2021

# Task 2 
1. Which environment variable do you need to change in order to run Flask?
```
FLASK_APP
```

# Task 3 
1. What's the default deployment port used by Flask?
```
5000
```
2. Is it possible to change that port? (yay/nay)
```
yay
```

# Task 4 
1. Does Flask support POST requests? (yay/nay)
```
yay		
```
2. What markdown language can you use to make templates for Flask? 
```
html
```

# Task 6 
1. What's inside /home/flask/flag.txt ?
```
THM{flask_1njected}
```


***Notes***
```
At this point, it looks like Flask is a great framework for young developers. It definitely is a great tool but a simple misconfiguration may lead to severe security consequences. A major vulnerability was found in Flask's template rendering. The template engine provided within the Flask framework may allow developers to introduce Server-Side Template Injection (SSTI) vulnerabilities.  An attacker can execute code within the context of the server. In some cases, it may lead to a full Remote Code Execution (RCE). 

For the sake of this room let's take a look at a bad code configuration and see how it can be used to exploit a Local File Inclusion (LFI)!

The main reason for this vulnerability is that Jinja2 (template rendering engine) uses curly braces to surround variables used in the template. As you can see on the line with # Problem, our template is put in ''' ''' brackets which allow us to abuse the Jinja template mechanism. A variable after hello is parsing a name from a variable person. But because this is a vulnerable code we can make it output the password. 

This vulnerability can be easily mitigated by using a single quotation mark (' ') in the template variable (instead of ''' '''').  It may look ridiculous, but many python developers make these kinds of mistakes, and unintentionally make their websites vulnerable to SSTI.
```