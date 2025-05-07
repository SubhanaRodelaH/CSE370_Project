<?php
session_start();
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "Floodguard_network";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Get volunteer information
if (isset($_SESSION['user_id'])) {
    $user_id = $_SESSION['user_id'];
    $sql = "SELECT * FROM users WHERE id = ? AND user_type = 'volunteer'";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $user_id);
    $stmt->execute();
    $result = $stmt->get_result();
    $volunteer = $result->fetch_assoc();

    // Get victims data
    $victims_sql = "SELECT * FROM victims";
    $victims_result = $conn->query($victims_sql);

    // Get locations data
    $locations_sql = "SELECT * FROM locations";
    $locations_result = $conn->query($locations_sql);

    // Get relief items data
    $relief_sql = "SELECT * FROM relief_items";
    $relief_result = $conn->query($relief_sql);

    // Return all data as JSON
    $response = array(
        'volunteer' => $volunteer,
        'victims' => $victims_result->fetch_all(MYSQLI_ASSOC),
        'locations' => $locations_result->fetch_all(MYSQLI_ASSOC),
        'relief_items' => $relief_result->fetch_all(MYSQLI_ASSOC)
    );

    header('Content-Type: application/json');
    echo json_encode($response);
} else {
    echo json_encode(['error' => 'Not logged in']);
}

$conn->close();
?>