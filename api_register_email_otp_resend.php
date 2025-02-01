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

        $email = isset($data['email']) ? trim($data['email']) : '';
        $user_id = isset($data['user_id']) ? ($data['user_id']) : 0;
        $mobile_number = isset($data['mobile_number']) ? trim($data['mobile_number']) : '';
        
        $whereCondition = "";
        $valueToCheck = "";

        if (!empty($user_id) || $user_id > 0) {

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

            $whereCondition .= "user_id = ?";
            $valueToCheck .= $user_id;
        } elseif (!empty($mobile_number)) {

            $sql_existMobile = "SELECT * FROM users WHERE mobile_number = ?";
            $q = $pdo->prepare($sql_existMobile);
            $q->execute([$mobile_number]);
            $isPresentUser = $q->fetch(PDO::FETCH_ASSOC);

            if(!$isPresentUser) {
                $result[] = [
                    "message" => "Mobile number does not exist",
                    "status" => "fail",
                    'statusCode' => 422
                ];
                echo json_encode($result);
                exit();
            }

            $whereCondition .= "mobile_number = ?";
            if($valueToCheck != "") 
                $valueToCheck .= ", ".$mobile_number;
            else
            $valueToCheck .= $mobile_number;
        } else {
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
        $isPresentEmail = $stmt_exist->fetch(PDO::FETCH_ASSOC);

        if ($isPresentEmail) {
            $result[] = [
                "message" => "This Email already exists. Please use a fresh email.",
                "status" => "fail",
                'statusCode' => 422
            ];
            
            echo json_encode($result);
            exit();
        }

        $verification_code = random_int(100000, 999999);

        try {
            // Check for daily block condition
            // $sql_daily_check = "SELECT COUNT(*) as daily_attempts FROM user_vs_verification_code 
            //                     WHERE email = ? AND added_on >= NOW() - INTERVAL ".$fixedInterval." ORDER BY added_on DESC";
            // $stmt_daily_check = $pdo->prepare($sql_daily_check);
            // $stmt_daily_check->execute([$email]);
            // $daily_attempts = $stmt_daily_check->fetch(PDO::FETCH_ASSOC);

            // // print_r($sql_daily_check);
            // // print_r($daily_attempts);
            // // exit();

            // if ($daily_attempts['daily_attempts'] >= $maxLimitForDay) { // 3 patterns (each with 3 resend attempts)
            //     $result[] = [
            //         "message" => "You have exceeded the maximum OTP requests for today. Please try again after some time.",
            //         "status" => "fail",
            //         'statusCode' => 429
            //     ];
                
            // }

            // Check for the last 3 resend attempts
            $sql_check = "SELECT * FROM user_vs_verification_code WHERE email = ? and $whereCondition AND added_on >= NOW() - INTERVAL ".$fixedInterval." ORDER BY added_on DESC";
            $stmt_check = $pdo->prepare($sql_check);
            $stmt_check->execute([$email, $valueToCheck]);
            $entries = $stmt_check->fetchAll(PDO::FETCH_ASSOC);

            if (count($entries) > 0) {
                $lastEntry = $entries[0];
                $lastAddedTime = strtotime($lastEntry['added_on']);

                if (time() - $lastAddedTime < 60) { // Block resend within 1 minute
                    $result[] = [
                        "message" => "Please wait 1 minute before requesting another OTP.",
                        "status" => "fail",
                        'statusCode' => 429
                    ];
                    
                } else 
                // if (count($entries) >= $maxLimitForDay) { // Check if the user has exceeded 3 resend attempts in the current pattern
                //     // $firstEntry = $entries[count($entries)-1];
                //     // $firstAttemptTime = strtotime($firstEntry['added_on']);
                //     // if ((time() - $firstAttemptTime) < 3600) { // Cooldown for 1 hour (or adjust as needed)
                //         $result[] = [
                //             "message" => "You have exceeded the maximum attempts. Please wait for some time before retrying.",
                //             "status" => "fail",
                //             'statusCode' => 429
                //         ];
                //     // }
                // } else
                {
                    // Insert new OTP record
                    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                    $sql_insert = "INSERT INTO user_vs_verification_code(email, verification_code, user_id, mobile_number, is_resend)
                                VALUES (?,?,?,?,?)";
                    $stmt_insert = $pdo->prepare($sql_insert);
                    $stmt_insert->execute([$email, $verification_code, $user_id, $mobile_number, 1]);

                    $result[] = [
                        "message" => "OTP generated successfully.",
                        "email" => $email,
                        // "verification_code" => $verification_code,
                        "status" => "success",
                        'statusCode' => 201
                    ];
                }
            } else {
                 // Insert new OTP record
                 $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                 $sql_insert = "INSERT INTO user_vs_verification_code(email, verification_code, user_id, mobile_number, is_resend)
                             VALUES (?,?,?,?,?)";
                 $stmt_insert = $pdo->prepare($sql_insert);
                 $stmt_insert->execute([$email, $verification_code, $user_id, $mobile_number, 1]);

                 $result[] = [
                     "message" => "OTP generated successfully.",
                     "email" => $email,
                    //  "verification_code" => $verification_code,
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
    // }

} else {
    echo json_encode([
        'message' => 'Invalid request method',
        'status' => false,
        'statusCode' => 405
    ]);
}

echo json_encode($result);
exit();