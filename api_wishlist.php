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
$host = "http://".$_SERVER['HTTP_HOST']."/simplysample/uploads/productIamges/";

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
                        $sql = "SELECT product_id FROM user_wishlist WHERE user_id = ?";
                        $q = $pdo->prepare($sql);
                        $q->execute(array($user_id));
                        $wishlistData = $q->fetchAll(PDO::FETCH_ASSOC);
                            
                        if(count($wishlistData) > 0) {
                            
                            $productInfoMaster = array();
                            
                            foreach($wishlistData as $wishlistElement) {
                                
                                $sql = "SELECT product_id FROM products WHERE product_id = ?";
                                $q = $pdo->prepare($sql);
                                $q->execute(array($wishlistElement["product_id"]));
                                $isProductPresent = $q->fetch(PDO::FETCH_ASSOC);

                
                                if($isProductPresent) {


                                    

                                    $productId = $isProductPresent["product_id"];
                                    
                                    $sql = "SELECT 
                                                    p.product_id, p.product_name, p.product_description, p.price, p.weight, p.is_active as productActive, p.is_featured,
                                                    b.brand_name, b.brand_id,
                                                    c.category_name, c.category_id, c.category_image as categoryImage,
                                                    sc.sub_category_name, sc.sub_category_id
                                            FROM    products p
                                            JOIN    product_mapping pm ON p.product_id = pm.product_id
                                            JOIN    brands b ON pm.brand_id = b.brand_id
                                            JOIN    category c ON pm.category_id = c.category_id
                                            JOIN    sub_category sc ON pm.sub_category_id = sc.sub_category_id
                                            WHERE       pm.is_active = '1'
                                                    and p.product_id = ?
                                    ";
                                    
                                    $q = $pdo->prepare($sql);
                                    $q->execute(array($productId));
                                    $productInfo = $q->fetch(PDO::FETCH_ASSOC);
                                    
                                    if(count($productInfo) > 0) {                  
                                        $product = array (
                                            "product_id" => 0,
                                            "product_name" => "",
                                            "product_description" => "",
                                            "price" => 0,
                                            "weight" => 0,
                                            "is_active" => "Deactive",
                                            "product_images" => null,                
                                            "brand_name" => "",
                                            "brand_id" => 0,
                                            "category_name" => "",
                                            "category_image" => "",
                                            "category_id" => 0,
                                            "sub_category_name" => "",
                                            "sub_category_id" => 0,
                                            "rating_and_review" => [
                                                "rating" => 0,
                                                "customers" => 0
                                            ]
                                        );    
                                        {
                                            $sqlAllProductImages = "SELECT * FROM product_images WHERE product_id = ? and is_active = '1'";
                                            $AllProductImages = $pdo->prepare($sqlAllProductImages);
                                            $AllProductImages->execute(array($productId));      
                                            $AllProductImages = $AllProductImages->fetchAll(PDO::FETCH_ASSOC);  
                    
                                            $foundedImages = array();
                                            $searchKey = "product_id";
                                            foreach ($AllProductImages as $subarray) {
                                                if (array_key_exists($searchKey, $subarray)) {
                                                    if($subarray[$searchKey] == $productId){
                                                        if($subarray['is_active'] == '1') {
                                                            array_push($foundedImages, array($host.$subarray['file_name'])); 
                                                        }
                                                    }
                                                }
                                            }
                                            count($foundedImages) == 0 ? $foundedImages = null : "";
                                            //--------------------------------------------- Rating And Review --------------------------------------------------
                                            // for distinct user rating
                                            // $sqlrating_review = "SELECT SUM(rating) AS totalRating, COUNT(user_id) as totalCustomers FROM (
                                            // SELECT DISTINCT user_id, rating
                                            // FROM rating_review
                                            // WHERE product_id = 3
                                            // ) AS productRating";
                                            
                                            // for user ratings (multiple ratings for same product)
                                            $sqlrating_review = "SELECT SUM(rating) as totalRating,COUNT(user_id) as totalCustomers FROM rating_review WHERE product_id = ? and status = 'Approved'";
                        
                                            $rating_review = $pdo->prepare($sqlrating_review);
                                            $rating_review->execute(array($productId));      
                                            $rating_review = $rating_review->fetch(PDO::FETCH_ASSOC);
                                            $totalRating = 0;
                                            $totalCustomers  = 0;
                                            
                                            if($rating_review['totalRating'] != null && $rating_review['totalRating'] > 0 && $rating_review['totalRating'] > 0 ) {
                                                //Average rating as per users
                                                $averageRating = (float)$rating_review['totalRating']/$rating_review['totalCustomers'];
                                                
                                                //Round of to 0.5
                                                $averageRating = round($averageRating * 2) / 2;
                                                $totalRating = $averageRating;
                                                $totalCustomers = $rating_review['totalCustomers'];
                                            }
                                            //--------------------------------------------- Rating And Review --------------------------------------------------
                                            
                                                $product["product_id"] = $productInfo["product_id"];
                                                $product["product_name"] = $productInfo["product_name"];
                                                $product["product_description"] = mb_convert_encoding($productInfo["product_description"], 'UTF-8', 'UTF-8');
                                                $product["price"] = $productInfo["price"];
                                                $product["weight"] = $productInfo["weight"];
                                                $product["is_active"] = $productInfo["productActive"] == '1' ? "Active" : "Deactive";
                        
                                                $product["product_images"] = $foundedImages;
                                                
                                                $product["brand_name"] = $productInfo["brand_name"];
                                                $product["brand_id"] = $productInfo["brand_id"];
                                                $product["category_name"] = $productInfo["category_name"];
                                                $product["category_image"] = $productInfo["categoryImage"];
                                                $product["category_id"] = $productInfo["category_id"];
                                                $product["sub_category_name"] = $productInfo["sub_category_name"];
                                                $product["sub_category_id"] = $productInfo["sub_category_id"];
                                                
                                                $product["quantity"] = 100;
                                                $product["rating_and_review"]["rating"] = $totalRating; 
                                                $product["rating_and_review"]["customers"] = $totalCustomers; 
                                        }
                                            
                                        array_push($productInfoMaster, $product);
                                    }
                                }
                            }
                            
                            if(count($productInfoMaster) > 0) {
                                $result= ([
                                    "data" => $productInfoMaster,
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
    $_POST = json_decode(file_get_contents('php://input'), true);
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
                        $q->execute(array($product_id));
                        $isProductPresent = $q->fetch(PDO::FETCH_ASSOC);
                        
                        if($isProductPresent) {   
                            
                            $sql = "SELECT * FROM user_wishlist WHERE user_id = ? and product_id = ?";
                            $q = $pdo->prepare($sql);
                            $q->execute(array($user_id, $product_id));
                            $iswishlistPresent = $q->fetch(PDO::FETCH_ASSOC);
                            
                            if(!$iswishlistPresent) { 

                                $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                                $sql = "INSERT INTO `user_wishlist`(`user_id`,`product_id`) VALUES (?,?)";
                                $q = $pdo->prepare($sql);
                                $isAdded = $q->execute(array($user_id, $product_id));
                                
                                if($isAdded) {
                                    $result= ([
                                        "data" => "Item is added in wishlist.",
                                        "message" => $isProductPresent['product_name'],
                                        "status" => "success",
                                        'statusCode' => 200
                                    ]);
                                } else {
                                    $result= ([
                                        "data" => "Item couldn't be added in wishlist.",
                                        "message" => $isProductPresent['product_name'],
                                        "status" => "fail",
                                        'statusCode' => 200
                                    ]);
                                }
                            } else {
                                
                                $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                                $sql = "DELETE FROM `user_wishlist` WHERE `user_id` = ? and `product_id` = ?";
                                $q = $pdo->prepare($sql);
                                $isAdded = $q->execute(array($user_id, $product_id));
                                
                                if($isAdded) {
                                    $result= ([
                                        "data" => "Item in removed from wishlist.",
                                        "message" => $isProductPresent['product_name'],
                                        "status" => "fail",
                                        'statusCode' => 200
                                    ]);
                                } else {
                                    $result= ([
                                        "data" => "Item not found in wishlist.",
                                        "message" => $isProductPresent['product_name'],
                                        "status" => "fail",
                                        'statusCode' => 200
                                    ]);
                                }
                                
                            }
                        } else {
                            $result= ([
                                "data" => "Item Not Present.",
                                "message" => "",
                                "status" => "fail",
                                'statusCode' => 200
                            ]);
                        }
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