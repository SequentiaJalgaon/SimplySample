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

$fixedInterval = "24 HOUR";
$maxLimitForDay = "3";

$REQUEST_METHOD = $_SERVER["REQUEST_METHOD"];
$result = "";

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

           // foreach ($postData as $data) {
           $data = $postData ;
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

            try {
                // Check OTP resend attempts within the day
                // $sql_check_day = "SELECT COUNT(*) AS attempts_today, MAX(added_on) AS last_attempt_time FROM user_vs_registration_code WHERE mobile_number = ? AND DATE(added_on) = CURDATE()";
                
                $sql_check_day = "SELECT COUNT(*) AS attempts_today, MAX(added_on) AS last_attempt_time FROM user_vs_registration_code WHERE mobile_number = ? AND added_on >= NOW() - INTERVAL ".$fixedInterval." ORDER BY added_on DESC";
                $stmt_check_day = $pdo->prepare($sql_check_day);
                $stmt_check_day->execute([$mobile_number]);
                $day_data = $stmt_check_day->fetch(PDO::FETCH_ASSOC);

                $attempts_today = $day_data['attempts_today'];
                $last_attempt_time = strtotime($day_data['last_attempt_time']);

                // 3 sessions with 3 OTPs each = 9 attempts - Not Valid (Updated By Niranjan)
                // If the user has already used 3 sessions today - Valid (Updated By Niranjan)
                if ($attempts_today >= $maxLimitForDay) { 
                    $result[] = [
                        // "message" => "You have exceeded the maximum OTP attempts for today. Please try again after some time.",
                        "message" => "Please try again after some time.",
                        "status" => "fail",
                        'statusCode' => 429
                    ];

                    // Check OTP resend attempts within the last session (last 3 attempts)
                    // $sql_check_session = "SELECT * FROM user_vs_registration_code WHERE mobile_number = ? AND added_on >= NOW() - INTERVAL ".$fixedInterval." ORDER BY added_on DESC";
                    // $stmt_check_session = $pdo->prepare($sql_check_session);
                    // $stmt_check_session->execute([$mobile_number]);
                    // $session_entries = $stmt_check_session->fetchAll(PDO::FETCH_ASSOC);
                    
                // } else if (count($session_entries) >= $maxLimitForDay) {
                //     {
                //         // $first_entry_time = strtotime($session_entries[count($session_entries)-1]['added_on']);

                //         // Block the user for X minutes (e.g., 10 minutes) after 3 OTPs in the current session
                //         // if (time() - $first_entry_time < 60) { // 600 seconds = 10 minutes
                //             $result[] = [
                //                 // "message" => "You have reached the maximum OTP resend attempts for this session. Please wait 10 minutes.",
                //                 "message" => "Please try again after some time",
                //                 "status" => "fail",
                //                 'statusCode' => 429
                //             ];
                            
                //         // }
                //     }
                } else {
                    // Insert a new record with the mobile number and OTP
                    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                    $sql_insert = "INSERT INTO user_vs_registration_code (mobile_number, registration_code, is_resend) VALUES (?, ?, ?)";
                    $stmt_insert = $pdo->prepare($sql_insert);
                    $stmt_insert->execute([$mobile_number, $registration_code, '1']);

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
            }

        }

    // Return the result as JSON
    echo json_encode($result);
    exit();

} else {
    echo json_encode([
        'message' => 'Invalid request method',
        'status' => false,
        'statusCode' => 405
    ]);
    exit();
}
