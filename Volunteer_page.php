<?php
session_start();
if (!isset($_SESSION['user_id']) || $_SESSION['user_type'] !== 'volunteer') {
    header("Location: index.html");
    exit();
}

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "Floodguard_network";

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$user_id = $_SESSION['user_id'];
$sql = "SELECT * FROM users WHERE id = ? AND user_type = 'volunteer'";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $user_id);
$stmt->execute();
$result = $stmt->get_result();
$volunteer = $result->fetch_assoc();

$conn->close();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Volunteer Dashboard</title>
    <style>
        :root {
            --primary-color: #2c3e50;
            --secondary-color: #3498db;
            --accent-color: #e74c3c;
            --success-color: #2ecc71;
            --warning-color: #f1c40f;
            --light-color: #ecf0f1;
            --dark-color: #34495e;
            --shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-color: #f5f6fa;
            color: var(--dark-color);
            min-height: 100vh;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        .header {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: var(--shadow);
        }

        .profile-card {
            background: white;
            border-radius: 10px;
            padding: 25px;
            box-shadow: var(--shadow);
            margin-bottom: 30px;
            transition: transform 0.3s ease;
        }

        .profile-card:hover {
            transform: translateY(-5px);
        }

        .profile-header {
            display: flex;
            align-items: center;
            gap: 20px;
            margin-bottom: 30px;
            padding-bottom: 20px;
            border-bottom: 2px solid var(--light-color);
        }

        .profile-avatar {
            width: 100px;
            height: 100px;
            background: linear-gradient(45deg, var(--secondary-color), var(--primary-color));
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 40px;
            box-shadow: var(--shadow);
        }

        .profile-info h2 {
            color: var(--primary-color);
            margin-bottom: 5px;
            font-size: 1.8em;
        }

        .profile-info p {
            color: var(--secondary-color);
            font-size: 1.1em;
        }

        .profile-details {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-top: 20px;
        }

        .detail-item {
            background: var(--light-color);
            padding: 20px;
            border-radius: 8px;
            transition: all 0.3s ease;
        }

        .detail-item:hover {
            background: white;
            box-shadow: var(--shadow);
            transform: translateY(-3px);
        }

        .detail-item label {
            color: var(--dark-color);
            font-weight: 600;
            margin-bottom: 10px;
            display: block;
            font-size: 1.1em;
        }

        .detail-item p {
            color: var(--secondary-color);
            font-size: 1.2em;
            margin: 0;
        }

        .btn {
            padding: 12px 24px;
            border: none;
            border-radius: 5px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            font-size: 1em;
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: var(--shadow);
        }

        .btn-primary {
            background: var(--secondary-color);
            color: white;
        }

        .btn-primary:hover {
            background: var(--primary-color);
        }

        .btn-secondary {
            background: var(--light-color);
            color: var(--dark-color);
        }

        .btn-secondary:hover {
            background: #dfe6e9;
        }

        .btn-danger {
            background: var(--accent-color);
            color: white;
        }

        .btn-danger:hover {
            background: #c0392b;
        }

        .profile-footer {
            margin-top: 30px;
            display: flex;
            gap: 15px;
            justify-content: flex-end;
            padding-top: 20px;
            border-top: 2px solid var(--light-color);
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Welcome, <?php echo htmlspecialchars($volunteer['full_name']); ?></h1>
            <button class="btn btn-primary">Report Emergency</button>
        </div>
        
        <div class="profile-card">
            <div class="profile-header">
                <div class="profile-avatar">
                    <i class="fas fa-user"></i>
                </div>
                <div class="profile-info">
                    <h2><?php echo htmlspecialchars($volunteer['full_name']); ?></h2>
                    <p><?php echo htmlspecialchars($volunteer['email']); ?></p>
                </div>
            </div>
            
            <div class="profile-details">
                <div class="detail-item">
                    <label>Volunteer ID</label>
                    <p><?php echo htmlspecialchars($volunteer['id']); ?></p>
                </div>
                <div class="detail-item">
                    <label>Phone Number</label>
                    <p><?php echo isset($volunteer['phone']) ? htmlspecialchars($volunteer['phone']) : 'Not provided'; ?></p>
                </div>
                <div class="detail-item">
                    <label>Location</label>
                    <p><?php echo isset($volunteer['location']) ? htmlspecialchars($volunteer['location']) : 'Not provided'; ?></p>
                </div>
            </div>
            
            <div class="profile-footer">
                <button class="btn btn-secondary">Edit Profile</button>
                <button class="btn btn-danger">Logout</button>
            </div>
        </div>
    </div>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</body>
</html>