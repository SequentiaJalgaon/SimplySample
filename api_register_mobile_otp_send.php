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

$REQUEST_METHOD = $_SERVER["REQUEST_METHOD"];
$result = "";

$fixedInterval = "24 HOUR";
$maxLimitForDay = "3";

if ($REQUEST_METHOD == "POST") {
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

        // Generate a 6-digit random OTP for mobile
        $registration_code = random_int(100000, 999999);

         // Condition 1: Check if mobile number is empty
         if (empty($mobile_number)) {
            $result[] = [
                "message" => "Mobile number cannot be empty.",
                "status" => "fail",
                'statusCode' => 400
            ];
        } else {
            // Condition 2: Check if mobile number already exists in the database
            $sql_exist = "SELECT * FROM users WHERE mobile_number = ?";
            $stmt_exist = $pdo->prepare($sql_exist);
            $stmt_exist->execute([$mobile_number]);
            $isPresentMobile = $stmt_exist->fetch(PDO::FETCH_ASSOC);

            if ($isPresentMobile) {
                $result[] = [
                    "message" => "This mobile number already exists. Please use a fresh mobile number.",
                    "status" => "fail",
                    'statusCode' => 422
                ];
                
                // Return the result as JSON
                echo json_encode($result);
                exit();

            }

            try {                
                // Check if the mobile number already exists
                $sql_check = "SELECT * FROM user_vs_registration_code WHERE mobile_number = ?  and added_on >= NOW() - INTERVAL ".$fixedInterval." ORDER BY added_on DESC";
                $stmt_check = $pdo->prepare($sql_check);
                $stmt_check->execute([$mobile_number]);
                $entries = $stmt_check->fetchAll(PDO::FETCH_ASSOC);

                // Check if OTP resend is allowed (after 1 minute)
                $allowResend = true;
                if (count($entries) > 0) {
                    $lastEntry = $entries[0];
                    $lastAddedTime = strtotime($lastEntry['added_on']);
                    if ((time() - $lastAddedTime) < 60) {
                        $allowResend = false;
                        $result[] = [
                            "message" => "Please wait 1 minute before requesting another OTP.",
                            "status" => "fail",
                            'statusCode' => 429
                        ];
                    } else if (count($entries) >= $maxLimitForDay) { // Check if the user has exceeded 3 attempts

                        $firstEntry = $entries[count($entries) - 1];
                        // $firstAttemptTime = strtotime($firstEntry['added_on']);
                        
                        // $db_expired_time = 10800; // In Seconds
                        // if ((time() - $firstAttemptTime) < $db_expired_time) // 3-hour cooldown
                        // { 
                            $result[] = [
                                "message" => "You have exceeded the maximum attempts. Please try again after some time.",
                                "status" => "fail",
                                'statusCode' => 429
                            ];
                        // }
                    } else {
                        // Insert a new record with the mobile number and OTP
                        $sql_insert = "INSERT INTO user_vs_registration_code (mobile_number, registration_code, added_on) VALUES (?, ?, NOW())";
                        $stmt_insert = $pdo->prepare($sql_insert);
                        $stmt_insert->execute([$mobile_number, $registration_code]);

                        $result[] = [
                            "message" => "OTP generated successfully.",
                            "mobile_number" => $mobile_number,
                            // "registration_code" => $registration_code,
                            "status" => "success",
                            'statusCode' => 201
                        ];
                    }
                } else {
                    // Insert a new record with the mobile number and OTP
                    $sql_insert = "INSERT INTO user_vs_registration_code (mobile_number, registration_code) VALUES (?, ?)";
                    $stmt_insert = $pdo->prepare($sql_insert);
                    $stmt_insert->execute([$mobile_number, $registration_code]);

                    $result[] = [
                        "message" => "OTP generated successfully.",
                        "mobile_number" => $mobile_number,
                        // "registration_code" => $registration_code,
                        "status" => "success",
                        'statusCode' => 201
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
    }
    
} else {
    echo json_encode([
        'message' => 'Invalid request method',
        'status' => false,
        'statusCode' => 405
    ]);
    exit();
}

// Return the result as JSON
echo json_encode($result);
exit();