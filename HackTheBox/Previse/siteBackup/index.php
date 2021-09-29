<?php
session_start();
if (!isset($_SESSION['user'])) {
    header('Location: login.php');
}
?>

<?php include( 'header.php' ); ?>

<title>Previse Home</title>
</head>
<body>
    
<?php include( 'nav.php' ); ?>

    <section class="uk-section uk-section-default">
        <div class="uk-container">
            <h2 class="uk-heading-divider">Previse File Hosting</h2>
            <p>Previse File Hosting Service Management.</p>
            <p>Don't have an account? Create one!</p>
        </div>
    </section>
    
<?php include( 'footer.php' ); ?>
