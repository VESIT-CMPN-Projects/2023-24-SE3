<?php
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = $_POST['email'];
    $mobileno = $_POST['mobileno'];
    $firstname = $_POST['firstname'];
    $lastname = $_POST['lastname'];
    $gender = $_POST['gender'];
    $instname = $_POST['instname'];
    $course = $_POST['course'];
    $qualification = $_POST['qualification'];

    // Database connection
    $conn = new mysqli('localhost', 'root', '', 'demo', 3306);
    if ($conn->connect_error){
        die('Connection Failed :' .$conn->connect_error);
    }

    // Check if email already exists
    $check_stmt = $conn->prepare("SELECT email FROM bolt1 WHERE email = ?");
    if (!$check_stmt) {
        die('Error preparing statement: ' . $conn->error);
    }
    $check_stmt->bind_param("s", $email);
    $check_stmt->execute();
    $check_stmt->store_result();
    if ($check_stmt->num_rows > 0) {
        // Email already exists, redirect to error.html
        header("Location: error.html");
        exit();
    }

    // Insert registration data into database
    $stmt = $conn->prepare("INSERT INTO bolt1 (email, mobileno, firstname, lastname, gender, instname, course, qualification) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
    if (!$stmt) {
        die('Error preparing statement: ' . $conn->error);
    }
    $stmt->bind_param("ssssssss", $email, $mobileno, $firstname, $lastname, $gender, $instname, $course, $qualification);
    $stmt->execute();
    $stmt->close();

    // Send email confirmation
    $subject = 'Confirmation of Registration for Innvote-a-Thon Hackathon';
    $message = "We are pleased to inform you that your registration for the Innovate-a-Thon Hackathon has been successfully completed. You are now officially enrolled as a participant in the event.

    
    **Hackathon Details:**

    Event Name: Innovate-a-Thon Hackathon  
    Date: 16-04-2024  
    Time: 12:00 PM  
    Venue: Vivekanand Education Society's Institute Of Technology  


    Your participation in this hackathon signifies your commitment to innovation and collaboration in the field of Web Development! We are excited to see your creative ideas and solutions during the event.

    As a registered participant, please ensure that you arrive at the venue on time and bring any necessary materials or equipment required for the hackathon. Be prepared to engage with fellow participants, mentors, and judges to make the most out of this experience.

    If you have any questions or require further assistance, feel free to reach out to us at 9878656546.

    Thank you for joining us in this exciting journey of exploration and discovery. We look forward to seeing you at the Innovate-a-Thon Hackathon!";
    $sender = "From: corridorinfinity@gmail.com"; // Replace with your email address


    if (mail($email, $subject, $message, $sender)) {
        // Store user data in session
        $_SESSION['user_data'] = [
            'email' => $email,
            'mobileno' => $mobileno,
            'firstname' => $firstname,
            'lastname' => $lastname,
            'gender' => $gender,
            'instname' => $instname,
            'course' => $course,
            'qualification' => $qualification
        ];

        // Redirect to success page
        header("Location: success.php");
        exit();
    } else {
        // If mail sending fails, handle accordingly
        echo "Error: Unable to send confirmation email.";
    }
    $conn->close();
}
?>
