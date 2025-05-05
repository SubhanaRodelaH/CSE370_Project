<?php
// Database connection settings
$host = 'localhost';
$dbname = 'floodguard_network';
$username = 'your_username';
$password = 'your_password';

try {
    // Create a new PDO instance
    $pdo = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Fetch data for the front page
    $stmt = $pdo->query("SELECT * FROM front_page_content");
    $frontPageData = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Fetch data for the admin dashboard
    $stmt = $pdo->query("SELECT * FROM admin_dashboard_content");
    $adminDashboardData = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Example: Pass data to the front-end
    echo json_encode([
        'frontPage' => $frontPageData,
        'adminDashboard' => $adminDashboardData
    ]);
} catch (PDOException $e) {
    // Handle connection errors
    echo "Connection failed: " . $e->getMessage();
}
?>