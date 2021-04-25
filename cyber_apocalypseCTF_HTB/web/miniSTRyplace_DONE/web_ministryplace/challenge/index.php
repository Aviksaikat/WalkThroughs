<html>
    <header>
        <meta name='author' content='bertolis, makelaris'>
        <title>Ministry of Defence</title>
        <link rel="stylesheet" href="/static/css/main.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.0/slate/bootstrap.min.css"   >
    </header>

    <body>
    <div class="language">
        <a href="?lang=en.php">EN</a>
        <a href="?lang=qw.php">QW</a>
    </div>

    <?php
    $lang = ['en.php', 'qw.php'];
        include('pages/' . (isset($_GET['lang']) ? str_replace('../', '', $_GET['lang']) : $lang[array_rand($lang)]));
    ?>
    </body>
</html>