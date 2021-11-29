<?php
session_start();
if (isset($_SESSION['user'])) {
    header('Location: index.php');
}
?>

<?php include( 'header.php' ); ?>
<title>Previse Login</title>
</head>
<body>
<div class="uk-container">
    <div class="uk-container uk-position-relative">
        <h1 class="uk-heading-large">Previse File Storage</h1>
        <h2>Login</h2>
        <p>
        <?php
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            $username = filter_var($_POST['username'], FILTER_SANITIZE_STRING);
            $password = $_POST['password'];
            if (empty(trim($username))) {
                echo '<div class="uk-alert-danger">Invalid Username or Password</div>';
            } elseif (empty(trim($_POST['password']))) {
                echo '<div class="uk-alert-danger">Invalid Username or Password</div>';
            } else {
                $db = connectDB();
                if ($db === false) {
                    die("ERROR: Could not connect. " . $db->connect_error);
                }
                $sql = "SELECT * FROM accounts WHERE username = '{$username}';";
                $result = $db->query($sql);
                if ($result->num_rows != 1) {
                    echo '<div class="uk-alert-danger">Invalid Username or Password</div>';
                    $result->free();
                    $db->close();
                } else {
                    $users = $result->fetch_assoc();
                    $passHash = $users['password'];
                    if (crypt($password, '$1$🧂llol$') == $passHash) {
                        $result->free();
                        $_SESSION['user'] = $users['username'];
                        $result = $db->query($sql);
                        if (!$result) {
                            echo 'Oops! Something went wrong, try again later!';
                        }
                        $db->close();
                        header('Location: index.php');
                    } else {
                        echo '<div class="uk-alert-danger">Invalid Username or Password</div>';
                    }
                }
            }
        }
        ?></p>
        <form action="login.php" method="post">
            <div class="uk-margin uk-width-1-4@s">
                <div class="uk-inline">
                    <span class="uk-form-icon" uk-icon="icon: user"></span>
                    <input type="text" name="username" class="uk-input" placeholder="Username">
                </div>
            </div>
            <div class="uk-margin uk-width-1-4@s">
                <div class="uk-inline">
                    <span class="uk-form-icon" uk-icon="icon: lock"></span>
                    <input type="password" name="password" class="uk-input" placeholder="Password" required>
                </div>
            </div>
            <button class="uk-button uk-button-default" type="submit">LOG IN</button>
        </form>
    </div>
</div>

<?php include( 'footer.php' ); ?>
