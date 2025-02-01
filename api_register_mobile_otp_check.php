<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

require_once("dist/conf/db.php");
$pdo = Database::connect();

$otpExpiryTime = "180 SECOND"; // In Seconds
$currentdDateTime = date('Y-m-d H:i:s');

$REQUEST_METHOD = $_SERVER["REQUEST_METHOD"];
$result = "";

if ($REQUEST_METHOD == "GET") {
    // Handle GET requests if needed
} else if ($REQUEST_METHOD == "POST") {
    $result = []; // Initialize $result as an array

    // Decode JSON input as an associative array
    $json = file_get_contents('php://input');
    $postData = json_decode($json, true);

    // Check if payload is empty
    if (!is_array($postData) || empty($postData)) {
        echo json_encode([
            'message' => 'No data provided',
            'status' => false,
            'statusCode' => 400
        ]);
        exit();
    }

    // Loop through the array of objects
           // foreach ($postData as $data) {
           $data = $postData ;
        // Safely extract each field
        $mobile_number = isset($data['mobile_number']) ? trim($data['mobile_number']) : '';
        $registration_code = isset($data['registration_code']) ? trim($data['registration_code']) : '';

        // Condition 1: Check if mobile number is empty
        if (empty($mobile_number)) {
            $result[] = [
                "message" => "Mobile number cannot be empty.",
                "status" => "fail",
                'statusCode' => 400
            ];
        }

       
        try {

            $sql_existUser = "SELECT * FROM user_vs_registration_code WHERE mobile_number = ? AND registration_code = ?";
            $q = $pdo->prepare($sql_existUser);
            $q->execute([$mobile_number,$registration_code]);
            $isPresentMobile = $q->fetch(PDO::FETCH_ASSOC);

            if ($isPresentMobile) {
                
                $otpExpired = true;
                $optmaxtime = date('Y-m-d H:i:s', strtotime( "+".$otpExpiryTime, strtotime($isPresentMobile['added_on']))); 
                if ($optmaxtime >= $currentdDateTime) $otpExpired = false;

                if(!$otpExpired) {

                    $sql_existUser = "SELECT * FROM users WHERE mobile_number = ? ";
                    $q = $pdo->prepare($sql_existUser);
                    $q->execute([$mobile_number]);
                    $isPresentUser = $q->fetch(PDO::FETCH_ASSOC);
        
                    if (!$isPresentUser) {

                        $sql_insert = "INSERT INTO users (mobile_number, is_active, mobile_verified) VALUES (?, ?,?)";
                        $stmt_insert = $pdo->prepare($sql_insert);
                        $stmt_insert->execute([$mobile_number, '1','1']);
                        $userId = $pdo->lastInsertId();
                        $result= ([
                            "message" => "OTP matched successfully",
                            "userId" => $userId,
                            "status" => "success",
                            'statusCode' => 200
                        ]);
                    } else {
                        $result[] = [
                            "message" => "Mobile Number already registered.",
                            "status" => "fail",
                            'statusCode' => 200
                        ];
                    }

                } else {
                    $result[] = [
                        "message" => "OTP is not expired.",
                        "status" => "fail",
                        'statusCode' => 422
                    ];
                }

            } else {
                $result[] = [
                    "message" => "OTP is not matched.",
                    "status" => "fail",
                    'statusCode' => 422
                ];
            }
        } catch (Exception $e) {
            $result[] = [
                "message" => "Error: " . $e->getMessage(),
                "status" => "fail",
                'statusCode' => 500
            ];
        } finally {
            Database::disconnect();
        }
    // }
    // Return the result as JSON
    echo json_encode($result);
    exit();
}
