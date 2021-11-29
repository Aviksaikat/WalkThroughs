# tr 
> Syntax: tr [flags] [source]/[find]/[select] [destination]/[replace]/[change]


# awk
> Syntax: awk [flags] [select pattern/find(sort)/commands] [input file]

	NR: (Number Record) is the variable that keeps count of the rows after each line's execution... You can use NR command to number the lines (awk '{print NR,$0}' file.txt). Note that awk considers rows as records.

	FS: (Field Separator) is the variable to set in case you want to define the field for input stream. The field separation (defaut to space) that we talked above and can be altered to whatever you want while specifying the pattern. FS can be defined to another character(s)(yea, can be plural) at the BEGIN{command}.

	https://www.tutorialspoint.com/awk/awk_workflow.htm
	http://osr5doc.xinuos.com/en/OSUserG/_The_printf_statement.html
	https://www.geeksforgeeks.org/awk-command-unixlinux-examples/

	Built In Variables In Awk

	Awk’s built-in variables include the field variables—$1, $2, $3, and so on ($0 is the entire line) — that break a line of text into individual words or pieces called fields. 

	NR: NR command keeps a current count of the number of input records. Remember that records are usually lines. Awk command performs the pattern/action statements once for each record in a file. 

	NF: NF command keeps a count of the number of fields within the current input record. 

	FS: FS command contains the field separator character which is used to divide fields on the input line. The default is “white space”, meaning space and tab characters. FS can be reassigned to another character (typically in BEGIN) to change the field separator. 

	RS: RS command stores the current record separator character. Since, by default, an input line is the input record, the default record separator character is a newline. 

	OFS: OFS command stores the output field separator, which separates the fields when Awk prints them. The default is a blank space. Whenever print has several parameters separated with commas, it will print the value of OFS in between each parameter. 

	ORS: ORS command stores the output record separator, which separates the output lines when Awk prints them. The default is a newline character. print automatically outputs the contents of ORS at the end of whatever it is given to print. 




# sed

> sed [flags] [pattern/script] [input file]

	'[condition(s)(optional)] [mode(optional)]/[source/to-be-searched pattern(mandatory)]/[to-be-replaced pattern(depends on mode you use; if no mode then by default it is optional)]/[args/flags to operate on the pattern searched(optional)]'


	https://www.geeksforgeeks.org/sed-command-in-linux-unix-with-examples/
	https://www.tecmint.com/linux-sed-command-tips-tricks/
	https://www.gnu.org/software/sed/manual/sed.html

	

# x-args
	﻿xargs, a very simple command to use when it comes to make passed string a command's argument, technically, positional argument. The official documentation says, xargs is a command line tool used to build and execute command from the standard input.

# curl
	https://www.geeksforgeeks.org/curl-command-in-linux-with-examples/
	https://curl.se/docs/manpage.html
	https://www.tecmint.com/linux-curl-command-examples/

	
# gpg command
	https://www.tutorialspoint.com/unix_commands/gpg.htm
	http://irtfweb.ifa.hawaii.edu/~lockhart/gpg/

# tar command
	https://neverendingsecurity.wordpress.com/2015/04/13/linux-tar-commands-cheatsheet/
	https://www.geeksforgeeks.org/tar-command-linux-examples/

# netstat command
	https://www.rekha.com/netstat-cheat-sheet-for-newbies.html
	https://linux.die.net/man/8/netstat
	https://neverendingsecurity.wordpress.com/2015/04/13/ss-socket-statistics-commands-cheatsheet/

# less, more, most
	https://ostechnix.com/the-difference-between-more-less-and-most-commands/
	https://www.tecmint.com/linux-more-command-and-less-command-examples/#:~:text=Learn%20Linux%20%27less%27%20Command,using%20page%20up%2Fdown%20keys.

# systemctl/service command

    *service command is a normal command to initialize services present in /etc/init.d, without making an admin worrying too much about the permanent system changes, systemctl on the other hand is a heavy command(doing pretty much the same job, just on systemd's level; systemd is a service manager in linux systems) which can hinder with the default settings. For eg. services initialized by systemctl stays in systemd's directory (directory which holds what program to run when a linux system boots up). Thus the programs initialized by systemctl boots up with system.
    
    *With service you can only use commands related to that particular service (reload, start, stop, status etc), and with a powerful tool like systemctl, you get to control the state of "systemd" system and service manager. 

