# TryHackMe Crack The Hash Level 2

# Saikat Karmakar | Jan 14:2021

# Task 2 
1. What kind of hash it is?
```
RIPEMD-320
```
2. What is Keccak-256 Hashcat code?
```
17800
```
3. What is Keccak-256 John the Ripper code?
```
raw-keccak-256
```

# Task 3 
1. Which option do you need to add to the previous command to search into 	 local archives instead of remote ones?
```
-l
```
2. But the wordlist is compressed in a tar.gz archive, to decompress 		it run wordlistctl fetch -l rockyou -d.If you run wordlistctl search 	 -l rockyou one more time, what is the path where is stored the 		wordlist?
```
/usr/share/wordlists/passwords/rockyou.txt
```
3. What is the name of the first wordlist in the usernames category?
```
CommonAdminBase64
```

# Task 4
1. What was the password?
```
moonligh56
```

# Task 5
1. Crack the following md5 hash with the wordlist generated in the 			previous steps.
```
mOlo$$u$
```
2. What is the last word of the list? 
```
information
```
3. Crack this md5 hash with combination.txt.
```
1551-li
```

# Task 6
1. Advice n°1 b16f211a8ad7f97778e5006c7cecdf31
```

```
2. Advice n°2 7463fcb720de92803d179e7f83070f97
```

```
3. Advice n°3 f4476669333651be5b37ec6d81ef526f
```

```
4. Advice n°4 a3a321e1c246c773177363200a6c0466a5030afc
```

```
5. Advice n°5 d5e085772469d544a447bc8250890949
```

```
6. Advice n°6 377081d69d23759c5946a95d1b757adc
```

```
7. Advice n°7 ba6e8f9cd4140ac8b8d2bf96c9acd2fb58c0827d556b78e331d1113fcbfe	 425ca9299fe917f6015978f7e1644382d1ea45fd581aed6298acde2fa01e7d83cdbd
```

```
8. Advice n°8 9f7376709d3fe09b389a27876834a13c6f275ed9a806d4c8df78f0ce1aad	 8fb343316133e810096e0999eaf1d2bca37c336e1b7726b213e001333d636e896617
```

```
9. Advice n°9 $6$kI6VJ0a31.SNRsLR$Wk30X8w8iEC2FpasTo0Z5U7wke0TpfbDtSwayrNe	 bqKjYWC4gjKoNEJxO/DkP.YFTLVFirQ5PEh4glQIHuKfA/
```

```


***Notes***
```
john  --wordlist=/home/avik/Desktop/SecLists/Passwords/Common-Credentials/10k-most-common.txt  hash1.txt --format=raw-sha1  --rules=THM01 --config=/etc/john/john-local.conf
```

```


With TTPassGen we can craft wordlists from scratch. Create a first wordlist containing all 4 digits PIN code value.

ttpassgen --rule '[?d]{4:4:*}' pin.txt



Generate a list of all lowercase chars combinations of length 1 to 3.

ttpassgen --rule '[?l]{1:3:*}' abc.tx

Then we can create a new wordlist that is a combination of several wordlists. Eg. combine the PIN wordlist and the letter wordlist separated by a dash.

ttpassgen --dictlist 'pin.txt,abc.txt' --rule '$0[-]{1}$1' combination.txt
```