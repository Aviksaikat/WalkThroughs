# TryHackMe CC: Steganography


# Saikat Karmakar | Jan 20:2021


# Task 2 
1. What argument allows you to embed data(such as files) into other files?
```
embed
```
2. What flag let's you set the file to embed?
```
-ef
```
3. What flag allows you to set the "cover file"?(i.e  the jpg)
```
-cf
```
4. How do you set the password to use for the cover file?
```
-p
```
5. What argument allows you to extract data from files?
```
extract
```
6. How do you select the file that you want to extract data from?
```
-sf
```
7. Given the passphrase "password123", what is the hidden message in the  	 included "jpeg1" file.
```
pinguftw
```

# Task 3
1. How do you specify that the least significant bit comes first
```
--lsb
```
2. What about the most significant bit?
```
--msb
```
3. How do you specify verbose mode?
```
-v
```
4. How do you extract the data from a specific payload?
```
-E
```
5. In the included file "png1" what is the hidden message?
```
nootnoot$
```
6. What about the payload used to encrypt it.
```
b1,bgr,lsb,xy
```

# Task 4
1. In the included jpeg3 file, what is the document name
```
Hello :)
```

# Task 5 
1. How do you check the file for metadata?
```
-meta
```
2. How do you check for steghide hidden information
```
-steghide
```
3. What flag allows you to extract LSB data from the image?
```
-extractLSB 
```
4. In the included image jpeg2 what is the hidden message?
```
kekekekek
```

# Task 6 
1. What is the hidden text in the included wav2 file?
```
google
```

# Task 7 
1. What is key 1?
```
superkeykey
```
2. What is key 2?
```
fatality
```
3. What is key 3?
```
killshot
```