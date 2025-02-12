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
    $address_id = 0;

    if(isset($userInfo['user_id'])) {
        $user_id = (int)($userInfo['user_id']);
    }
    
    if(isset($userInfo['address_id'])) {
        $address_id = (int)($userInfo['address_id']);
    }
    
    if($user_id < 0 && $address_id < 0) {
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

    // $sql = "SELECT * FROM user_vs_address WHERE id_user_vs_address = ?";
    $sql = "SELECT * FROM user_vs_address WHERE id_user_vs_address = ? and user_id = ?";
    $q = $pdo->prepare($sql);
    $q->execute(array($address_id, $user_id));
    $addressFound = $q->fetch(PDO::FETCH_ASSOC);

    if($addressFound != false) {            
        
            if($addressFound['is_active'] == '0') {
                $result= ([
                    "data" => "Address Not Found OR Already Suspended",
                    "title" => "",
                    "status" => "fail",
                    "statusCode" => 202
                ]);
                echo json_encode($result);
                exit();
            } 

            else if($addressFound['is_active'] == '1') {

                $user_id = $addressFound['user_id'];

                // print_r($user_id);
                // exit();

                $sql = "SELECT * FROM users WHERE user_id = ?";
                $q = $pdo->prepare($sql);
                $q->execute(array($address_id));
                $userDetails = $q->fetch(PDO::FETCH_ASSOC);

                // print_r($userDetails);
                // exit();
            
                if($userDetails != false) {            
                    
                        if($userDetails['is_active'] == '0') {
                            $result= ([
                                "data" => "User is suspended",
                                "title" => "",
                                "status" => "fail",
                                "statusCode" => 202
                            ]);
                            echo json_encode($result);
                            exit();
                        } 

                        if($userDetails['is_active'] == '1') {
                            $sqlUpdate = "UPDATE user_vs_address SET is_active = '0' WHERE id_user_vs_address = ?";
                            $qUpdate = $pdo->prepare($sqlUpdate);
                            $qUpdate->execute(array($address_id));         
                                
                            $result= ([
                                "data" => "Addrees is suspended successfuly.",
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
                    'data' => null, 
                    "title" => null,
                    'status' => false, 
                    'statusCode' => 204);
            }

    } else {
        $result= ([
            "data" => "Address Not Found",
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