<?php
session_start();

// Database connection
$conn = new mysqli('localhost', 'root', '', 'demo', 3306);
if ($conn->connect_error){
    die('Connection Failed :' .$conn->connect_error);
}

// Execute SQL query to count registrations
$count_query = "SELECT COUNT(*) AS registration_count FROM Innvote";
$result = $conn->query($count_query);
if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    $registration_count = $row["registration_count"];
} else {
    $registration_count = 0;
}

$conn->close();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300..800;1,300..800&family=Raleway:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
    <title>Success Page</title>
    <style>
        body {
            background-color: #E3FAFF;
            margin: 0;
            padding: 0;
            font-family: "Raleway", sans-serif;
            font-optical-sizing: auto;
            font-weight: <weight>;
            font-style: normal;
        }
        .container {
            max-width: 800px;
            margin: 100px auto;
            background-color: #FFF5F9 ;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            text-align: center;
            font-size:23px;
        }
        h1 {
            color: #333;
            margin-bottom: 30px;
        }
        p {
            color: #000000;
            margin-bottom: 10px;
            font-size: 21px;
            font-weight: bold;
        }

        #re{
            color: #C00054;
        }
        .button {
            background-color: #00A5CA;
            color: white;
            padding: 20px 35px;
            text-align: center; 
            text-decoration: none;
            display: inline-block;
            font-size: 20px;
            margin-top: 30px;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .button:hover {
            background-color: #066D83;
        }

        .hack-image {
            display: block;
            margin: 20px auto; /* Adjust margin as needed */
            max-width: 100%; /* Ensure image doesn't exceed container width */
        }

        /* Style for user details */
        .user-details {
            margin-top: 20px;
            font-size: 25px;
        }

        .detail-item {
            display: flex;
            justify-content: space-evenly;
            align-items: center;
            margin-bottom: 10px;
        }

        .detail-label {
            flex: 1;
            text-align: right;
            margin-right: 20px; /* Adjusted margin */
            font-weight: bold;
            color: #333;
        }

        .detail-value {
            flex: 2;
            color: #000000;
            margin-left: 20px; /* Adjusted margin */
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Success!</h1>
        <p>Your data has been successfully submitted!</p>
        
        <!-- Display the number of registrations -->
        <p id="re">Total Registrations for Hackathon: <?php echo $registration_count; ?></p>
        
        <!-- Display user's information if available -->
        <div class="user-details">
            <?php
            // Check if user data exists in session
            if (isset($_SESSION['user_data'])) {
                $userData = $_SESSION['user_data']; ?>
                <div class="detail-item">
                    <span class="detail-label">Email:</span>
                    <span class="detail-value"><?php echo $userData['email']; ?></span>
                </div>
                <div class="detail-item">
                    <span class="detail-label">Mobile Number:</span>
                    <span class="detail-value"><?php echo $userData['mobileno']; ?></span>
                </div>
                <div class="detail-item">
                    <span class="detail-label">Name:</span>
                    <span class="detail-value"><?php echo $userData['firstname'] . " " . $userData['lastname']; ?></span>
                </div>
                <div class="detail-item">
                    <span class="detail-label">Institute Name:</span>
                    <span class="detail-value"><?php echo $userData['instname']; ?></span>
                </div>
                <div class="detail-item">
                    <span class="detail-label">Course:</span>
                    <span class="detail-value"><?php echo $userData['course']; ?></span>
                </div>
                <div class="detail-item">
                    <span class="detail-label">Qualification:</span>
                    <span class="detail-value"><?php echo $userData['qualification']; ?></span>
                </div>
            <?php } else { ?>
                <p>No user data found.</p>
            <?php }

            // Destroy session to clear user data
            session_destroy();
            ?>
        </div>

        <a href="file.html" class="button">Go Back</a>
        <img src="Hack.png" alt="Hack Image" class="hack-image">
    </div>
</body>
</html>
