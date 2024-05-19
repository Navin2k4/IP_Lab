<body>
    <h1>Leap Year Checker</h1>

    <form method="post">
        <label for="year">Enter the year:</label>
        <input type="text" id="year" name="year">
        <button type="submit" name="leapYearCheck">Check</button>
    </form>

    <?php
    if (isset($_POST["leapYearCheck"])) {
        $year = $_POST["year"];
        if (is_numeric($year)) {
            if (($year % 4 == 0 && $year % 100 != 0) || $year % 400 == 0) {
                echo "<p>$year is a leap year.</p>";
            } else {
                echo "<p>$year is not a leap year.</p>";
            }
        } else {
            echo "<p>Please enter a valid year.</p>";
        }
    }
    ?>
</body>


<body>
    <h1>Palindrome Checker</h1>

    <form method="post">
        <label for="number">Enter a number:</label>
        <input type="text" id="number" name="number">
        <button type="submit" name="palindromeCheck">Check</button>
    </form>

    <?php
    if (isset($_POST["palindromeCheck"])) {
        $number = $_POST["number"];
        $reverse = strrev($number);
        if ($number == $reverse) {
            echo "<p>$number is a palindrome.</p>";
        } else {
            echo "<p>$number is not a palindrome.</p>";
        }
    }
    ?>
</body>

<body>
    <h1>Number Guessing Game</h1>

    <?php
    $randomNumber = rand(1, 100);
    if (isset($_POST["guess"])) {
        $guess = $_POST["guess"];
        if ($guess == $randomNumber) {
            echo "<p>Congratulations! You guessed the correct number $randomNumber.</p>";
        } elseif ($guess < $randomNumber) {
            echo "<p>Your guess $guess is too low. Try again.</p>";
        } else {
            echo "<p>Your guess $guess is too high. Try again.</p>";
        }
    }
    ?>
    <form method="post">
        <label for="guess">Guess a number between 1 and 100:</label>
        <input type="number" id="guess" name="guess" min="1" max="100">
        <button type="submit" name="numberGuess">Guess</button>
    </form>
</body>

<body>
    <h1>Age Group Categorization</h1>

    <form method="post">
        <label for="age">Enter your age:</label>
        <input type="number" id="age" name="age">
        <button type="submit" name="ageGroup">Check</button>
    </form>

    <?php
    if (isset($_POST["ageGroup"])) {
        $age = $_POST["age"];
        if ($age >= 0 && $age <= 12) {
            echo "<p>You are a child.</p>";
        } elseif ($age >= 13 && $age <= 19) {
            echo "<p>You are a teenager.</p>";
        } elseif ($age >= 20 && $age <= 59) {
            echo "<p>You are an adult.</p>";
        } elseif ($age >= 60) {
            echo "<p>You are a senior.</p>";
        } else {
            echo "<p>Please enter a valid age.</p>";
        }
    }
    ?>
</body>

<body>
    <h1>Password Strength Checker</h1>

    <form method="post">
        <label for="password">Enter your password:</label>
        <input type="password" id="password" name="password">
        <button type="submit" name="passwordStrength">Check</button>
    </form>

    <?php
    if (isset($_POST["passwordStrength"])) {
        $password = $_POST["password"];
        $length = strlen($password);
        $uppercase = preg_match('@[A-Z]@', $password);
        $lowercase = preg_match('@[a-z]@', $password);
        $number = preg_match('@[0-9]@', $password);
        $specialChars = preg_match('@[^\w]@', $password);

        if ($length < 8 || !$uppercase || !$lowercase || !$number || !$specialChars) {
            echo "<p>Your password is weak. It should be at least 8 
            characters long and contain 
            uppercase and lowercase letters, numbers, and special characters.</p>";
        } else {
            echo "<p>Your password is strong.</p>";
        }
    }
    ?>
</body>