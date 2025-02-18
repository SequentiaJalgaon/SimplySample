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


// $_POST['products'] = [
//     [
//         'product_id' => 1,
//         'quantity' => 2
//     ],
//     [
//         'product_id' => 3,
//         'quantity' => 1
//     ],
//     [
//         'product_id' => 5,
//         'quantity' => 4
//     ]
// ];
// $product_info = array();
// if(isset($_POST['products'])) {
    
//     $products = ($_POST['products']);
    
//     if(is_array($products)) {
        
//         foreach($products as $product) {
//             $productArray = array();
//             if(isset($product['product_id']) && $product['product_id'] > 0) {
//                 // array_push($productArray, $product['product_id']);
//                 $productArray["product_id"] = $product['product_id'];
//             }
//             if(isset($product['quantity']) && $product['quantity'] > 0 ) {
//                 // array_push($productArray, $product['quantity']);
//                 $productArray["quantity"] = $product['quantity'];
//             }
//             if(!empty($productArray)) array_push($product_info, $productArray);
//         }
//     }
// }

// var_dump($product_info); exit();

if($REQUEST_METHOD == "GET") {

    include("dist/conf/db.php");
    $pdo = Database::connect();
   
}

else if($REQUEST_METHOD == "POST") {

    $_POST = json_decode(file_get_contents('php://input'), true);

    if($_POST != null) {
        $_POST = $_POST["orderData"];
    }

    $user_id = "";
    $address_id = "";
    $amount_shipping = 0.00;
    $amount_gst = 0.00;
    $amount_discount = 0.00;
    $amount_total = 0.00;
    $amount_final = 0.00;
    $products_count = 0;
    $products = array();
    $product_info = array();

    if(isset($_POST['user_id'])) {
        $user_id = $_POST['user_id'];
    }
    if(isset($_POST['address_id'])) {
        $address_id = trim($_POST['address_id']);
    }
    if(isset($_POST['amount_shipping'])) {
        $amount_shipping = trim($_POST['amount_shipping']);
    }
    if(isset($_POST['amount_gst'])) {
        $amount_gst = trim($_POST['amount_gst']);
    }
    if(isset($_POST['amount_discount'])) {
        $amount_discount = trim($_POST['amount_discount']);
    }
    if(isset($_POST['amount_total'])) {
        $amount_total = trim($_POST['amount_total']);
    }
    if(isset($_POST['amount_final'])) {
        $amount_final = trim($_POST['amount_final']);
    }
    
    if(isset($_POST['products'])) {
    
        $products = ($_POST['products']);
        
        if(is_array($products)) {
            foreach($products as $product) {
                
                // $productArray = array();
                
                // if(isset($product['product_id']) && $product['product_id'] > 0) {
                //     // array_push($productArray, $product['product_id']);
                //     $productArray["product_id"] = $product['product_id'];
                // }
                
                // if(isset($product['quantity']) && $product['quantity'] > 0 ) {
                //     // array_push($productArray, $product['quantity']);
                //     $productArray["quantity"] = $product['quantity'];
                // }

                if(
                    isset($product["product_id"]) && $product["product_id"] > 0 &&
                    isset($product["quantity"]) && $product["quantity"] > 0
                )  {
                    $productArray = ['product_id' => $product["product_id"], 'quantity' => $product["quantity"]];
                    array_push($product_info, $productArray);
                }
            }
        }
    }
    
    // {
    //     "orderData": {
    //                     "user_id": 1,
    //                     "address_id": 1,
    //                     "amount_shipping": 200.00,
    //                     "amount_gst": 6.00,
    //                     "amount_discount": 0.00,
    //                     "amount_total": 206.00,
    //                     "amount_final": 206.00,
    //                     "products": [
    //                         [
    //                             "product_id" : 1,
    //                             "quantity" : 2
    //                         ],
    //                         [
    //                             "product_id" : 3,
    //                             "quantity" : 1
    //                         ],
    //                         [
    //                             "product_id" : 5,
    //                             "quantity" : 4
    //                         ]
    //                     ]
    //             }
        
    // }

    include("dist/conf/db.php");
    $pdo = Database::connect();
    
    $isAdded = false;

    if($user_id != "") {

        $sql = "SELECT * FROM users WHERE user_id = ?";
        $q = $pdo->prepare($sql);
        $q->execute(array($user_id));
        $isUserPresent = $q->fetch(PDO::FETCH_ASSOC);
        
        if($isUserPresent) {     
            
                $sql = "SELECT * FROM user_vs_address WHERE user_id = ? and id_user_vs_address = ?";
                $q = $pdo->prepare($sql);
                $q->execute(array($user_id, $address_id));
                $isAddressPresent = $q->fetch(PDO::FETCH_ASSOC);
                
                if($isAddressPresent) { 

                    $amount_gst = 0.00;
                    $product_count = count($product_info);

                    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                    $sql = "INSERT INTO `orders`(`user_id`,`address_id`,`amount_gst`,`amount_total`,`amount_final`,`product_count`)VALUES (?,?,?,?,?,?)";
                    $q = $pdo->prepare($sql);
                    $isAdded = $q->execute(array($user_id, $address_id, $amount_gst, $amount_total, $amount_final, $product_count));

                    $order_id = $pdo->lastInsertId();
                    if($order_id > 0)
                    {
                        $productAdded = 0;

                        if(is_array($product_info)) {
                            
                            foreach($product_info as $product) {
                                
                                $amount_gst_product = 0;
                                
                                $product_id = $product["product_id"];
                                $quantity = $product["quantity"];

                                $sql = "SELECT * FROM products WHERE product_id = ? and is_active = '1'";
                                $q = $pdo->prepare($sql);
                                $q->execute(array($product_id));
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
                                        
                                        $product_weight = $productInfo["weight"];
                                        $amount_product = number_format((float)$productInfo["price"], 2, '.', '');
                                        $amount_gst_product = number_format((float)$amount_gst_product, 2, '.', '');
                                        $amount_total = number_format((float)$productInfo["price"]*(float)$quantity, 2, '.', '');
                                        $product_description = $productInfo["product_description"];
                                        $product_name = $productInfo["product_name"];
                                        $category_id = $productInfo["category_id"];
                                        $subcategory_id = $productInfo["sub_category_id"];
                                        $brand_id = $productInfo["brand_id"];
                                        $category_name = $productInfo["category_name"];
                                        $subcategory_name = $productInfo["sub_category_name"];
                                        $brand_name = $productInfo["brand_name"];

                                        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                                        $sql = "INSERT INTO `order_vs_product` (`order_id`, `product_id`, `product_weight`, `quantity`, `amount_product`, `amount_gst`, `amount_total`, `product_description`, `product_name`, `category_id`, `subcategory_id`, `brand_id`, `category_name`, `subcategory_name`, `brand_name`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
                                        $q = $pdo->prepare($sql);
                                        $isAddedProduct = $q->execute(array($order_id, $productId, $product_weight, $quantity, $amount_product, $amount_gst_product, $amount_total, $product_description, $product_name, $category_id, $subcategory_id, $brand_id, $category_name, $subcategory_name, $brand_name));
                                        if($isAddedProduct) $productAdded++;

                                    }
                                }
                            }

                            if($isAdded == true && ($productAdded == $product_count)) {
                                $result= ([
                                    "data" => "Order is placed.",
                                    "message" => $order_id,
                                    "status" => "success",
                                    'statusCode' => 200
                                ]);
                            } else {
                                $result= ([
                                    "data" => "Order is placed with different product count.",
                                    "message" => "Order-id:-".$order_id."; ProductsGiven-".$product_count."; ProductsAdded-".$productAdded,
                                    "status" => "success",
                                    'statusCode' => 200
                                ]);
                            }
                        } else {
                            $result= ([
                                "data" => "",
                                "message" => "Invalid Product Information.",
                                "status" => "fail",
                                'statusCode' => 204
                            ]);
                        }
                    } else {
                        $result= ([
                            "data" => "",
                            "message" => "Something went wrong. order is not placed.",
                            "status" => "fail",
                            'statusCode' => 204
                        ]);
                    }
                } else {
                    $result= ([
                        "data" => "Address not found",
                        "message" => $isUserPresent['first_name']." ".$isUserPresent['last_name'],
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