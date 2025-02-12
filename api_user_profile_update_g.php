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
    if(isset($userInfo['mobile_number'])) {
        $mobile_number = trim($userInfo['mobile_number']);
    }
    if(isset($userInfo['first_name'])) {
        $first_name = trim($userInfo['first_name']);
    }
    if(isset($userInfo['last_name'])) {
        $last_name = trim($userInfo['last_name']);
    }
    if(isset($userInfo['gender'])) {
        $gender = trim($userInfo['gender']);
    }
    if(isset($userInfo['city'])) {
        $city = trim($userInfo['city']);
    }
    if(isset($userInfo['state'])) {
        $state = trim($userInfo['state']);
    }
    if(isset($userInfo['zipcode'])) {
        $zipcode = trim($userInfo['zipcode']);
    }
    if(isset($userInfo['profile_photo'])) {
        $profile_photo = trim($userInfo['profile_photo']);
    }
    
    if(isset($userInfo['categories'])) {
        $categories = $userInfo['categories'];
    }    
    
    if(count($categories) <= 0) {
        $result= ([
            "data" => "Incorrect information.",
            "title" => "",
            "status" => "fail",
            "statusCode" => 202
        ]);
        echo json_encode($result);
        exit();
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

    // Condition 2: Check if user_id is empty
    if (empty($user_id)) {
        $result= ([
            "data" => "User ID cannot be empty.",
            "title" => "",
            "status" => "fail",
            "statusCode" => 202
        ]);
        // continue;
        echo json_encode($result);
        exit();
    }

    include("dist/conf/db.php");
    $pdo = Database::connect();

    $sql = "SELECT * FROM users WHERE user_id = ? And mobile_number = ?";
    // $sql = "SELECT * FROM users WHERE mobile_number = ?";
    $q = $pdo->prepare($sql);
    $q->execute(array($user_id,$mobile_number));
    $addressFound = $q->fetch(PDO::FETCH_ASSOC);

    // print_r($addressFound);
    // exit();

    if($addressFound != false) {            
        
            if($addressFound['is_active'] == '0') {
                $result= ([
                    "data" => "This User Already Suspended",
                    "title" => "",
                    "status" => "fail",
                    "statusCode" => 202
                ]);
                echo json_encode($result);
                exit();
            } 
            else if($addressFound['is_active'] == '1') {

               // print_r($categories); exit();

                // update query for user table
                $sqlUpdate = "UPDATE users SET first_name = ?, last_name=?,  gender=?, profile_photo = ?, city = ?, state=?, pincode=? WHERE mobile_number = ? and user_id=?";
                $qUpdate = $pdo->prepare($sqlUpdate);
                $qUpdate->execute(array($first_name, $last_name, $gender, $profile_photo, $city, $state, $zipcode, $mobile_number, $user_id)); 

               // ========================Category update flow====================================================
                
               
                $categoriesString = implode(",", $categories);

                $sql = "SELECT * FROM category WHERE category_id IN ($categoriesString) ";
                $q = $pdo->prepare($sql);
                $q->execute(array());
                $categoriesFound = $q->fetchAll(PDO::FETCH_ASSOC);

                    // TO UPDATE ALL ROWS WITH ZERO FIRST FOR THAT USER
                    $sqlUpdate = "UPDATE user_vs_category SET is_active = '0' WHERE user_id = ?";
                    $qUpdate = $pdo->prepare($sqlUpdate);
                    $qUpdate->execute([$user_id]);
                    //////////////////////////////////////////////////

                    foreach($categoriesFound as $category) {

                        $sqlexistingcat = "SELECT * FROM user_vs_category WHERE user_id = '$user_id' ";
                        $q = $pdo->prepare($sqlexistingcat);
                        $q->execute(array());
                        $existingcategoriesFound = $q->fetchAll(PDO::FETCH_ASSOC);

                        if(! empty($existingcategoriesFound)) {

                        foreach($existingcategoriesFound as $categoryold) 
                        {

                            if(in_array($categoryold['category_id'], $categories)) {
                                // its existing in the user vs catgory table
                                $sqlUpdate = "UPDATE user_vs_category SET is_active = '1' WHERE user_id = ? and category_id = ?";
                                $qUpdate = $pdo->prepare($sqlUpdate);
                                $qUpdate->execute([$user_id, $categoryold['category_id']]);
                            } else {
                                $ecat  = $category['category_id'];

                                // Check if the category is already assigned
                                $sqlexistingcat = "SELECT COUNT(*) FROM user_vs_category WHERE user_id = ? AND category_id = ?";
                                $q = $pdo->prepare($sqlexistingcat);
                                $q->execute([$user_id, $ecat]);
                                $existingCategoryCount = $q->fetchColumn();

                                if ($existingCategoryCount == 0) {
                                    $sql = "INSERT INTO user_vs_category(user_id, category_id, is_active) VALUES (?, ?, ?)";
                                    $q = $pdo->prepare($sql);
                                    $isInserted = $q->execute([$user_id, $ecat, 1]);
                                }
                            }
                            
                        } 
                    } else {
                        
                        $values = [];
                        $placeholders = [];
                        foreach ($categoriesFound as $category) {
                            $placeholders[] = "(?, ?, ?)";
                            $values[] = $user_id;
                            $values[] = $category['category_id'];
                            $values[] = 1; // is_active
                        }
                        
                        $sql = "INSERT INTO user_vs_category (user_id, category_id, is_active) VALUES " . implode(", ", $placeholders);
                        $q = $pdo->prepare($sql);
                        $isInserted = $q->execute($values);
                    }

                    }
                $result= ([
                    "data" => "User and Categories have been updated successfully.",
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

