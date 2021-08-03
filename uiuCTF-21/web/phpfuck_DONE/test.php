<?php 

// 	$x = $_REQUEST['x'];
// 	echo "-------------------";
// 	echo "\n Data is \n";
// 	echo "$x\n";
($x=str_replace("`","",strval($_REQUEST["x"])))&&strlen(count_chars($x,3))<=5?print(eval("return $x;")):show_source(__FILE__)&&phpinfo(); 

?>