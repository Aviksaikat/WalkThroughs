# TryHackMe RustScan

# Saikat Karmakar | Jan 11:2021

# Task 5 
1. What is the scripting file config called?
```
rustscan_scripts.toml
```
2. Can you run other binaries with RustScan? (T)rue / (F)alse.
```
T
```
3. Does RutScan support scripts in Javascript? (T)rue / (F)alse.
```
F
```

# Task 7 
1. After scanning this, how many ports do we find open under 1000?
```
2
```
2. Perform a service version detection scan, what is the version of the 	software running on port 22?
```
6.6.1p1
```
3. Perform an aggressive scan, what flag isn't set under the results for 	port 80?
```
httponly
```

# Task 8
1. First, how do you access the help menu?
```
-h
```
2. Often referred to as "quiet" mode, What switch can do this?
```
-q
```
3. Which switch can help us to scan for a particular Range?
```
-r
```
4. What switch would you use to find out RustScan's version?
```
-v
```
5. Which switch will help us to select batch size?
```
-b
```
6. Which switch can set timeout?
```
-t
```


***Notes***
```
Now for the largest feature of RustScan. Thanks to Bergabman for working on this one.

RustScan is extensible by the RustScan Scripting Engine. This allows you to write a script which runs after the scan has completed, taking inputs of open ports and their respective IPs. 

RSE supports these languages:

    Python
    Shell
    Perl
    Any program which is a binary and in $PATH

Scripting Engine Arguments

RustScan's scripting engine can be altered using the "--scripts" argument.

There are 3 possible arguments:

    None (don't run any scripts)
    Custom (run all scripts in the scripts folder)
    Default (runs Nmap script, or whatever script is in the config file. Default does not need to be enabled, it is on by default.)

Python Custom Scripts

To execute a custom script, we need a rustscan_scripts.toml file located at $HOME/.rustscan_scripts.toml.

The script file should look like:

# Test/Example ScriptConfig file

# Tags to filter on scripts. Only scripts containing all these tags will run.
tags = ["core_approved", "example"]

# If it's present then only those scripts will run which has a tag ports = "80". Not yet implemented.
#
# ex.:
# ports = ["80"]
# ports = ["80","81","8080"]
ports = ["80"]

# Only this developer(s) scripts to run. Not yet implemented.
developer = ["example"]


Let's walk through this.

Firstly, for reference, this is a basic Python script.

#!/usr/bin/python3
#tags = ["core_approved", "example",]
#developer = [ "example", "https://example.org" ]
#trigger_port = "80"
#call_format = "python3 {{script}} {{ip}} {{port}}"

# Scriptfile parser stops at the first blank line with parsing.
# This script will run itself as an argument with the system installed python interpreter, only scanning port 80.
# Unused filed: ports_separator = ","

import sys

print('Python script ran with arguments', str(sys.argv))

Note: the metadata of scripts is stored as comments. The first line is always a shebang.
Tags

Tags are categories of scripts. For example, we may have these categories:

    HTTP
    SSH
    Tomcat

And only wish to run scripts that match these categories. Our config file will only execute the scripts with matching categories.
Developer

This tag issues who the developer of the script is.
Trigger Point

This tag states at what port should the script trigger? For HTTP it would be "80". For HTTP and HTTPS it would be "80, 443"
Call Format

RustScan uses a templating library called text_placeholder.

This allows us to enclose variables in {{variable}} doubly curly braces. RustScan supports 3 variables:

    The script name
    The IP address
    The port(s)

#call_format = "python3 {{script}} {{ip}} {{port}}"

The Code itself

Now everything after this metadata is the code itself.

The script will receive arguments via sys.argv in the format specified in the call_format variable.

Now with this data, we run the script, doing whatever we please!
Contributing / Making Scripts

We have a folder of example scripts here.

If you make a script, please consider contributing to RustScan. Right now you can submit a pull request to this folder and we'll include your script.
Running Other Tools with RustScan

Any tool installed in the system (like Nmap, GoBuster, etc) can be run with RustScan.

We do this by default with Nmap.

To execute another program, create a shell script which calls that program. So to call Nmap, create a shell script with our RustScan Scripting Engine and then for the function:

nmap -vvv -p {{port}} {{ip}} 
```
