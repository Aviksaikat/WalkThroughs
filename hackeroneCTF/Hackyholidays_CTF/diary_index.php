<?php
include_once('../../Flags.php');
if( isset($_GET["template"])  ){
    $page = $_GET["template"];
    //remove non allowed characters
    $page = preg_replace('/([^a-zA-Z0-9.])/','',$page);
    //protect admin.php from being read
    $page = str_replace("admin.php","",$page);
    //I've changed the admin file to secretadmin.php for more security!
    $page = str_replace("secretadmin.php","",$page);
    //check file exists
    if( file_exists($page) ){
        $contents = file_get_contents($page);
        $contents = str_replace('!'.'FLAG!',Flags::get(5),$contents);
        echo $contents;
    }else{
        //redirect to home
        header("Location: ../my-diary/?template=entries.html");
        exit();
    }
}else{
    //redirect to home
    header("Location: ../my-diary/?template=entries.html");
    exit();
}

//secretadsecretaadmin.phpdmin.phpmin.php
//secretadsecretadmin.phpmin.php