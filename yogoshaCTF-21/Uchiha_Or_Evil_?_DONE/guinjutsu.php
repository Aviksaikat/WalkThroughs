<?php
// This endpoint is deprecated due to some problems, I heard that other clans have stolen some jutsus
function check($url){
    $par=parse_url($url);
    if (((strpos($par['scheme'],'http')!==false)and($par['host']=='uchiha.fuinjutsukeeper.tech'))and($par['port']==5000)){
        return True;

    }
    else{
        return False;
    }

}
if (isset($_POST['submit'])){
    if ((isset($_POST['api']))and(isset($_POST['endpoint']))){
        $url=$_POST['api'].$_POST['endpoint'];
        if (check($url)){
            $opts = array(
  'http'=>array(
    'method'=>"GET",
    'follow_location'=>false,
    'header'=>"Accept-language: en\r\n" 
  )
);
$context = stream_context_create($opts);
$file = file_get_contents($url, false, $context);
echo $file;

        }
    }
}


?>
