<?php
// Enable error reporting
error_reporting(E_ALL);
ini_set('display_errors', 1);
ini_set('log_errors', 1);
ini_set('error_log', 'error.log');

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "Floodguard_network";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    error_log("Connection failed: " . $conn->connect_error);
    die("Connection failed: " . $conn->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $full_name = $_POST['full_name'];
    $username = $_POST['username'];
    $password = password_hash($_POST['password'], PASSWORD_DEFAULT);
    $email = $_POST['email'];
    $user_type = $_POST['user_type'];

    // Log received data
    error_log("Attempting to register user: " . $username);

    // Check if username already exists
    $check_sql = "SELECT * FROM users WHERE username = ?";
    $check_stmt = $conn->prepare($check_sql);
    if (!$check_stmt) {
        error_log("Prepare failed: " . $conn->error);
        die("Database error");
    }
    
    $check_stmt->bind_param("s", $username);
    if (!$check_stmt->execute()) {
        error_log("Execute failed: " . $check_stmt->error);
        die("Database error");
    }
    
    $result = $check_stmt->get_result();

    if ($result->num_rows > 0) {
        error_log("Username already exists: " . $username);
        echo "Username already exists!";
    } else {
        // Insert new user
        $sql = "INSERT INTO users (full_name, username, password, email, user_type) 
                VALUES (?, ?, ?, ?, ?)";
        $stmt = $conn->prepare($sql);
        if (!$stmt) {
            error_log("Prepare failed: " . $conn->error);
            die("Database error");
        }

        $stmt->bind_param("sssss", $full_name, $username, $password, $email, $user_type);
        if (!$stmt->execute()) {
            error_log("Insert failed: " . $stmt->error);
            die("Failed to register user");
        } else {
            error_log("User registered successfully: " . $username);
            echo "Registration successful!";
            header("Location: login.php");
            exit();
        }
    }
    $stmt->close();
}
$conn->close();
?>
