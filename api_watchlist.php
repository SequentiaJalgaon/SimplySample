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
    
    if(isset($_POST['user_id'])) {
        $user_id = trim($_POST['user_id']);
    }
    
    // if(isset($_POST['mobile_number'])) {
    //     $mobile_number = trim($_POST['mobile_number']);
    // }

    
    include("dist/conf/db.php");
    $pdo = Database::connect();
   
        if($user_id != "") {

            $sql = "SELECT * FROM users WHERE user_id = ?";
            $q = $pdo->prepare($sql);
            $q->execute(array($user_id));
            $isUserPresent = $q->fetch(PDO::FETCH_ASSOC);
            
            if($isUserPresent) {     
                
                // if($isUserPresent['mobile_number'] == $mobile_number && $isUserPresent['mobile_verified'] == 1) {      
                        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                        $sql = "SELECT product_id FROM user_watchlist WHERE user_id = ?";
                        $q = $pdo->prepare($sql);
                        $q->execute(array($user_id));
                        $watchlistData = $q->fetchAll(PDO::FETCH_ASSOC);
                            
                        if(count($watchlistData) > 0) {
                            $productInfo = array();
                            foreach($watchlistData as $watchlistElement) {
                                $sql = "SELECT * FROM products WHERE product_id = ?";
                                $q = $pdo->prepare($sql);
                                $q->execute(array($watchlistElement));
                                $isProductPresent = $q->fetch(PDO::FETCH_ASSOC);

                                if($isProductPresent) {
                                    array_push($productInfo, $isProductPresent);
                                }

                                if(count($productInfo) > 0) {
                                    $result= ([
                                        "data" => $productInfo,
                                        "message" => "Cart Data Present",
                                        "status" => "success",
                                        'statusCode' => 200
                                    ]);
                                } else {
                                    $result= ([
                                        "data" => null,
                                        "message" => "Items expired/removed",
                                        "status" => "success",
                                        'statusCode' => 200
                                    ]);
                                }
                            }
                            
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
                    "message" => $categoryTitle,
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
    
    $product_id = "";
    $user_id = "";
    
    if(isset($_POST['product_id'])) {
        $product_id = $_POST['product_id'];
    }

    if(isset($_POST['user_id'])) {
        $user_id = trim($_POST['user_id']);
    }
    
    // if(isset($_POST['action'])) {
    //     $action = trim($_POST['action']);
    // }

    
    include("dist/conf/db.php");
    $pdo = Database::connect();
   
    // if($action != "" && ($action == "add" || $action == "remove")){
    
            if($user_id != "") {

                $sql = "SELECT * FROM users WHERE user_id = ?";
                $q = $pdo->prepare($sql);
                $q->execute(array($user_id));
                $isUserPresent = $q->fetch(PDO::FETCH_ASSOC);
                
                if($isUserPresent) {     
                    
                    if($product_id != "") {

                        $sql = "SELECT * FROM products WHERE product_id = ?";
                        $q = $pdo->prepare($sql);
                        $q->execute(array($user_id));
                        $isProductPresent = $q->fetch(PDO::FETCH_ASSOC);

                        if($isProductPresent) {   
                            
                            $sql = "SELECT * FROM user_watchlist WHERE user_id = ? and product_id = ?";
                            $q = $pdo->prepare($sql);
                            $q->execute(array($user_id, $product_id));
                            $iswatchlistPresent = $q->fetch(PDO::FETCH_ASSOC);
                        
                            if($iswatchlistPresent == "") { 

                                $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                                $sql = "INSERT INTO `user_watchlist`(`user_id`,`product_id`) VALUES (?,?)";
                                $q = $pdo->prepare($sql);
                                $isAdded = $q->execute(array($user_id, $product_id));
                                    
                                if($isAdded == true) {
                                    $result= ([
                                        "data" => "Item is added in watchlist.",
                                        "message" => $isUserPresent['first_name']." ".$isUserPresent['last_name'],
                                        "status" => "success",
                                        'statusCode' => 200
                                    ]);
                                } else {
                                    $result= ([
                                        "data" => "Item couldn't be added in watchlist.",
                                        "message" => $isUserPresent['first_name']." ".$isUserPresent['last_name'],
                                        "status" => "fail",
                                        'statusCode' => 200
                                    ]);
                                }
                            } else {
                                
                                $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                                $sql = "DELETE FROM `user_watchlist` WHERE `user_id` = ? and `product_id` = ?";
                                $q = $pdo->prepare($sql);
                                $isAdded = $q->execute(array($user_id, $product_id));
                                
                                if($isAdded == true) {
                                    $result= ([
                                        "data" => "Item in removed from watchlist.",
                                        "message" => $isProductPresent['product_name'],
                                        "status" => "fail",
                                        'statusCode' => 200
                                    ]);
                                } else {
                                    $result= ([
                                        "data" => "Item not found in watchlist.",
                                        "message" => $isProductPresent['product_name'],
                                        "status" => "fail",
                                        'statusCode' => 200
                                    ]);
                                }
                                
                            }
                        }  $result= ([
                            "data" => "Item Not Present.",
                            "message" => "",
                            "status" => "fail",
                            'statusCode' => 200
                        ]);
                        
                    } else {
                        $result= ([
                            "data" => "Product Not Present.",
                            "message" => "",
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
            
    // } else {
    //     $result= ([
    //         "data" => "Invalid Action",
    //         "message" => "",
    //         "status" => "fail",
    //         'statusCode' => 200
    //     ]);
    // }

}

else {
    $result = array(
        'data' => 'Requested Method is not supported', 
        'status' => false, 
        'statusCode' => 200);
}

echo json_encode($result);
exit();