<?php                             
session_start();                  
if (!isset($_SESSION['user'])) {  
    header('Location: login.php');
    exit;
}                                 
?> 
                               
<?php include( 'config.php' ); ?>

<?php
if (isset($_GET['file'])) {
    // Log all file attempts, because security is important!!
    $logFilename = "/var/www/file_access.log";
    $epochTime = getdate()[0];
    $logMsg = "{$epochTime},{$_SESSION['user']},{$_GET['file']}";
    file_put_contents($logFilename, $logMsg . "\n", FILE_APPEND);
    if (!filter_var($_GET['file'], FILTER_VALIDATE_INT)) {
        http_response_code(404);
        exit;
    } else {
        $fileId = filter_var($_GET['file'], FILTER_SANITIZE_NUMBER_INT);
        $db = connectDB();
        if ($db === false) {
            die("ERROR: Could not connect. " . $db->connect_error);
        } else {
        $sql = "SELECT name, size, data FROM files WHERE id = {$fileId} limit 1;";
        $result = $db->query($sql);
        $row = mysqli_fetch_assoc($result);
        header("Content-Description: File Transfer");
        header("Content-Type: application/octet-stream");
        header("Content-Length: " . $row['size']);
        header("Content-Disposition: attachment; filename=" . $row['name']);
        ob_clean(); // Discard any data in the output buffer
        flush(); // Flush system headers
        echo $row['data'];
        $result->free();
        }
    }
    $db->close();
} else {
echo '<div class="uk-alert-danger">Nothing requested!</div>';
}
?>
