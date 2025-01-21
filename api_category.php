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
    $categories = array();
    $sql = "SELECT * FROM category";
    $q = $pdo->query($sql);
    foreach ($pdo->query($sql) as $row) 
    {
        $categoryElement = array (
            "CategoryID" => $row["category_id"],
            "CategoryName" => $row["category_name"],
            "CategoryImage" => $row["category_image"],
            "Active" => $row["is_active"],
            "AddedOn" => $row["added_on"]
        );

        array_push($categories, $categoryElement);
    }

    if(count($categories) > 0) {
        // echo "<pre>";
        // var_dump (($categories));
        // echo "</pre>";
        $result = array(
            'message' => $categories, 
            'status' => true,
            'statusCode' => 200
        );
    } else {
        $result = array(
            'message' => 'No Record Found', 
            'status' => false, 
            'statusCode' => 200);
    }
}

else if($REQUEST_METHOD == "POST") {
    
    $categoryTitle = "";
    $categoryImage = "";
    
    if(isset($_POST['categoryTitle'])) {
        $categoryTitle = trim($_POST['categoryTitle']);
    }

    if(isset($_POST['categoryImage'])) {
        $categoryImage = trim($_POST['categoryImage']);
    }
    
    include("dist/conf/db.php");
    $pdo = Database::connect();
    
    if($categoryTitle != "") {

        $sql = "SELECT * FROM category WHERE category_name = ?";
        $q = $pdo->prepare($sql);
        $q->execute(array($categoryTitle));
        $isPresent = $q->fetch(PDO::FETCH_ASSOC);
        
        if($isPresent == "") {        
            
            $added_on = date('Y-m-d H-i-s');
            
            $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            $sql = "INSERT INTO `category`(`category_name`,`category_image`,`added_on`,`is_active`) VALUES (?,?,?,?)";
            $q = $pdo->prepare($sql);
            $isAdded = $q->execute(array($categoryTitle, $categoryImage, $added_on, 1));
            
            if($isAdded == true){
                $result= ([
                    "message" => "Category Added successfully.",
                    "categoryTitle" => $categoryTitle,
                    "status" => "success",
                    'statusCode' => 200
                ]);
            }
            
        } else {
            $result= ([
                "message" => "Category Already Present.",
                "categoryTitle" => $categoryTitle,
                "status" => "fail",
                'statusCode' => 200
            ]);
        }
    } else {
        $result= ([
            "message" => "Category Title Cannot be Empty.",
            "categoryTitle" => $categoryTitle,
            "status" => "fail",
            'statusCode' => 200
        ]);
    }

}

else if($REQUEST_METHOD == "PUT") {
    
    $categoryTitle = "";
    $categoryId = 0;
    $isActive = 0;
    $category_image = "";

    parse_str(file_get_contents('php://input'), $_PUT);
    $_PUT = (array) json_decode(file_get_contents('php://input'));
    
    if(isset($_PUT['categoryTitle'])) {
        $categoryTitle = trim($_PUT['categoryTitle']);
    }

    if(isset($_PUT['categoryId'])) {
        $categoryId = trim($_PUT['categoryId']);
    }

    if(isset($_PUT['isActive'])) {
        $isActive = trim($_PUT['isActive']);
    }

    if(isset($_PUT['categoryImage'])) {
        $category_image = trim($_PUT['categoryImage']);
    }
    
    include("dist/conf/db.php");
    $pdo = Database::connect();
    
    if($categoryTitle != "" && $categoryId != 0) {

        $sql = "SELECT * FROM category WHERE category_id = ?";
        $q = $pdo->prepare($sql);
        $q->execute(array($categoryId));
        $isPresent = $q->fetch(PDO::FETCH_ASSOC);
        
        if($isPresent != "") {   

            $sql = "SELECT * FROM category WHERE category_name = ?";
            $q = $pdo->prepare($sql);
            $q->execute(array($categoryTitle));
            $isDuplicate = $q->fetch(PDO::FETCH_ASSOC);
            
            if(isset($isDuplicate["category_id"]) && ($isDuplicate["category_id"] == $isPresent["category_id"]))
            {
                // if( $isPresent['is_active'] != $isActive)  $isActive = $isPresent['is_active'];
                if( $category_image == "")  $category_image = $isPresent['category_image'];

                $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                $sql = "UPDATE `category` SET `is_active` = ?, category_image = ? WHERE category_id = ?";
                $q = $pdo->prepare($sql);
                $isAdded = $q->execute(array( $isActive, $category_image, $categoryId));
                
                if($isAdded == true){
                    $result= ([
                        "message" => "Category Information Updated successfully.",
                        "categoryTitle" => $categoryTitle,
                        "status" => "success",
                        'statusCode' => 200
                    ]);
                }
            } else if(!isset($isDuplicate["category_id"])) {
                if( $category_image == "")  $category_image = $isPresent['category_image'];

                $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                $sql = "UPDATE `category` SET `category_name` = ?, `is_active` = ?, category_image = ? WHERE category_id = ?";
                $q = $pdo->prepare($sql);
                $isAdded = $q->execute(array($categoryTitle , $isActive, $category_image, $categoryId));
                
                if($isAdded == true){
                    $result= ([
                        "message" => "Category Information Updated successfully.",
                        "categoryTitle" => $categoryTitle,
                        "status" => "success",
                        'statusCode' => 200
                    ]);
                }
            
            // } else if( $isPresent['is_active'] != $isActive) {
                
            //     $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            //     $sql = "UPDATE `category` SET `is_active` =? WHERE category_id = ?";
            //     $q = $pdo->prepare($sql);
            //     $isStatusUpdate = $q->execute(array($isActive, $categoryId));
                
            //     if($isStatusUpdate == true){
            //         $result= ([
            //             "message" => "Category Status Updated successfully.",
            //             "categoryTitle" => $categoryTitle,
            //             "status" => "success",
            //             'statusCode' => 200
            //         ]);
            //     } 

            // } else if( $isPresent['category_image'] != $category_image) {
                
            //     $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            //     $sql = "UPDATE `category` SET `category_image` =? WHERE category_id = ?";
            //     $q = $pdo->prepare($sql);
            //     $isStatusUpdate = $q->execute(array($category_image, $categoryId));
                
            //     if($isStatusUpdate == true){
            //         $result= ([
            //             "message" => "Category Image Updated successfully.",
            //             "categoryTitle" => $categoryTitle,
            //             "status" => "success",
            //             'statusCode' => 200
            //         ]);
            //     }

            } 
            else {
                $result= ([
                    "message" => "Category Title Already Exist.",
                    "categoryTitle" => $categoryTitle,
                    "status" => "fail",
                    'statusCode' => 200
                ]);
            }
        } else {
            $result= ([
                "message" => "Category Not Found.",
                "categoryTitle" => $categoryTitle,
                "status" => "fail",
                'statusCode' => 200
            ]);
        }
    } else {
        $result= ([
            "message" => "Insufficient Information.",
            "categoryTitle" => $categoryTitle,
            "status" => "fail",
            'statusCode' => 200
        ]);
    }

}

