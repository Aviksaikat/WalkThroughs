<?php
session_start();
if (!isset($_SESSION['user'])) {
    header('Location: login.php');
}
?>

<?php include( 'header.php' ); ?>

<title>Previse Files</title>
</head>
<body>

<?php include( 'nav.php' ); ?>

    <section class="uk-section uk-section-default">
        <div class="uk-container">
            <h2 class="uk-heading-divider">Files</h2>
            <p><?php
                if (count($_FILES) > 0) {
                    if (is_uploaded_file($_FILES['userData']['tmp_name'])) {
                        $fileName = $_FILES['userData']['name'];
                        $fileData = addslashes(file_get_contents($_FILES['userData']['tmp_name']));
                        $fileSize = $_FILES['userData']['size'];
                        $sql = "INSERT INTO files(name, size, data, user) VALUES('{$fileName}', '{$fileSize}', '{$fileData}', '{$_SESSION['user']}')";
                        $db = connectDB();
                        $result = $db->query($sql);
                        if ($result) {
                            echo '<div class="uk-alert-success" uk-alert><a class="uk-alert-close" uk-close></a><p>File successfully uploaded!! :)</p></div>';
                        } else {
                            echo '<div class="uk-alert-danger" uk-alert><a class="uk-alert-close" uk-close></a><p>Error while uploading! :(</p></div>';
                        }
                     }
                }
            ?></p>
            <p>Upload files below, uploaded files in table below</p>
            <form name="upload" enctype="multipart/form-data" action="" method="post">
                <div uk-form-custom="target: true">
                    <input name="userData" type="file">
                    <input class="uk-input uk-form-width-medium" type="text" placeholder="Select file" disabled>
                </div>
                <button class="uk-button uk-button-default" type="submit" value="Submit">Submit</button>
            </form>
        </div>
        <div class="uk-container">
            <br>
            <h2 class="uk-heading-divider">Uploaded Files</h2>
<?php
    if ($_SERVER['REQUEST_METHOD'] == 'POST' AND !empty($_POST['del'])){
        $delID = filter_var($_POST['del'], FILTER_SANITIZE_NUMBER_INT);
        $db = connectDB();
        if($db === false) {
            die("ERROR: Could not connect. " . $db->connect_error);
        }
        //check if the file is protected
        $isProtectedQuery = "SELECT protected FROM files WHERE id = '{$delID}' and protected = 1 limit 1;";
        $protectedResult = $db->query($isProtectedQuery);
        if ($protectedResult->num_rows > 0) {
            echo '<div class="uk-alert-danger" uk-alert><a class="uk-alert-close" uk-close></a><p>This file is protected from deletion!</p></div>';
            $protectedResult->free();
        } else {
            $protectedResult->free();
            $deleteQuery = "DELETE FROM files WHERE id = '{$delID}';";
            $deleteResult = $db->query($deleteQuery);
            if ($deleteResult) {
                echo '<div class="uk-alert-success" uk-alert><a class="uk-alert-close" uk-close></a><p>Success! File was deleted!</p></div>';
            } else {
                echo '<div class="uk-alert-danger" uk-alert><a class="uk-alert-close" uk-close></a><p>Unable to delete file for unknown reason!</p></div>';
            }
            $db->close();
        }
    }
?>    
<?php
    $db = connectDB();
    if($db === false) {
        die("ERROR: Could not connect. " . $db->connect_error);
    }
    $query = "SELECT id, name, size, user, upload_time FROM files";
    $result = $db->query($query);
    if ($result) {
        if ($result->num_rows != 0) {
            echo '<table class="uk-table uk-table-hover uk-table-divider">
            <thead>
            <tr>
                <th class="uk-table-shrink">#</th>
                <th class="uk-table-expand">Name</th>
                <th>Size</th>
                <th>User</th>
                <th>Date</th>
                <th>Delete</th>
            </tr>
            </thead>
            <tbody>';
        }
        if($result->num_rows == 0) {
            echo '</tbody></table>
            <div class="uk-placeholder uk-text-center">
                No files uploaded yet, why not add some?
            </div>';
        } else {
            // Add files to the table with counter
            $counter = 0;
            while($row = $result->fetch_assoc()) {
                $counter++;
                echo "
                <tr>
                    <td>{$counter}</td>
                    <td><a href='download.php?file={$row['id']}'><button class=\"uk-button uk-button-text\">{$row['name']}</button></a></td>
                    <td>{$row['size']}</td>
                    <td>{$row['user']}</td>
                    <td>{$row['upload_time']}</td>
                    <td><form action=\"files.php\" method=\"post\">
                        <button class=\"uk-button uk-button-danger uk-button-small\" type=\"button\" uk-toggle=\"target: #offcanvas-flip{$counter}\">Delete</button>
                        <div id=\"offcanvas-flip{$counter}\" uk-offcanvas=\"flip: true; overlay: true\">
                            <div class=\"uk-offcanvas-bar\">
                                <button class=\"uk-offcanvas-close\" type=\"button\" uk-close></button>
                                <h3>Delete File</h3>
                                <p>Are you sure you want to delete this file?</p>
                                <button class=\"uk-button uk-button-danger uk-button-small\" type=\"submit\" name=\"del\" value=\"{$row['id']}\">Delete</button>
                            </div>
                        </div>
                    </form></td>
                </tr>";
            }
            echo '</tbody></table></div>';
        }
        $result->free();
    } else {
        echo '<div class="uk-alert-danger" uk-alert><a class="uk-alert-close" uk-close></a><p>Error grabbing files from db!!</p></div>';
    }
    $db->close();    
?>
        </div>
    </section>
    
<?php include( 'footer.php' ); ?>
