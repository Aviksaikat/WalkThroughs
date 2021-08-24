# TryHackMe HeartBleed

> Saikat Karmakar | AUG 22 : 2021

---

## Task 2

1. What is the flag?
```
THM{sSl-Is-BaD}
```

---
***Notes***
---


Introduction to Heartbleed and SSL/TLS


On the internet today, most web servers are configured to use SSL/TLS. SSL(secure socket layer) is just a predecessor to TLS(transport layer security). The most common versions are TLS 1.2 and TLS 1.3(which has recently been released). Configuring a web server to use TLS means that all communication from that particular server to a client will be encrypted; any malicious third party that has access to this traffic will not be able to understand/decrypt the traffic, and they also will not be able to modify the traffic. To learn more about how the TLS connections are established, check 1.2 and 1.3 out.

Heartbleed is a bug due to the implementation in the OpenSSL library from versions 1.0.1 to 1.0.1f(which is very widely used). It allows a user to access memory on the server(which they usually wouldn't have access to). This in turn allows a malicious user to access different kinds of information(that they wouldn't usually have access to due to the encryption and integrity provided by TLS) including:

    server private key

    confidential data like usernames, passwords and other personal information

Analysing the Bug


The implementation error occurs in the heartbeat message that is used by OpenSSL to keep a connection alive even when no data is sent. A mechanism like this is important because if a connection dies/resets quite often, it would be expensive to set up the TLS aspect of the connection again; this affects the latency across the internet and it would make using services slow for users. A heartbeat message sent by one end of the connection contains random data and the length of the data, and this exact data is sent back when received by the other end of the connection. When the server retrieves this message from the client here's what it does:

    The server constructs a pointer(memory location) to the heartbeat record 

    It then copies the length of the data sent by a user into a variable(called payload)

        The length of this data is unchecked

    The server then allocates memory in the form of:

        1 + 2 + payload + padding(this can be maximum of 1 + 2 + 65535 + 16)

    The server then creates another pointer(bp) to access this memory

    The server then copies payload number of bytes from data sent by the user to the bp pointer

    The server sends the data contained in the bp pointers to the user

With this, you can see that the user controls the amount and length of data they send over. If the user does not send over any data(where the length is 0), it means that the server will copy arbitrary memory into the new pointer(which is how it can access secret information on the server). When retrieving data this way, the data can be different with different responses as the memory on the server will change. 

Remediation

To ensure that arbitrary data from the server isn’t copied and sent to a user, the server needs to check the length of the heartbeat message:

    The server needs to check that the length of the heartbeat message sent by the user isn’t 0

    The server needs to check the the length doesn’t exceed the specified length of the variable that holds the data

References:


http://heartbleed.com/

https://www.seancassidy.me/diagnosis-of-the-openssl-heartbleed-bug.html

https://stackabuse.com/heartbleed-bug-explained/
