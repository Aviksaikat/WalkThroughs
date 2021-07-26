# TryHackMe Authenticate

> Saikat Karmakar | Jul 25 : 2021


---

## Task 2

1. What is the flag you found after logging as Jack?
```
fad9ddc1feebd9e9bca05f02dd89e271
```
2. What is the flag you found after logging as Mike?
```
e1faaa144df2f24aa0a9284f4a5bb578
```

## Task 3 

1. What is the flag that you found in darren's account?
```
fe86079416a21a3c99937fea8874b667
```
2. What is the flag that you found in arthur's account?
```
d9ac0f7db4fda460ac3edeb75d75e16e
```

## Task 4

1. Use the same method to find identity of admin user and retrieve the flag? 
```
92498880383088033228
```

## Task 5

1. What is the password for superadmin account?
```
abcd1234
```
2. What is the flag you found in superadmin account?
```
72102933396288983011
```



-----------
***Notes***
-----------
# ***JSON Web Token(JWT)*** 
is one of the commonly used methods for authorization. This is a kind of cookie that is generated using HMAC hashing or public/private keys. So unlike any other kind of cookie, it lets the website know what kind of access the currently logged in user has. The only special thing about JWT is that they are in JSON format(after decoding).

JWT can be divided into 3 parts separated by a dot(.)

1) Header:  This consists of the algorithm used and the type of the token.

{  "alg": "HS256", "typ": "JWT"}

alg could be HMAC, RSA, SHA256 or can even contain None value.

2) Payload: This is part that contains the access given to the certain user etc. This can vary from website to website, some can just have a simple username and some ID and others could have a lot of other details.

3) Signature: This is the part that is used to make sure that the integrity of the data was maintained while transferring it from a user's computer to the server and back. This is encrypted with whatever algorithm or alg that was passed in the header's value. And this can only be decrypted with a predefined secret(which should be difficult to)

Now to put all the 3 part together we base64 encode all of them separated by a dot(.) so it would look something like:

eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c

Note: This example was taken from jwt.io and you should check that website out if you want to learn more about JWT.﻿

Exploitation﻿

If used properly this is a very secure way of authorization but the problem is with using is "properly". A lot of developers misconfigure their system leaving it open to exploitation.

Now one of the methods to exploit this is to perform a brute force/dictionary attack and find the secret used for encrypting the JWT token and then used that to generate new tokens. But here we are not going to do that, we are going to see a very amazing way of exploiting this.

If you remember, in the Header section I said that the alg can be whatever the algorithm is used and also it can be None if no encryption is to be used. Now, this should not be used when the application is in production but again the problem of misconfiguration comes in and make the application vulnerable to this kind of attack. The attack is that an attacker can log in as low privilege user says guest and then get the JWT token for that user and then decode the token and edit the headers to use set alg value to None. This would mean that no encryption has to be used therefore the attacker wouldn't need to the secret used for encryption.