<?php
session_start();
if (!isset($_SESSION['user'])) {
    header('Location: login.php');
}
?>

<?php include( 'header.php' ); ?>
<title>Previse Create Account</title>
</head>
<body>
    
<?php include( 'nav.php' ); ?>

<section class="uk-section uk-section-default">
    <div class="uk-container">
        <h2 class="uk-heading-divider">Add New Account</h2>
        <p>Create new user.</p>
        <p class="uk-alert-danger">ONLY ADMINS SHOULD BE ABLE TO ACCESS THIS PAGE!!</p>
        <p>Usernames and passwords must be between 5 and 32 characters!</p>
    <?php
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            if (empty(trim($_POST['username']))) {
                    echo '<div class="uk-alert-danger" uk-alert><a class="uk-alert-close" uk-close></a><p>The username needs to be provided!</p></div>';
            } elseif (empty(trim($_POST['password']))) {
                echo '<div class="uk-alert-danger" uk-alert><a class="uk-alert-close" uk-close></a><p>The password needs to be provided!</p></div>';
            } elseif (empty(trim($_POST['confirm']))) {
                echo '<div class="uk-alert-danger" uk-alert><a class="uk-alert-close" uk-close></a><p>The password confirmation needs to be provided!</p></div>';
            } else {
                if (!preg_match('/^[a-zA-Z0-9_]+$/', trim($_POST['username']))) {
                    echo '<div class="uk-alert-danger" uk-alert><a class="uk-alert-close" uk-close></a><p>Usernames can only contain letters, numbers, and underscores!</p></div>';
                } else {
                    $username = filter_var($_POST['username'], FILTER_SANITIZE_STRING);
                    $password = $_POST['password'];
                    $confirm = filter_var($_POST['confirm'], FILTER_SANITIZE_STRING);
                    if (strlen($username) > 32 || strlen($username) < 5) {
                        echo '<div class="uk-alert-danger" uk-alert><a class="uk-alert-close" uk-close></a><p>Username must be 5 to 32 chars!</p></div>';
                    } else {
                        $db = connectDB();
                        if ($db === false) {
                            die("ERROR: Could not connect. " . $db->connect_error);
                        }
                        $sql = "SELECT username FROM accounts WHERE username = '{$username}' limit 1;";
                        $accountResult = $db->query($sql);
                        if ($accountResult->num_rows != 0) {
                            echo  '<div class="uk-alert-danger" uk-alert><a class="uk-alert-close" uk-close></a><p>Username is already taken!</p></div>';
                            $accountResult->free();
                        } else {
                            $accountResult->free();
                            if (strlen($password) > 32 || strlen($password) < 5) {
                                echo '<div class="uk-alert-danger" uk-alert><a class="uk-alert-close" uk-close></a><p>Password must be between 5 and 32 chars!</p></div>';
                            } else {
                                if ($password != $confirm) {
                                    echo '<div class="uk-alert-danger" uk-alert><a class="uk-alert-close" uk-close></a><p>The passwords dont match!</p></div>';
                                } else {
                                    $hash = crypt($password, '$1$🧂llol$');
                                    $db = connectDB();
                                    if ($db === false) {
                                        die("ERROR: Could not connect. " . $db->connect_error);
                                    }                    
                                    $sql = "INSERT INTO accounts (username, password) VALUES ('{$username}','{$hash}')";
                                    $result = $db->query($sql);
                                    if ($result) {
                                        echo '<div class="uk-alert-success" uk-alert><a class="uk-alert-close" uk-close></a><p>Success! User was added!</p></div>';
                                    } else {
                                        echo '<div class="uk-alert-danger" uk-alert><a class="uk-alert-close" uk-close></a><p>Error! Failed to add new user</p></div>';
                                    }
                                $db->close();
                                }
                            }
                        }
                    }
                }
            }
        }
    ?></p>
        <form role="form" method="post" action="accounts.php">
            <div class="uk-margin">
                <div class="uk-inline">
                    <span class="uk-form-icon" uk-icon="icon: user"></span>
                    <input type="text" name="username" class="uk-input" id="username" placeholder="Username">
                </div>
            </div>
            <div class="uk-margin">
                <div class="uk-inline">
                    <span class="uk-form-icon" uk-icon="icon: lock"></span>
                    <input type="password" name="password" class="uk-input" id="password" placeholder="Password">
                </div>
            </div>
            <div class="uk-margin">
                <div class="uk-inline">
                    <span class="uk-form-icon" uk-icon="icon: lock"></span>
                    <input type="password" name="confirm" class="uk-input" id="confirm" placeholder="Confirm Password">
                </div>
            </div>
            <button type="submit" name="submit" class="uk-button uk-button-default">CREATE USER</button>
        </form>
    </div>
</section>
            
<?php include( 'footer.php' ); ?>
