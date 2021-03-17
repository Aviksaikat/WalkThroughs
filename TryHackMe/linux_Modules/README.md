# TryHackMe Linux Modules

> Saikat Karmakar | Mar 3:2021

-------------------------------------------------------------------------------

# Task 3 
1.	Is there a difference between egrep and fgrep? (Yea/Nay)
```
Yea
```
2.	Which flag do you use to list out all the lines NOT containing the 			'PATTERN'?
```
-v
```
3.	What user did you find in that file?
```
bobthebuilder
```
4.	What is the password of that user?
```
LinuxIsGawd
```
5.	Can you find the comment that user just left?
```
fs0ciety
```

# Task 5
1.	Run tr --help command and tell how will you select any digit character in 	  the string?
```
:digit:
```
2.	What sequence is equivalent to [a-zA-Z] set?
```
:alpha:
```
3.	What sequence is equivalent to selecting hexadecimal characters?
```
:xdigit:
```

# Task 6 
1.	Download the above given file, and use awk command  to print the following 	   output:
		ippsec:34024
		john:50024
		thecybermentor:25923
		liveoverflow:45345
		nahamsec:12365
		stok:1234
```
awk 'BEGIN{FS=" ";OFS=":"} {print $1,$4}' awk.txt
```
2.	How will you make the output as following (there can be multiple; answer 	 it using the above specified variables in BEGIN pattern):
	ippsec, john, thecybermentor, liveoverflow, nahamsec, stok,

```
awk 'BEGIN{ORS=","} {print $1}' awk.txt
```

# Task 7
1.	How would you substitute every 3rd occurrence of the word 'hack' to 'back' 	   on every line inside the file file.txt?
```
sed 's/hack/back/3g' file.txt
```
2.	How will you do the same operation only on 3rd and 4th line in file.txt?
```
sed '3,4 s/hack/back/3g' file.txt
```
3.	Download the given file, and try formatting the trailing spaces in 			sed1.txt with a colon(:).
```
sed 's/ */:/g' sed1.txt
```
4.	View the  sed2 file in the directory. Try putting all alphabetical values 	  together, to get the answer for this question.
```
CONGRATULATIONS YOU MADE IT THROUGH THIS SMALL LITTLE CHALLENGE
```
5.	What pattern did you use to reach that answer string?
```
's/[[:digit:]]//g'
```
6.	What did she sed?(In double quotes)
```
"That's What"
```

# Task 8
1.	You can find the files for this task in two folder.
```
cat file | xargs -I files -t sh -c "touch files; chmod 400 files"
```
2.	Which flag to use to specify max number of arguments in one line.
```
ls | xargs -I word -n 1 -t sh -c 'echo word >> shortrockyou; rm word'
```
3.	How will you escape command line flags to positional arguments?
```
-n
```
4.	How will you escape command line flags to positional arguments?
```
--
```

# Task 9
1.	Download the file given for this task, find the uniq items after sorting 	 the file. What is the 2271st word in the output.
```
lollol
```
2.	What was the index of term 'michele'
```
2550
```

# Task 10
1.	Which flag allows you to limit the download/upload rate of a file?
```
--limit-rate
```
2.	How will you curl the webpage of https://tryhackme.com/ specifying 			user-agent as 'juzztesting'
```
curl -A 'juzztesting' https://tryhackme.com/
```
3.	Can curl perform upload operations?(Yea/Nah)
```
Yea
```

# Task 11
1.	How will you enable time logging at every new activity that this tool 		initiates?
```
-N
```
2.	What command will you use to download https://xyz.com/mypackage.zip using 	  wget, appending logs to an existing file named "package-logs.txt"
```
wget -o package-logs.txt https://xyz.com/mypackage.zip 
```
3.	Write the command to read URLs from "file.txt" and limit the download 		speed to 1mbps.
```
wget -o file.txt --limit-rate=1mB
```

# Task 12
1.	How will you seek at 10th byte(in hex) in file.txt and display only 50 		bytes?
```
xxd -s 0xa -l 50 -b file.txt 
```
2.	How to display a n bytes of hexdump in 3 columns with a group of 3 octets 	  per row from file.txt? (Use flags alphabetically)
```
xxd -c 9 -g 3 file.txt
```
3.	Which has more precedence over the other -c flag or -g flag?
```
-c
```
4.	Download the file and find the value of flag.
```
flag{wh3sdw0lw1gl9oqasad2fs48as}
```

# Task 13
1.	It's safe to run systemctl command and experiment on your main linux 		system neither following a proper guide or having any prior knowledge? (	Right/Wrong)
```
Wrong
```
2.	How will you import a given PGP private key. (Suppose the name of the 		file is key.gpg)
```
pgp --import key.pgp
```
3.	How will you list all port activity if netstat is not available on a 		machine? (Full Name)
```
Socket Statistics
```
4.	What command can be used to fix a broken/irregular/weird acting terminal 	 shell?
```
reset 
```

# Task 14 
1.	Press F to pay respect
```
F
```