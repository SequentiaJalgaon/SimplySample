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
$result = "";

$REQUEST_METHOD = $_SERVER["REQUEST_METHOD"];

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
        $email = isset($data['email']) ? trim($data['email']) : '';
        $user_id = isset($data['user_id']) ? ($data['user_id']) : 0;
        $mobile_number = isset($data['mobile_number']) ? trim($data['mobile_number']) : '';

        if(empty($mobile_number)) {
            $result[] = [
                "message" => "Mobile Number cannot be empty.",
                "status" => "fail",
                'statusCode' => 400
            ];
            echo json_encode($result);
            exit();
        }

        
        $whereCondition = "";
        $valueToCheck = "";
        // Check which value is provided from frontend
        if (!empty($user_id) || $user_id > 0 ) {
            
            $sql_existuser = "SELECT * FROM users WHERE user_id = ?";
            $q = $pdo->prepare($sql_existuser);
            $q->execute([$user_id]);
            $isPresentUser = $q->fetch(PDO::FETCH_ASSOC);

            if(!$isPresentUser) {
                $result[] = [
                    "message" => "User does not exist",
                    "status" => "fail",
                    'statusCode' => 422
                ];
                echo json_encode($result);
                exit();
            }

            // User ID is provided
            $whereCondition .= "and user_id = $user_id ";
            $valueToCheck .= $user_id;
        } 
        
        if (!empty($mobile_number)) {
            
            $sql_existMobile = "SELECT * FROM users WHERE mobile_number = ? AND user_id =?";
            $q = $pdo->prepare($sql_existMobile);
            $q->execute([$mobile_number, $user_id]);
            $isPresentUser = $q->fetch(PDO::FETCH_ASSOC);

            if(!$isPresentUser) {
                $result[] = [
                    "message" => "Mobile number / User ID does not exist",
                    "status" => "fail",
                    'statusCode' => 422
                ];
                echo json_encode($result);
                exit();
            }
            
            $user_id = $isPresentUser['user_id'];
            
            // Mobile Number is provided
            $whereCondition .= "and mobile_number = '$mobile_number'";
            if($valueToCheck != "") 
                $valueToCheck .= ", ".$mobile_number;
            else
            $valueToCheck .= $mobile_number;
        } 
        
        if((empty($user_id) || $user_id <= 0) && empty($mobile_number)) {
            // Neither user_id nor mobile_number is provided
            $result[] = [
                "message" => "Please provide either User ID or Mobile Number.",
                "status" => "fail",
                'statusCode' => 400
            ];
            echo json_encode($result);
            exit();
        }

        // print_r($whereCondition);
        // print_r($valueToCheck);
        // exit();

         // Condition 1: Check if email is empty
         if (empty($email)) {
            $result[] = [
                "message" => "Email cannot be empty.",
                "status" => "fail",
                'statusCode' => 400
            ];
            echo json_encode($result);
            exit();
        }

        // Condition 2: Check if email already exists in the database
        $sql_exist = "SELECT * FROM user_vs_email WHERE email_id = ? and is_active = '1'";
        $stmt_exist = $pdo->prepare($sql_exist);
        $stmt_exist->execute([$email]);
        $isPresentMobile = $stmt_exist->fetch(PDO::FETCH_ASSOC);

        if ($isPresentMobile) {
            $result[] = [
                "message" => "This Email already exists. Please use a another email.",
                "status" => "fail",
                'statusCode' => 422
            ];
            
            // Return the result as JSON
            echo json_encode($result);
            exit();
            
        }
        
        // print_r($verification_code);
        // exit();

        // Generate a 6-digit random OTP for mobile
        $verification_code = random_int(100000, 999999);

        try {
            
            // Check if the mobile number already exists
            // $sql_check = "SELECT * FROM user_vs_verification_code WHERE email = ? ORDER BY added_on DESC LIMIT 3";
            $sql_check = "SELECT * FROM user_vs_verification_code WHERE email = '$email' $whereCondition  and added_on >= NOW() - INTERVAL ".$fixedInterval." ORDER BY added_on DESC";
            $stmt_check = $pdo->prepare($sql_check);
            $stmt_check->execute([]);
            $entries = $stmt_check->fetchAll(PDO::FETCH_ASSOC);
            // Check if OTP resend is allowed (after 1 minute)
            $allowResend = true;

            if (count($entries) >= 0) {
                
                $lastAddedTime = null;
                if(isset($entries[0]['added_on'])) {
                    $lastAddedTime = strtotime($entries[0]['added_on']);
                }
                if ( !is_null($lastAddedTime) && (time() - $lastAddedTime) < 60) {
                    $allowResend = false;
                    // print_r($lastAddedTime);
                    // exit();
                    $result[] = [
                        "message" => "Please wait 1 minute before requesting another OTP.",
                        "status" => "fail",
                        'statusCode' => 429
                    ];
                    
                } else {
                    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                    $sql = "INSERT INTO user_vs_verification_code (email, verification_code, user_id, mobile_number ) VALUES (?,?,?,?)";
                    $q = $pdo->prepare($sql);
                    $isInserted = $q->execute([$email, $verification_code, $user_id , $mobile_number]);
        
                    $result[] = [
                        "message" => "OTP generated successfully.",
                        "email" => $email,
                        // "verification_code" => $verification_code,
                        "status" => "success",
                        'statusCode' => 201
                    ];
        
                }
                // else if (count($entries) >= $maxLimitForDay) { // Check if the user has exceeded 3 attempts

                //     $firstEntry = $entries[count($entries) - 1];
                //     // $firstAttemptTime = strtotime($firstEntry['added_on']);
                    
                //     // $db_expired_time = 10800; // In Seconds
                //     // if ((time() - $firstAttemptTime) < $db_expired_time) // 3-hour cooldown
                //     // { 
                //         $result[] = [
                //             "message" => "You have exceeded the maximum attempts. Please try again after some time.",
                //             "status" => "fail",
                //             'statusCode' => 429
                //         ];
                //     // }
                // }
            }

            // Check if the user has exceeded 3 attempts
            // if (count($entries) >= 3) {
            //     $firstEntry = $entries[count($entries)-1];
                
            //     $firstAttemptTime = strtotime($firstEntry['added_on']);
            //     // if (time() - $firstAttemptTime < 3600) { // 1-hour cooldown
            //     if (time() - $firstAttemptTime < $db_expired_time) // 3-hour cooldown
            //     { 
            //         // print_r('hiii');
            //         // print_r($firstAttemptTime);
            //         // exit();

            //         $result[] = [
            //             "message" => "You have exceeded the maximum attempts. Please try again after 3 hours.",
            //             "status" => "fail",
            //             'statusCode' => 429
            //         ];
                    
            //     }
            // }

            // print_r($entries);
            // exit();
            // Insert into DB
            
            // print_r($sql);
            // print_r($isInserted);
            // exit();

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

    
} else {
    echo json_encode([
        'message' => 'Invalid request method',
        'status' => false,
        'statusCode' => 405
    ]);
    
}

    // Return the result as JSON
    echo json_encode($result);
    exit();