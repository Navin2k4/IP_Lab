<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <center>
        <?php
        echo "<h2>Program 1 Leap Year or Not</h2>";
        $year = $_POST['year'];
        function checkLeapYear($year)
        {
            if (($year % 4 == 0 && $year % 100 != 0) || $year % 400 == 0) {
                return true;
            }
            return false;
        }
        if (checkLeapYear($year)) {
            echo "<h2>The year $year is a Leap Year</h2>";
        } else {
            echo "<h2>The year $year is not a Leap Year</h2>";
        }
        ?>
    </center>
</body>
</html>