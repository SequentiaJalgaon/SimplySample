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

    if(isset($_POST['categoryTitle'])) {
        $categoryTitle = $_POST['categoryTitle'];
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
            $sql = "INSERT INTO `category`(`category_name`,`added_on`,`is_active`) VALUES (?,?,?)";
            $q = $pdo->prepare($sql);
            $isAdded = $q->execute(array($categoryTitle, $added_on, 1));
            
            if($isAdded == true){
                $result= ([
                    "message" => "Caetegory Added successfully.",
                    "categoryTitle" => $categoryTitle,
                    "status" => "success",
                    'statusCode' => 200
                ]);
            }
            
        } else {
            $result= ([
                "message" => "Caetegory Alaready Present.",
                "categoryTitle" => $categoryTitle,
                "status" => "fail",
                'statusCode' => 200
            ]);
        }
    } else {
        $result= ([
            "message" => "Caetegory Title Cannot be Empty.",
            "categoryTitle" => $categoryTitle,
            "status" => "fail",
            'statusCode' => 200
        ]);
    }

} else {
    $result = array(
        'message' => 'Requested Method is not supported', 
        'status' => false, 
        'statusCode' => 200);
}

echo json_encode($result);
// echo '
//     {
//         "data": [
//         {
//             "id": 1,
//             "cat_image": "product-1.png",
//             "categories": "Smart Phone",
//             "category_detail": "Choose from wide range of smartphones from popular brands",
//             "total_earnings": "$99129",
//             "total_products": 1947
//         },
//         {
//             "id": 2,
//             "cat_image": "product-2.png",
//             "categories": "Electronics",
//             "category_detail": "Choose from wide range of electronics from popular brands",
//             "total_earnings": "$2512.50",
//             "total_products": 7283
//         },
//         {
//             "id": 3,
//             "cat_image": "product-3.png",
//             "categories": "Clocks",
//             "category_detail": "Choose from wide range of clocks from popular brands",
//             "total_earnings": "$1612.34",
//             "total_products": 2954
//         },
//         {
//             "id": 4,
//             "cat_image": "product-4.png",
//             "categories": "Shoes",
//             "category_detail": "Explore the latest shoes from Top brands",
//             "total_earnings": "$3612.98",
//             "total_products": 4940
//         },
//         {
//             "id": 5,
//             "cat_image": "product-5.png",
//             "categories": "Accessories",
//             "category_detail": "Explore best selling accessories from Top brands",
//             "total_earnings": "$79129",
//             "total_products": 4665
//         },
//         {
//             "id": 6,
//             "cat_image": "product-6.png",
//             "categories": "Games",
//             "category_detail": "Dive into world of Virtual Reality with latest games",
//             "total_earnings": "$29129",
//             "total_products": 5764
//         },
//         {
//             "id": 7,
//             "cat_image": "product-10.png",
//             "categories": "Home Decor",
//             "category_detail": "Choose from wide range of home decor from popular brands",
//             "total_earnings": "$19120.45",
//             "total_products": 9184
//         },
//         {
//             "id": 8,
//             "cat_image": "product-16.png",
//             "categories": "Travel",
//             "category_detail": "Choose from wide range of travel accessories from popular brands",
//             "total_earnings": "$7912.99",
//             "total_products": 4186
//         },
//         {
//             "id": 9,
//             "cat_image": "product-21.png",
//             "categories": "Baby Products",
//             "category_detail": "Choose from wide range of Baby products from popular brands",
//             "total_earnings": "$7912.99",
//             "total_products": 4186
//         },
//         {
//             "id": 10,
//             "cat_image": "product-22.png",
//             "categories": "Jewellery",
//             "category_detail": "Choose from wide range of Jewellery from popular brands",
//             "total_earnings": "$7912.99",
//             "total_products": 4186
//         },
//         {
//             "id": 11,
//             "cat_image": "product-23.png",
//             "categories": "Grocery",
//             "category_detail": "Get fresh groceries delivered at your doorstep",
//             "total_earnings": "$7912.99",
//             "total_products": 4186
//         },
//         {
//             "id": 12,
//             "cat_image": "product-24.png",
//             "categories": "Clothing",
//             "category_detail": "Choose from wide range of clothing from popular brands",
//             "total_earnings": "$7912.99",
//             "total_products": 4186
//         },
//         {
//             "id": 13,
//             "cat_image": "product-25.png",
//             "categories": "Books",
//             "category_detail": "Dive into world of books from Top authors",
//             "total_earnings": "$7912.99",
//             "total_products": 4186
//         },
//         {
//             "id": 14,
//             "cat_image": "product-26.png",
//             "categories": "Beauty & Personal Care",
//             "category_detail": "Choose from wide range of beauty & personal care from popular brands",
//             "total_earnings": "$7912.99",
//             "total_products": 4186
//         }
//         ]
//     }
// ';  

exit();