#TryHackMe Baron Samedit

>Saikat Karmakar | Feb 11:2021

--------------------------------------------------------------------------

# Task 2 
1.	After compiling the exploit, what is the name of the executable 		created (blurred in the screenshots above)?
```
sudo-hax-me-a-sandwich
```
2.	You should now have a root shell -- what is the flag in /root/			flag.txt? 
```
THM{NmU4OWYwMWJmMjkxMDdiYTU4MWIxNWVk}
```

--
-----------
***Notes***
-----------
In January 2021, Qualys released a blog post detailing a terrifying new vulnerability in the Unix sudo program.

Specifically, this was a heap buffer overflow allowing any user to escalate privileges to root -- no misconfigurations required. This exploit works with the default settings, for any user regardless of sudo permissions, which makes it all the scarier. The vulnerability has been patched, but affects any unpatched version of the sudo program from 1.8.2-1.8.31p2 and 1.9.0-1.9.5p1, meaning that it's been around for the last ten years.

The program was very quickly patched (with patched versions making their way into repositories soon after), so this exploit will no longer work on up-to-date targets; however, it is still incredibly powerful.

As with CVE-2019-18634 (which we saw in the second sudovulns room), this vulnerability is a buffer overflow in the sudo program; however, this time the vulnerability is a heap buffer overflow, as opposed to the stack buffer overflow we saw before. The stack is a very regimented section of memory which stores various important aspects of a program. The heap, on the other hand, is reserved for dynamic allocation of memory, allowing for more flexibility in how values and constructs are created and accessed by a program. As with the previous room, we will not go into a huge amount of detail about how this works in the interests of keeping the content beginner friendly. All we really need to understand is that this vulnerability is incredibly powerful, and extremely wide-reaching.

So, first up, what can we do to check whether a system is vulnerable?

Fortunately there is a very easy method we can use to check; simply enter this command into a terminal:
>sudoedit -s '\' $(python3 -c 'print("A"*1000)')
-
If the system is vulnerable then this will overwrite the heap buffer and crash the program:

This PoC was obtained from a researcher named lockedbyte, here.

When the advisory first came out, Qualys did not supply full code for the exploit. It did not take long for other researchers to replicate the vulnerability; however. The first working copy of the exploit to be made publicly available was created by a researcher known as bl4sty. Their full exploit code can be found on Github, here. This is what we will be using to exploit the machine you deployed in the first task.

This machine has been setup to allow for easy exploitation of the vulnerability. As such, the Github repository linked above has already been added to the target.
--------------------------------------------------------------------------