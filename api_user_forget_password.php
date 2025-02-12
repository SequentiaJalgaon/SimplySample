<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

$fixedInterval = "24 HOUR";

$REQUEST_METHOD = $_SERVER["REQUEST_METHOD"];
$result = "";

$currentdDateTime = date('Y-m-d H:i:s');

if($REQUEST_METHOD == "POST") {
    
    $userInfo = json_decode(file_get_contents('php://input'), true);    
    
    // $user_id = 0;
    $password = "";

    // if(isset($userInfo['user_id'])) {
    //     $user_id = trim($userInfo['user_id']);
    // }

    if(isset($userInfo['password'])) {
        $password = trim($userInfo['password']);
    }
    
    if(isset($userInfo['mobile_number'])) {
        $mobile_number = trim($userInfo['mobile_number']);
    }
    
    if(empty($mobile_number) ) {
        $result= ([
            "data" => "Mobile number cannot be empty.",
            "title" => "",
            "status" => "fail",
            "statusCode" => 202
        ]);
        echo json_encode($result);
        exit();
    }

    // Condition 2: Check if password is empty
    if (empty($password)) {
        $result= ([
            "data" => "Password cannot be empty.",
            "title" => "",
            "status" => "fail",
            "statusCode" => 202
        ]);
        // continue;
        echo json_encode($result);
        exit();
    }

    $hashed_password = password_hash($password, PASSWORD_BCRYPT);


    include("dist/conf/db.php");
    $pdo = Database::connect();

    // $sql = "SELECT * FROM users WHERE user_id = ? And mobile_number = ?";
    $sql = "SELECT * FROM users WHERE mobile_number = ?";
    $q = $pdo->prepare($sql);
    $q->execute(array($mobile_number));
    $addressFound = $q->fetch(PDO::FETCH_ASSOC);

    if($addressFound != false) {            
        
            if($addressFound['is_active'] == '0') {
                $result= ([
                    "data" => "User Already Suspended",
                    "title" => "",
                    "status" => "fail",
                    "statusCode" => 202
                ]);
                echo json_encode($result);
                exit();
            } 

            else if($addressFound['is_active'] == '1') {

                // $user_id = $addressFound['user_id'];

                // update password query for user table
                $sqlUpdate = "UPDATE users SET password = ? WHERE mobile_number = ?";
                $qUpdate = $pdo->prepare($sqlUpdate);
                $qUpdate->execute(array($hashed_password, $mobile_number)); 

                $result= ([
                    "data" => "Password updated successfully.",
                    "title" => "",
                    "status" => "success",
                    "statusCode" => 200
                ]);
            }

            else {
                $result = array(
                    'data' => null, 
                    "title" => null,
                    'status' => false, 
                    'statusCode' => 204);
            }

    } else {
        $result= ([
            "data" => "Mobile number Not Found",
            "title" => "",
            "status" => "fail",
            "statusCode" => 202
        ]);
    }
}
else {
    $result = array(
        'data' => 'Requested Method is not supported', 
        "title" => null,
        'status' => false, 
        'statusCode' => 405);
}

if($result == null || $result == "") {
    $result = array(
        'data' => null, 
        "title" => null,
        'status' => false, 
        'statusCode' => 204);
}
echo json_encode($result);

exit();