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
    
    $user_id = 0;
    $address_type = '';
    $address_line_1 = '';
    $address_line_2 = '';
    $taluka = '';
    $city = '';
    $state = '';
    $pincode = '';
    $is_active = '';
    $business_name = '';
    // $added_on = '';
    // $categories = [];

    if(isset($userInfo['user_id'])) {
        $user_id = trim($userInfo['user_id']);
    }

    if(isset($userInfo['address_type'])) {
        $address_type = trim($userInfo['address_type']);
    }

    if(isset($userInfo['address_line_1'])) {
        $address_line_1 = trim($userInfo['address_line_1']);
    }

    if(isset($userInfo['address_line_2'])) {
        $address_line_2 = trim($userInfo['address_line_2']);
    }

    if(isset($userInfo['taluka'])) {
        $taluka = trim($userInfo['taluka']);
    }

    if(isset($userInfo['city'])) {
        $city = trim($userInfo['city']);
    }

    if(isset($userInfo['state'])) {
        $state = trim($userInfo['state']);
    }

    if(isset($userInfo['pincode'])) {
        $pincode = trim($userInfo['pincode']);
    }

    if(isset($userInfo['business_name'])) {
        $business_name = trim($userInfo['business_name']);
    }
    
    // if(isset($userInfo['categories'])) {
    //     $categories = $userInfo['categories'];
    // }    
    
    if(
        $user_id < 0  ||
        $address_line_1 == ""   ||
        $address_type == ""  ||
        $address_line_2 == ""   ||
        $taluka == ""   ||
        $city == ""   ||
        $state == ""   ||
        $pincode == ""    
    ) {
        $result= ([
            "data" => "Incorrect information.",
            "title" => "",
            "status" => "fail",
            "statusCode" => 202
        ]);
        echo json_encode($result);
        exit();
    }

    include("dist/conf/db.php");
    $pdo = Database::connect();

    $sql = "SELECT * FROM users WHERE user_id = ?";
    $q = $pdo->prepare($sql);
    $q->execute(array($user_id));
    $userFound = $q->fetch(PDO::FETCH_ASSOC);

    if($userFound != false) {            
        
            if($userFound['is_active'] == '0') {
                $result= ([
                    "data" => "User is suspended",
                    "title" => $userFound['first_name']." ".$userFound['last_name'],
                    "status" => "fail",
                    "statusCode" => 202
                ]);
                echo json_encode($result);
                exit();
            } 

            if($userFound['is_active'] == '1') {

                $user_id = $userFound['user_id'];

                $sql_insert = "INSERT INTO user_vs_address (`user_id`, `address_type`, `address_line_1`, `address_line_2`, `taluka`, `city`, `state`, `pincode`,`business_name`) VALUES (?,?,?,?,?,?,?,?,?)";
                $stmt_insert = $pdo->prepare($sql_insert);
                $stmt_insert->execute([$user_id, $address_type, $address_line_1, $address_line_2, $taluka, $city, $state, $pincode, $business_name]);
                    
                $result= ([
                    "data" => "Address is added successfuly.",
                    "title" => "",
                    "status" => "success",
                    "statusCode" => 200
                ]); 
               
            }

    } else {
        $result= ([
            "data" => "User Not Found",
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

if($result == null) {
    $result = array(
        'data' => null, 
        "title" => null,
        'status' => false, 
        'statusCode' => 204);
}
echo json_encode($result);

exit();