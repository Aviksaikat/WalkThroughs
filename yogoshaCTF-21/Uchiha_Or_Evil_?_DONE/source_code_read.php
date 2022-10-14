<?php
if ($_SERVER['HTTP_USER_AGENT']!=="Uchiha"){
	echo "Access Denied. Only Uchiha clan can access this";
}
else{
?>

<?php
include "secret.php";
if(isset($_POST['string'])){
	$arr=explode("|",$_POST['string']) ;
	$filenames=$arr[1];
	$hash=$arr[0];
	if($hash===hash("sha256", $SECRET.$filenames ) && preg_match("/\//",$filenames)===0 ){
		foreach(explode(":",$filenames) as $filename){
			if(in_array($filename,["read.php","index.php","guinjutsu.php"])) {
				$jutsu=file_get_contents($filename);
				echo "Sharingan: ".$jutsu;
		}
		}
	}
	else{
		echo "Verification Failed! You didn't awaken your sharingan!";
	}

}

}
?>