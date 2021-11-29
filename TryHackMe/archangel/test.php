<!--http://mafialive.thm/test.php?view=php://filter/convert.base64-encode/resource=/var/www/html/development_testing/test.php
****source code****
-->
<!DOCTYPE HTML>
<html>

<head>
    <title>INCLUDE</title>
    <h1>Test Page. Not to be Deployed</h1>
 
    </button></a> <a href="/test.php?view=/var/www/html/development_testing/mrrobot.php"><button id="secret">Here is a button</button></a><br>
    <?php

	    //FLAG: thm{explo1t1ng_lf1}

        function containsStr($str, $substr) 
        {
            return strpos($str, $substr) !== false;
            //only checks the 1st occurrence 
        }
	    
        if(isset($_GET["view"]))
        {
	       if(!containsStr($_GET['view'], '../..') && containsStr($_GET['view'], '/var/www/html/development_testing')) 
            {
            	include $_GET['view'];
                //it'll include the code
            }
            else
            {
                echo 'Sorry, Thats not allowed';
            }
	    }
    ?>
    </div>
</body>

</html>


