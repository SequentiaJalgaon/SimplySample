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
    // $password = "";
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
    if(isset($userInfo['password'])) {
        $password = trim($userInfo['password']);
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

    // Condition 2: Check if password is empty
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

                // print_r($addressFound);
                // print_r($city);
                // print_r($state);
                // print_r($zipcode);
                // exit();

                // $user_id = $addressFound['user_id'];

                // update password query for user table
                $sqlUpdate = "UPDATE users SET first_name = ?, last_name=?, password=? , gender=?, profile_photo = ?, city = ?, state=?, pincode=? WHERE mobile_number = ? and user_id=?";
                $qUpdate = $pdo->prepare($sqlUpdate);
                $qUpdate->execute(array($first_name, $last_name, $password, $gender, $profile_photo, $city, $state, $zipcode, $mobile_number, $user_id)); 

                // insert new address against user
                // $sql_insert = "INSERT INTO user_vs_address (`user_id`, `address_line_1`, `address_line_2`, `taluka`, `city`, `state`, `pincode`) VALUES (?,?,?,?,?,?,?)";
                // $stmt_insert = $pdo->prepare($sql_insert);
                // $stmt_insert->execute([$user_id, $city, $city, $city, $city, $state, $zipcode]);
                 
                // Update address query (but no logic is developed wich address is update?)
                // $sqlUpdate = "UPDATE user_vs_address SET address_line_1 = ?, address_line_2=?, taluka=?, city=?, state=?, pincode=? WHERE user_id=? AND is_active ='1'";
                // $qUpdate = $pdo->prepare($sqlUpdate);
                // $qUpdate->execute(array($address_line_1, $address_line_2, $taluka, $city, $state, $zipcode, $user_id)); 

                // -------------Category flow-------------------------------------------------------------------
                // $sqlDelete = "DELETE FROM user_vs_category WHERE is_active = '0'";
                // $qDelete = $pdo->prepare($sqlDelete);
                // $qDelete->execute(array());
                
                // $sqlUpdate = "UPDATE user_vs_category SET is_active = '0' WHERE user_id = ?";
                // $qUpdate = $pdo->prepare($sqlUpdate);
                // $qUpdate->execute(array($user_id));     
                
                $categoriesString = implode(",", $categories);

                // $sql = "SELECT * FROM category WHERE category_id IN ($categoriesString) ORDER BY $categoriesString ";
                $sql = "SELECT category_id FROM category WHERE category_id IN ($categoriesString) ";
                $q = $pdo->prepare($sql);
                $q->execute(array());
                $requestedCategoriesFoundArray = $q->fetchAll(PDO::FETCH_ASSOC);

                $requestedCategoriesFound = [];
                foreach($requestedCategoriesFoundArray as $requestedCategoriesFoundElement) {
                    $requestedCategoriesFound[] = $requestedCategoriesFoundElement['category_id'];
                }                
                                                
                if(count($requestedCategoriesFound) > 0) {
                    
                    $sqlexistingcat = "SELECT * FROM user_vs_category WHERE user_id = '$user_id' ";
                    $q = $pdo->prepare($sqlexistingcat);
                    $q->execute(array());
                    $existingUserCategoriesArray = $q->fetchAll(PDO::FETCH_ASSOC);

                    $existingUserCategories = [];
                    foreach($existingUserCategoriesArray as $existingUserCategoriesElement) {
                        $existingUserCategories[] = $existingUserCategoriesElement['category_id'];
                    }  

                    $addCategoreis = [];
                    $markActiveCategories = [];
                    // not present actegories in the db
                    foreach($requestedCategoriesFound as $requestedCategory) {
                        if(!in_array($requestedCategory, $existingUserCategories)) {
                            $addCategoreis[] = $requestedCategory;
                        }
                    }                    

                    // mark active categories
                    foreach($requestedCategoriesFound as $requestedCategory) {
                        if(in_array($requestedCategory, $existingUserCategories)) {
                            
                            $categoryIndex = array_search($requestedCategory, $existingUserCategories);
                            $searchCategory = $existingUserCategories[$categoryIndex];

                            foreach($existingUserCategoriesArray as $existingUserCategoriesElement) {
                                if($existingUserCategoriesElement['category_id'] == $searchCategory) {
                                    // if($existingUserCategoriesElement['is_active'] == '0') {
                                        $markActiveCategories[] = $existingUserCategoriesElement['category_id'];
                                    // }
                                }
                            }
                        }
                    }
                    
                    $sqlUpdate = "UPDATE user_vs_category SET is_active = '0' WHERE user_id = ?";
                    $qUpdate = $pdo->prepare($sqlUpdate);
                    $qUpdate->execute([$user_id]);

                    foreach($markActiveCategories as $markActiveCategoryId) {
                        $sqlUpdate = "UPDATE user_vs_category SET is_active = '1' WHERE user_id = ? and category_id = ?";
                        $qUpdate = $pdo->prepare($sqlUpdate);
                        $qUpdate->execute([$user_id,$markActiveCategoryId]);
                        // $qUpdate->execute([]);
                    }

                    foreach($addCategoreis as $addCategorey) {
                        $sql = "INSERT INTO user_vs_category(user_id, category_id, is_active) VALUES (?,?,?)";
                        $q = $pdo->prepare($sql);
                        $isInserted = $q->execute([$user_id, $addCategorey,'1']);
                    }      

                    $result= ([
                        "data" => "Categories updated.",
                        "title" => "",
                        "status" => "success",
                        "statusCode" => 200
                    ]);        
                    
                } else {
                    $result= ([
                        "data" => "Category Not Found",
                        "title" => "",
                        "status" => "fail",
                        "statusCode" => 202
                    ]);
                }

                // -----
                $result= ([
                    "data" => "User Update successfully.",
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
