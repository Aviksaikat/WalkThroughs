#TryHackMe Bash Scripting 

# Saikat Karmakar | Feb 3:2021

# Task 2
1. What piece of code can we insert at the start of a line to comment out our 	 code?
```
#
```
2. What will the following script output to the screen, echo “BishBashBosh”
```
BishBashBosh
```

# Task 3
1. What would this code return?
```
Jammy is 21 years old
```
2. How would you print out the city to the screen?
```
echo $city
```
3. How would you print out the country to the screen?
```
echo country
```

# Task 4
1. How can we get the number of arguments supplied to a script?
```
$#
```
2. How can we get the filename of our current script(aka our first argument)?
```
$0
```
3. How can we get the 4th argument supplied to the script?
```
$4
```
4. If a script asks us for input how can we direct our input into a variable 	called ‘test’ using “read”
```
read test
```
5. What will the output of “echo $1 $3” if the script was ran with 				“./script.sh hello hola aloha”
```
hello aloha
```

# Task 5 
1. What would be the command to print audi to the screen using indexing.
```
echo "${cars[1]}"
```
2. If we wanted to remove tesla from the array how would we do so?
```
unset cars[3]
```
3. How could we insert a new value called toyota to replace tesla?
```
cars[3]="toyota"
```

# Task 6
1. What is the flag to check if we have read access to a file?
```
-r
```
2. What is the flag to check to see if it's a directory?
```
-d
```