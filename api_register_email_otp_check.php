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
        echo json_encode($result);
        exit();
    }

    // Loop through the array of objects
           // foreach ($postData as $data) {
           $data = $postData ;
        // Safely extract each field
        $email = isset($data['email']) ? trim($data['email']) : '';
        $registration_code = isset($data['registration_code']) ? trim($data['registration_code']) : '';
        $user_id = isset($data['user_id']) ? (int)($data['user_id']) : '';

        // Condition 1: Check if mobile number is empty
        if (empty($email)) {
            $result[] = [
                "message" => "Email ID cannot be empty.",
                "status" => "fail",
                'statusCode' => 400
            ];
            echo json_encode($result);
            exit();
        }

         // Condition 1: Check if OTP is empty
         if (empty($registration_code)) {
            $result[] = [
                "message" => "OTP cannot be empty.",
                "status" => "fail",
                'statusCode' => 400
            ];
            echo json_encode($result);
            exit();
        }

        
         // Condition 1: Check if UserID is empty
         if (empty($user_id) || ($user_id) <= 0) {
            $result[] = [
                "message" => "User info needed.",
                "status" => "fail",
                'statusCode' => 400
            ];
            echo json_encode($result);
            exit();
        }



       
        try {

            $sql_existUser = "SELECT * FROM users WHERE user_id = ? AND verification_code = ?";
            $q = $pdo->prepare($sql_existUser);
            $q->execute([$email,$registration_code]);
            $isPresentUser = $q->fetch(PDO::FETCH_ASSOC);

            if($isPresentUser) {
                
                $user_id = $isPresentUser['user_id'];

                $sql_existUser = "SELECT * FROM user_vs_verification_code WHERE email = ? AND verification_code = ?";
                $q = $pdo->prepare($sql_existUser);
                $q->execute([$email,$registration_code]);
                $isPresentMobile = $q->fetch(PDO::FETCH_ASSOC);

                if ($isPresentMobile) {

                    $otpExpired = true;
                    $optmaxtime = date('Y-m-d H:i:s', strtotime( "+".$otpExpiryTime, strtotime($isPresentMobile['added_on']))); 
                    if ($optmaxtime >= $currentdDateTime) $otpExpired = false;
                    if(!$otpExpired) {
                        $sql_existUser = "SELECT * FROM user_vs_email WHERE email_id = ? and is_actvie = '1'";
                        $q = $pdo->prepare($sql_existUser);
                        $q->execute([$email]);
                        $isPresentUser = $q->fetch(PDO::FETCH_ASSOC);
            
                        if (!$isPresentUser) {

                            $sql_insert = "INSERT INTO user_vs_email (email_id, user_id, is_active) VALUES (?,?,?)";
                            $stmt_insert = $pdo->prepare($sql_insert);
                            $stmt_insert->execute([$email, $user_id,'1']);
                            $userId = $pdo->lastInsertId();
                            $result= ([
                                "message" => "OTP matched successfully",
                                "userId" => $userId,
                                "status" => "success",
                                'statusCode' => 200
                            ]);
                        } else {
                            $result[] = [
                                "message" => "Email already registered.",
                                "status" => "fail",
                                'statusCode' => 200
                            ];
                        }
                    } else {
                        $result[] = [
                            "message" => "OTP is expired.",
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
            } else {
                $result[] = [
                    "message" => "User info not found.",
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
