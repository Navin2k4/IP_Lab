<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Details</title>
</head>

<body>
    <h2>Employee Details Form</h2>
    <form method="post">
        <label for="name">Name:</label><br>
        <input type="text" id="name" name="name"><br>

        <label for="age">Age:</label><br>
        <input type="text" id="age" name="age"><br>

        <label for="salary">Salary:</label><br>
        <input type="text" id="salary" name="salary"><br>

        <label for="department">Department:</label><br>
        <input type="text" id="department" name="department"><br>

        <input type="submit" value="Submit">
    </form>

    <?php
    $name = $_POST["name"];
    $age = $_POST["age"];
    $salary = $_POST["salary"];
    $department = $_POST["department"];

    $emp = new employee($name, $age, $salary, $department);

    echo "<h2>Employee Details</h2>";
    echo $emp->display();

    class employee
    {
        public $name;
        public $age;
        public $salary;
        public $department;

        public function __construct($name, $age, $salary, $department)
        {
            $this->name = $name;
            $this->age = $age;
            $this->salary = $salary;
            $this->department = $department;
        }

        public function display()
        {
            return "Name: " . $this->name . "<br>Age: " . $this->age . "<br>Salary: " . $this->salary . "<br>Department: " . $this->department;
        }
    }

    ?>
</body>

</html>