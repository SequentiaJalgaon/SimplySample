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
    $categories = [];

    if(isset($userInfo['user_id'])) {
        $user_id = trim($userInfo['user_id']);
    }
    
    if(isset($userInfo['categories'])) {
        $categories = $userInfo['categories'];
    }    
    
    if($user_id < 0 || count($categories) <= 0) {
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

                $sqlDelete = "DELETE FROM user_vs_category WHERE is_active = '0'";
                $qDelete = $pdo->prepare($sqlDelete);
                $qDelete->execute(array());
                
                $sqlUpdate = "UPDATE user_vs_category SET is_active = '0' WHERE user_id = ?";
                $qUpdate = $pdo->prepare($sqlUpdate);
                $qUpdate->execute(array($user_id));                    
                
                $categoriesString = implode(",", $categories);
                
                $sql = "SELECT * FROM category WHERE category_id IN ($categoriesString) ORDER BY category_id";
                $q = $pdo->prepare($sql);
                $q->execute(array());
                $categoriesFound = $q->fetchAll(PDO::FETCH_ASSOC);
                                                
                if(count($categoriesFound) > 0) {
                    
                    foreach($categoriesFound as $category) {
                        $sql = "INSERT INTO user_vs_category(user_id, category_id) VALUES (?,?)";
                        $q = $pdo->prepare($sql);
                        $isInserted = $q->execute([$user_id, $category['category_id']]);
                    }
                        
                    $result= ([
                        "data" => "Categories updated.",
                        "title" => $userFound['first_name']." ".$userFound['last_name'],
                        "status" => "success",
                        "statusCode" => 200
                    ]);        
                    
                } else {
                    $result= ([
                        "data" => "Category Not Found",
                        "title" => $userFound['first_name']." ".$userFound['last_name'],
                        "status" => "fail",
                        "statusCode" => 202
                    ]);
                }
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