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
        $email = isset($data['email']) ? trim($data['email']) : '';

         // Condition 1: Check if mobile number is empty
         if (empty($email)) {
            $result[] = [
                "message" => "Email cannot be empty.",
                "status" => "fail",
                'statusCode' => 400
            ];
        }
       
        try {

            //use this query from user_vs_email table
            $sql_existemail = "SELECT * FROM user_vs_email WHERE email_id = ? and is_active = '1'";
            $q = $pdo->prepare($sql_existemail);
            $q->execute([$email]);
            $isPresentMobile = $q->fetch(PDO::FETCH_ASSOC);

            if (!$isPresentMobile) {

                $result= ([
                    "message" => "Email can be used for registeration purpose.",
                    "email" => $email,
                    "status" => "success",
                    'statusCode' => 200
                ]);

            } else {
                $result[] = [
                    "message" => "Email Id alredy registered.",
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
