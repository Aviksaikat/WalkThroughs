<?php
session_start();
highlight_file(__FILE__);

//Our secret is in the root directory; You can't reveal it without achieving RCE Jutsu ;)
if(isset($_GET["karma"])){
    $_SESSION["boruto"]=$_GET["karma"];
    var_dump($_SESSION);
    echo $_SESSION["boruto"];
    echo "\n";
    echo "\n";
    include($_GET["karma"]);

}
?>