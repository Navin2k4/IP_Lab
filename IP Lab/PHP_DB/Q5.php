<!-- 
●	Create a survey form using HTML and PHP that collects user feedback on a particular topic and stores it in a MySQL database for analysis. Validate the Form using PHP regular expressions. -->


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Survey Form</title>
</head>

<body>
    <h2>Survey</h2>
    <form action="submit_survey.php" method="post">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required><br><br>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required><br><br>

        <label for="feedback">Feedback:</label><br>
        <textarea id="feedback" name="feedback" rows="4" cols="50" required></textarea><br><br>

        <label for="rating">Rating (1-5):</label>
        <input type="number" id="rating" name="rating" min="1" max="5" required><br><br>

        <input type="submit" value="Submit">
    </form>
</body>

</html>

<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Database connection
    $servername = "localhost";
    $username = "your_username";
    $password = "your_password";
    $dbname = "your_database_name";

    $conn = new mysqli($servername, $username, $password, $dbname);

    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    // Form validation using regular expressions
    $name = $_POST['name'];
    $email = $_POST['email'];
    $feedback = $_POST['feedback'];
    $rating = $_POST['rating'];

    // Validate name (only letters and spaces allowed)
    if (!preg_match("/^[a-zA-Z ]*$/", $name)) {
        die("Invalid name format");
    }

    // Validate email format
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        die("Invalid email format");
    }

    // Validate rating (must be between 1 and 5)
    if ($rating < 1 || $rating > 5) {
        die("Invalid rating. Please enter a number between 1 and 5");
    }

    // Insert survey feedback into the database
    $sql = "INSERT INTO survey_feedback (name, email, feedback, rating) VALUES ('$name', '$email', '$feedback', '$rating')";
    if ($conn->query($sql) === TRUE) {
        echo "Feedback submitted successfully";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }

    $conn->close();
}
?>