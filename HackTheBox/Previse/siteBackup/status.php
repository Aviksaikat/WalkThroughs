<?php
session_start();
if (!isset($_SESSION['user'])) {
    header('Location: login.php');
}
?>

<?php include( 'header.php' ); ?>

<title>Previse Status</title>
</head>
<body>

<?php include( 'nav.php' ); ?>

<section class="uk-section uk-section-default">
    <div class="uk-container">
        <h2 class="uk-heading-divider">Status</h2>
        <div class="uk-container" uk-grid>
            <div><p>Check website status:</p></div>
        </div>
        <div class="uk-container">
            <?php
                $db = connectDB();
                if ($db === false) {
                    echo("<p class='uk-text-danger'>MySQL server is not functioning properly!</p>");
                    die("ERROR: Could not connect. " . $db->connect_error);
                } else {
                    echo("<p class='uk-text-success'>MySQL server is online and connected!</p>");                 
                    $userQuery = "SELECT id FROM accounts;";
                    $fileQuery = "SELECT id FROM files;";
                    $userResult = $db->query($userQuery);
                    $fileResult = $db->query($fileQuery);
                    $userCount = $userResult->num_rows;
                    $fileCount = $fileResult->num_rows;
                    if ($userCount == 1) {
                        echo "<p>There is <b>{$userCount}</b> registered admin</p>";
                    } else {
                        echo "<p>There are <b>{$userCount}</b> registered admins</p>";
                    }
                    if ($fileCount == 1) {
                        echo "<p>There is <b>{$fileCount}</b> uploaded file</p>";
                    } else {
                        echo "<p>There are <b>{$fileCount}</b> uploaded files</p>";
                    }
                }
                $db->close();
            ?>
        </div>
    </div>
</section>

<?php include( 'footer.php' ); ?>
