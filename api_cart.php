<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

$REQUEST_METHOD = $_SERVER["REQUEST_METHOD"];
$result = "";

if($REQUEST_METHOD == "GET") {

    include("dist/conf/db.php");
    $pdo = Database::connect();
    
    $user_id = "";
    $mobile_number = "";
    
    if(isset($_GET['user_id'])) {
        $user_id = trim($_GET['user_id']);
    }
    
    // if(isset($_POST['mobile_number'])) {
    //     $mobile_number = trim($_POST['mobile_number']);
    // }

    
        if($user_id != "") {

            $sql = "SELECT * FROM users WHERE user_id = ?";
            $q = $pdo->prepare($sql);
            $q->execute(array($user_id));
            $isUserPresent = $q->fetch(PDO::FETCH_ASSOC);
            
            if($isUserPresent) {     
                
                // if($isUserPresent['mobile_number'] == $mobile_number && $isUserPresent['mobile_verified'] == 1) {      
                        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                        $sql = "SELECT * FROM carts WHERE user_id = ?";
                        $q = $pdo->prepare($sql);
                        $q->execute(array($user_id));
                        $cartData = $q->fetch(PDO::FETCH_ASSOC);
                            
                        if($cartData) {
                            $result= ([
                                "data" => $cartData["cart_data"],
                                "message" => "Cart Data Present",
                                "status" => "success",
                                'statusCode' => 200
                            ]);
                        } else {
                            $result= ([
                                "data" => null,
                                "message" => "No data found",
                                "status" => "fail",
                                'statusCode' => 200
                            ]);
                        }
                // } else {
                //     $result= ([
                //         "data" => "Mobile Number is either not present or not verified.",
                //         "message" => $mobile_number,
                //         "status" => "fail",
                //         'statusCode' => 200
                //     ]);
                // }    
            } else {
                $result= ([
                    "data" => "User Not Present.",
                    "message" => "",
                    "status" => "fail",
                    'statusCode' => 200
                ]);
            }
        } else {
            $result= ([
                "data" => "User Id Cannot be Empty.",
                "message" => "",
                "status" => "fail",
                'statusCode' => 200
            ]);
        }
}

else if($REQUEST_METHOD == "POST") {
    
    $cart_data = "";
    $user_id = "";
    $type = "";
    $mobile_number = "";
    
    $_POST = json_decode(file_get_contents('php://input'), true);
    
    
    if(isset($_POST['cart_data'])) {
        $cart_data = $_POST['cart_data'];
    }
    if(isset($_POST['user_id'])) {
        $user_id = trim($_POST['user_id']);
    }
    if(isset($_POST['mobile_number'])) {
        $mobile_number = trim($_POST['mobile_number']);
    }

    
    include("dist/conf/db.php");
    $pdo = Database::connect();
   
    
    if($user_id != "") {

        $sql = "SELECT * FROM users WHERE user_id = ?";
        $q = $pdo->prepare($sql);
        $q->execute(array($user_id));
        $isUserPresent = $q->fetch(PDO::FETCH_ASSOC);
        
        if($isUserPresent) {     
            
            if($isUserPresent['mobile_number'] == $mobile_number && $isUserPresent['mobile_verified'] == 1) {      
                $sql = "SELECT * FROM carts WHERE user_id = ? and mobile_number = ?";
                $q = $pdo->prepare($sql);
                $q->execute(array($user_id, $mobile_number));
                $isCartPresent = $q->fetch(PDO::FETCH_ASSOC);
                
                if($isCartPresent == "") { 
                    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                    $sql = "INSERT INTO `carts`(`user_id`,`cart_data`,`mobile_number`) VALUES (?,?,?)";
                    $q = $pdo->prepare($sql);
                    $isAdded = $q->execute(array($user_id, $cart_data, $mobile_number));
                        
                    if($isAdded == true) {
                        $result= ([
                            "data" => "Cart is updated.",
                            "message" => $isUserPresent['first_name']." ".$isUserPresent['last_name'],
                            "status" => "success",
                            'statusCode' => 200
                        ]);
                    } else {
                        $result= ([
                            "data" => "Cart Couldn't be updated.",
                            "message" => $isUserPresent['first_name']." ".$isUserPresent['last_name'],
                            "status" => "fail",
                            'statusCode' => 200
                        ]);
                    }
                } else {
                    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                    $sql = "UPDATE `carts` SET `cart_data` = ? WHERE `user_id` =? and `mobile_number` = ?";
                    $q = $pdo->prepare($sql);
                    $isAdded = $q->execute(array($cart_data, $user_id, $mobile_number));
                        
                    if($isAdded == true) {
                        $result= ([
                            "data" => "Cart is updated.",
                            "message" => $isUserPresent['first_name']." ".$isUserPresent['last_name'],
                            "status" => "success",
                            'statusCode' => 200
                        ]);
                    } else {
                        $result= ([
                            "data" => "Cart Couldn't be updated.",
                            "message" => $isUserPresent['first_name']." ".$isUserPresent['last_name'],
                            "status" => "fail",
                            'statusCode' => 200
                        ]);
                    }
                }
            } else {
                $result= ([
                    "data" => "Mobile Number is either not present or not verified.",
                    "message" => $mobile_number,
                    "status" => "fail",
                    'statusCode' => 200
                ]);
            }    
        } else {
            $result= ([
                "data" => "User Not Present.",
                "message" => "",
                "status" => "fail",
                'statusCode' => 200
            ]);
        }
    } else {
        $result= ([
            "data" => "User Id Cannot be Empty.",
            "message" => "",
            "status" => "fail",
            'statusCode' => 200
        ]);
    }
    

}

else {
    $result = array(
        'data' => 'Requested Method is not supported', 
        'status' => false, 
        'statusCode' => 200);
}

echo json_encode($result);
exit();