else if($REQUEST_METHOD == "DELETE") {

    parse_str(file_get_contents('php://input'), $_PUT);
    $_PUT = (array) json_decode(file_get_contents('php://input'));

    if(isset($_PUT['categoryId'])) {
        $categoryId = $_PUT['categoryId'];
    }

    include("dist/conf/db.php");
    $pdo = Database::connect();
    
    if($categoryId != "") {

        $sql = "SELECT * FROM category WHERE category_id = ?";
        $q = $pdo->prepare($sql);
        $q->execute(array($categoryId));
        $isPresent = $q->fetch(PDO::FETCH_ASSOC);
        
        if($isPresent != "") {           
            $categoryTitle = $isPresent['category_name'];
            $sql = "        SELECT c.category_id
                    FROM    category c
                    JOIN    product_mapping pm ON c.category_id = pm.category_id
                    JOIN    brand_vs_category bc ON c.category_id = bc.category_id
                    JOIN    category_vs_subcategory cs ON c.category_id = cs.category_id
                    JOIN    user_vs_category uc ON c.category_id = uc.category_id
                    WHERE   
                            c.category_id = ? AND
                            pm.is_active = '1' AND
                            bc.is_active = '1' AND
                            cs.is_active = '1' AND
                            uc.is_active = '1'
            ";
            $q = $pdo->prepare($sql);
            $q->execute(array($categoryId));
            $isMapping = $q->fetch(PDO::FETCH_ASSOC);
            if($isMapping == "") {
                

                $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                $sql = "DELETE FROM `category` WHERE `category_id` = ?";
                $q = $pdo->prepare($sql);
                $isDeleted = $q->execute([$categoryId]);
                
                if($isDeleted == true){
                    $result= ([
                        "message" => "Category Deleted successfully.",
                        "categoryTitle" => $categoryTitle,
                        "status" => "success",
                        'statusCode' => 200
                    ]);
                }
            } else {
                $result= ([
                    "message" => "Category Not Deleted. It has references.",
                    "categoryTitle" => $categoryTitle,
                    "status" => "fail",
                    'statusCode' => 200
                ]);
            }
        } else {
            $result= ([
                "message" => "Category Not Present.",
                "categoryTitle" => "",
                "status" => "fail",
                'statusCode' => 200
            ]);
        }
    } else {
        $result= ([
            "message" => "Category Cannot be Empty.",
            "categoryTitle" => "",
            "status" => "fail",
            'statusCode' => 200
        ]);
    }

}

else {
    $result = array(
        'message' => 'Requested Method is not supported', 
        'status' => false, 
        'statusCode' => 200);
}

echo json_encode($result);
exit();