# TryHackMe Introductory Networking

> Saikat Karmakar | Aug 9 : 2021

---

## Task 2

1. Which layer would choose to send data over TCP or UDP?
```
4
```
2. Which layer checks received packets to make sure that they haven't been corrupted?
```
2
```
3. In which layer would data be formatted in preparation for transmission?
```
2
```
4. Which layer transmits and receives data?
```
1
```
5. Which layer encrypts, compresses, or otherwise transforms the initial data to give it a standardised format?
```
6
```
6. Which layer tracks communications between the host and receiving computers?
```
5
```
7. Which layer accepts communication requests from applications?
```
7
```
8. Which layer handles logical addressing?
```
3
```
9. When sending data over TCP, what would you call the "bite-sized" pieces of data?
```
Segments
```
10. [Research] Which layer would the FTP protocol communicate with?
```
7
```
11. Which transport layer protocol would be best suited to transmit a live video?
```
UDP
```

## Task 3

1. How would you refer to data at layer 2 of the encapsulation process (with the OSI model)?
```
Frames
```
2. How would you refer to data at layer 4 of the encapsulation process (with the OSI model), if the UDP protocol has been selected?
```
Datagrams
```
3. What process would a computer perform on a received message?
```
De-encapsulation
```
4. Which is the only layer of the OSI model to add a trailer during encapsulation?
```
Data Link
```
5. Does encapsulation provide an extra layer of security (Aye/Nay)?
```
Aye
```

## Task 4

1. Which model was introduced first, OSI or TCP/IP?
```
TCP/IP
```
2. Which layer of the TCP/IP model covers the functionality of the Transport layer of the OSI model (Full Name)?
```
Transport
```
3. Which layer of the TCP/IP model covers the functionality of the Session layer of the OSI model (Full Name)?
```
Application
```
4. The Network Interface layer of the TCP/IP model covers the functionality of two layers in the OSI model. These layers are Data Link, and?.. (Full Name)?
```
Physical
```
5. Which layer of the TCP/IP model handles the functionality of the OSI network layer?
```
Internet
```
6. What kind of protocol is TCP?
```
Connection-based
```
7. What is SYN short for?
```
Synchronise
```
8. What is the second step of the three way handshake?
```
SYN/ACK
```
9. What is the short name for the "Acknowledgement" segment in the three-way handshake?
```
ACK
```

## Task 5

1. Ping muirlandoracle.co.uk.What is the IPv4 address?
```
ping  bbc.co.uk
```
2. What switch lets you change the interval of sent ping requests?
```
217.160.0.152
```
3. What switch would allow you to restrict requests to IPv4?
```
-i
```
4. What switch would give you a more verbose output?
```
-4
```

## Task 6

1. What switch would you use to specify an interface when using Traceroute?
```
-i
```
2. What switch would you use if you wanted to use TCP SYN requests when tracing the route?
```
-t
```
3. [Lateral Thinking] Which layer of the TCP/IP model will traceroute run on by default (Windows)?
```
Internet
```

## Task 7

1. What is the registrant postal code for facebook.com?
```
94025
```
2. When was the facebook.com domain first registered?
```
29/03/1997
```
3. Which city is the registrant based in?
```
Redmond
```
4. [OSINT] What is the name of the golf course that is near the registrant address for microsoft.com?
```
 Bellevue Golf Course
```
5. What is the registered Tech Email for microsoft.com?
```
msnhst@microsoft.com
```


## Task 8

1. What is DNS short for?
```
Domain Name System
```
2. What is the first type of DNS server your computer would query when you search for a domain?
```
Recursive
```
3. What type of DNS server contains records specific to domain extensions (i.e. .com, .co.uk*, etc)*? Use the long version of the name.
```
 Top-level Domain
```
4. Where is the very first place your computer would look to find the IP address of a domain?
```
Local Cache
```
5. [Research] Google runs two public DNS servers. One of them can be queried with the IP 8.8.8.8, what is the IP address of the other one?
```
8.8.4.4
```
6. If a DNS query has a TTL of 24 hours, what number would the dig query show?
```
86400
```