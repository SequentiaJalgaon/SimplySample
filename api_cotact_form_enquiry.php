<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

$REQUEST_METHOD = $_SERVER["REQUEST_METHOD"];
$result = "";

include("dist/conf/db.php");
$pdo = Database::connect();

if ($REQUEST_METHOD == "GET") {
    // Fetch all enquiries
    $enquiries = array();
    $sql = "SELECT * FROM contact_form ORDER BY id_contact_form DESC";
    $q = $pdo->query($sql);

    foreach ($q as $row) {
        $enquiry = array(
            "EnquiryID" => $row["id_contact_form"],
            "Name" => $row["name"],
            "Email" => $row["email"],
            "Mobile" => $row["mobile_number"],
            "Subject" => $row["subject"],
            "Message" => $row["message"],
            "AddedOn" => date('j M Y h:i A', strtotime($row["added_on"])) // Format Date
            // "AddedOn" => $row["added_on"]
        );
        array_push($enquiries, $enquiry);
    }

    if (count($enquiries) > 0) {
        $result = array(
            'message' => $enquiries,
            'status' => true,
            'statusCode' => 200
        );
    } else {
        $result = array(
            'message' => 'No enquiries found',
            'status' => false,
            'statusCode' => 200
        );
    }
} elseif ($REQUEST_METHOD == "POST") {
    // Read JSON input
    $userInfo = json_decode(file_get_contents('php://input'), true);

    $name = trim($userInfo['name'] ?? '');
    $email = trim($userInfo['email'] ?? '');
    $mobile_number = trim($userInfo['mobile_number'] ?? '');
    $subject = trim($userInfo['subject'] ?? '');
    $message = trim($userInfo['message'] ?? '');

    if (empty($name) || empty($email) || empty($mobile_number) || empty($subject)) {
        $result = [
            "message" => "All fields (Name, Email, Mobile Number, Subject) are required.",
            "status" => "fail",
            "statusCode" => 400
        ];
    } elseif (!preg_match('/^[0-9]{10}$/', $mobile_number)) {
        $result = [
            "message" => "Mobile number must be a valid 10-digit number.",
            "status" => "fail",
            "statusCode" => 400
        ];
    } else {
        // Insert into database
        $sql_insert = "INSERT INTO contact_form (`name`, `mobile_number`, `email`, `message`, `subject`, `added_on`) VALUES (?,?,?,?,?, NOW())";
        $stmt_insert = $pdo->prepare($sql_insert);
        $stmt_insert->execute([$name, $mobile_number, $email, $message, $subject]);

        $result = [
            "message" => "Enquiry added successfully.",
            "status" => "success",
            "statusCode" => 200
        ];
    }
} else {
    $result = array(
        'message' => 'Requested Method is not supported',
        'status' => false,
        'statusCode' => 405
    );
}

echo json_encode($result);
exit();
