<!-- ● Build a product order form using HTML and PHP that allows users to select a product, enter a quantity, and submit the
order to be stored in a MySQL database. Validate the Form using PHP regular expressions. -->

<?php
$success = "";
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $server = "localhost";
    $username = 'root';
    $password = '';
    $database = 'labexercise';

    $conn = new mysqli($server, $username, $password, $database);
    if ($conn->connect_error) {
        die("Connection error: " . $conn->connect_error);
    }

    $item = $_POST["fruits"];
    $qty = $_POST["quantity"];

    if ($item == '') {
        die("Select a product");
    } else {
        $sql = "INSERT INTO myorders (item, qty) VALUES (?, ?)";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("si", $item, $qty);
        if ($stmt->execute()) {
            $success = "Inserted Successfully";
        } else {
            $success = "Error: " . $stmt->error;
        }
        $stmt->close();
    }
    $conn->close();
}
?>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title></title>
</head>

<body>
    <?php if (!empty($success)) {
        echo htmlspecialchars($success);
    } ?>
    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="POST">
        <select name="fruits" id="fruits">
            <option value=''>Select Item</option>
            <option value='Apple'>Apple</option>
            <option value='Orange'>Orange</option>
            <option value="Strawberry">Strawberry</option>
            <option value='Pineapple'>Pineapple</option>
        </select>
        <input type='number' id='quantity' name='quantity' placeholder='Qty'>
        <input type='submit' value='Order'>
    </form>
</body>

</html>