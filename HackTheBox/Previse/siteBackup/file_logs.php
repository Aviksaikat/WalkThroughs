<?php
session_start();
if (!isset($_SESSION['user'])) {
    header('Location: login.php');
}
?>

<?php include( 'header.php' ); ?>

<title>Previse File Access Logs</title>
</head>
<body>

<?php include( 'nav.php' ); ?>
<section class="uk-section uk-section-default">
    <div class="uk-container">
        <h2 class="uk-heading-divider">Request Log Data</h2>
        <p>We take security very seriously, and keep logs of file access actions. We can set delimters for your needs!</p>
        <p>Find out which users have been downloading files.</p>
        <form action="logs.php" method="post">
            <div class="uk-margin uk-width-1-4@s">
                <label class="uk-form-label" for="delim-log">File delimeter:</label>
                <select class="uk-select" name="delim" id="delim-log">
                    <option value="comma">comma</option>
                    <option value="space">space</option>
                    <option value="tab">tab</option>
                </select>
            </div>
            <button class="uk-button uk-button-default" type="submit" value="submit">Submit</button>
        </form>
    </div>
</section>
    
<?php include( 'footer.php' ); ?>
