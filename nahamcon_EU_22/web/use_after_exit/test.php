<?php
error_reporting(0);
if (isset($_POST['submit'])) {
    $file_name = urldecode($_FILES['file']['name']);
    echo $file_name;
    $tmp_path = $_FILES['file']['tmp_name'];
    if(strpos($file_name, ".jpg") == false){
        echo "Invalid file name";
        echo $file_name;
        //exit(1);
    }
    $content = file_get_contents($tmp_path);
    $all_content = '<?php exit(0);'. $content . '?>';
    $handle = fopen($file_name, "w");
    fwrite($handle, $all_content);
    fclose($handle);
    echo "Done.";
}
else{
    show_source(__FILE__);
}
?>