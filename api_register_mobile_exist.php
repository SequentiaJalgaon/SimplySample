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
        exit();
    }

    // Loop through the array of objects
           // foreach ($postData as $data) {
           $data = $postData ;
        // Safely extract each field
        $mobile_number = isset($data['mobile_number']) ? trim($data['mobile_number']) : '';
        
        try {

            // Condition 1: Check if mobile number is empty
            if (empty($mobile_number)) {
                $result[] = [
                    "message" => "Mobile number cannot be empty.",
                    "status" => "fail",
                    'statusCode' => 400
                ];
            } else {
                //use this wuery from users table
                // $sql_existbrand = "SELECT * FROM user_vs_registration_code WHERE mobile_number = ?";
                $sql_existbrand = "SELECT * FROM users WHERE mobile_number = ?";
                $q = $pdo->prepare($sql_existbrand);
                $q->execute([$mobile_number]);
                $isPresentMobile = $q->fetch(PDO::FETCH_ASSOC);

                if (!$isPresentMobile) {

                    $result= ([
                        "message" => "Mobile number is available",
                        "mobile_number" => $mobile_number,
                        "status" => "success",
                        'statusCode' => 200
                    ]);

                } else {
                    $result[] = [
                        "message" => "Mobile number already exist",
                        "status" => "fail",
                        'statusCode' => 422
                    ];
                }
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
