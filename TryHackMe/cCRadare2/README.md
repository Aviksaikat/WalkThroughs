# TryHackMe CC: Radare2

>Saikat Karmakar | Feb 14:2021

--------------------------------------------------------------------------

# Task 2 
1.	What flag to you set to analyze the binary upon entering the r2 		console (equivalent to running aaa once your inside the console)     
```
-A
```
2.	How do you enable the debugger?     
```
-D
```
3.	How do you open the file in write mode?
```
-W
```
4.	How do you enter the console without opening a file    
```
-
```

# Task 3
1.	What command "Analyzes Everything" (all functions and their 			arguments: Same as running with radare with -A)
```
aaa
```
2.	What command does basic analysis on functions?
```
af
```
3.	How do you list all functions?
```
afl
```
4.	How many functions are in the example1 binary?
```
12
```
5.	What is the name of the secret function in the example1 binary?
```
secret_func
```

# Task 4
1.	What command shows all the information about the file that you're in?
```
ia
```
2.	How do you get every string that is present in the binary? 
```
izz
```
3.	What if you want the address of the main function?    
```
iM
```
4.	What character do you add to the end of every command to get the 		output in JSON format?
```
j
```
5.	How do you get the entrypoint of the file?
```
ie
```
6.	What is the secret string hidden in the example2 binary?    
```
goodjob
```

# Task 5 
1.	How do you print out the the current memory address your located at 	in the binary?
```
s
```
2.	What command do you use to go to a specific point in memory with the 	 syntax <command> <address>?
```
s
```
3.	What command would you run to go 5 bytes forward?
```
s+ 5
```
4.	What about 12 bytes backward?
```
s- 12 
```
5.	How do you undo the previous seek?
```
s-
```
6.	How would go to the memory address of the main function?
```
s main
```
7.	What if you wanted to go to the address of the rax register?
```
sr rax
```

# Task 6
1.	How would you print the hex output of where you currently are in 		memory?
```

```
2.	How would you print the disassembly of where you're currently at in 	memory?
```

```
3.	What if you wanted the disassembly of the main function?
```

```
4.	What command prints out the emoji hexdump? (this is not useful at 		all I just find it funny)
```

```
5.	What if you decided you were too good for rows and you wanted the 		disassembly in column format?
```

```
6.	What is the value of the first variable in the main function for the 	 example 3 binary?
```

```
7.	What about the second variable?
```

```

# Task 7
1.	How many functions are in the binary?
```

```
2.	What is the value of the hidden string?
```

```
3.	What is the return value of secret_func()?
```

```
4.	What is the value of the first variable set in the main function(in 	decimal format)?
```

```
5.	What about the second one(also in decimal format)?
```

```
6.	What is the next function in memory after the main function?
```

```
7.	How do you get a hexdump of four bytes of the memory address your 		currently at?
```

```

# Task 8
1.	How do you set a breakpoint?
```

```
2.	What command is used to print out the values of all the registers?
```

```
3.	How do you run through the program until the program either ends or 	you hit the next breakpoint?
```

```
4.	What if you want to step through the binary one line at a time?
```

```
5.	How do you go forth 2 lines in the binary?
```

```
6.	How do you list out the indexes and memory addresses of all 			breakpoints?
```

```

# Task 9
1.	How do you enter "graph mode" which allows everything to be 			organized in nice readable boxes?(A personal favorite of mine. Also 	note that the second character is uppercase)
```

```
2.	What character do you press to run normal radare commands inside 		visual mode?
```

```
3.	How do you go back to the regular radare shell(leaving visual mode)?
```

```
4.	What if you want to step through the binary inside Visual mode?
```

```
5.	How do you add a comment?
```

```

# Task 10
1.	How do you write a string to the current memory address.
```

```
2.	What command lists all write changes?
```

```
3.	What command modifies an instruction at the current memory address?
```

```

# Task 11
1.	What is the password that outputs the you win! message?
```

```

-------------------------------------------------------------------------