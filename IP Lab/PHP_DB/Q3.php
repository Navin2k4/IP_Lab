<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Course Registration</title>
</head>

<body>
    <h2>Student Course Registration</h2>
    <form action="register.php" method="post">
        <label for="student_name">Student Name:</label>
        <input type="text" id="student_name" name="student_name" required><br><br>

        <label for="student_id">Student ID:</label>
        <input type="text" id="student_id" name="student_id" required><br><br>

        <label for="courses">Select Courses:</label><br>
        <input type="checkbox" id="course1" name="courses[]" value="Math">Math<br>
        <input type="checkbox" id="course2" name="courses[]" value="Science">Science<br>
        <input type="checkbox" id="course3" name="courses[]" value="History">History<br><br>

        <input type="submit" value="Register">
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

    $student_name = $_POST['student_name'];
    $student_id = $_POST['student_id'];
    $courses = $_POST['courses']; 

    if (!isset($courses) || empty($courses)) {
        die("Please select at least one course");
    }

    foreach ($courses as $course) {
        $sql = "INSERT INTO student_courses (student_name, student_id, course) VALUES ('$student_name', '$student_id', '$course')";
        if ($conn->query($sql) !== TRUE) {
            echo "Error: " . $sql . "<br>" . $conn->error;
        }
    }

    echo "Registration successful";

    $conn->close();
}
?>