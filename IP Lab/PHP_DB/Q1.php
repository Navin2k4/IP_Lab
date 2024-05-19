<!-- ● Build a login form using HTML and PHP that allows users to enter their email address and password, and checks this
information against the database to authenticate them. Validate the Form using PHP regular expressions. -->
<html>

<head>
    <meta charset="UTF-8">
    <title></title>
</head>

<body>
    <?php
    if ($_SERVER["REQUEST_METHOD"] == 'POST') {
        $servername = 'localhost';
        $username = 'root';
        $password = '';
        $database = 'labexercise';

        $conn = new mysqli($servername, $username, $password, $database);
        if ($conn->connect_error) {
            die("Connection Failed" + $conn->connect_error);
        }

        $email = $_POST["email"];
        $pass = $_POST["password"];

        if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            die("Invalid email id");
        }

        $sql = "SELECT * FROM users WHERE email='$email' AND password='$pass'";

        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            header("Location: mainpage.php");
            exit;
        } else {
            $error = "Invalid email or password";
        }
        $conn->close();
    }
    ?>
    <?php if (isset($error)) {
        echo $error;
    } ?>
    <form action='<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>' method="POST">
        <input type='text' id='email' name='email' placeholder='Enter email'>
        <input type='password' id='password' name='password' placeholder='Enter password'>
        <input type='submit' value='Login'>
    </form>
</body>

</html>