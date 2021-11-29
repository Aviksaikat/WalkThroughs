#John's Meeting

#Cryptography

#Rank Epic

#Hint: John the ripper

#Question: We found this file after a his meeting. He might have left important notes hidden. 

-------------------------------------------------------------------------------
The hint says `John The Ripper` & the pdf is password protected.
So just use john the ripper which has a module to get the hash of password protected PDFs.
if you're on kali or parrot you can  run it by using 

```
/usr/share/john/pdf2john.pl meetingInfo.pdf > hash
```
'>' to redirect the hash to a file so that we can crack it.

Then just use john or hashcat to crack it using the rockyou.txt
===============================================================================

```
pdf pass : loverena
flag{crack_carck_not_hack}
```