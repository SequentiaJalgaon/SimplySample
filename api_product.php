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

    $products = array();

    $sqlAllProductImages = "SELECT * FROM product_images";
    $AllProductImages = $pdo->prepare($sqlAllProductImages);
    $AllProductImages->execute(array());      
    $AllProductImages = $AllProductImages->fetchAll(PDO::FETCH_ASSOC);    
    
    $sql = "SELECT 
                p.product_id, p.product_name, p.product_description, p.price, p.weight, p.is_active as productActive,
                b.brand_name,
                b.brand_id,
                c.category_name,
                c.category_id,
                sc.sub_category_name,
                sc.sub_category_id
        FROM    products p
        JOIN    product_mapping pm ON p.product_id = pm.product_id
        JOIN    brands b ON pm.brand_id = b.brand_id
        JOIN    category c ON pm.category_id = c.category_id
        JOIN    sub_category sc ON pm.sub_category_id = sc.sub_category_id
        WHERE     pm.is_active = '1'
    ";
    $q = $pdo->query($sql);
    foreach ($pdo->query($sql) as $row) 
    {
        $foundedImages = [];
        $searchKey = "product_id";
        foreach ($AllProductImages as $subarray) {
            if (array_key_exists($searchKey, $subarray)) {
                if($subarray[$searchKey] == $row["product_id"]){
                    if($subarray['is_active'] == '1') {
                        $foundedImages[] = array($subarray['file_name']); 
                    }
                }
            }
        }

        count($foundedImages) == 0 ? $foundedImages = null : "";

        $productElement = array (
            "product_id" => $row["product_id"],
            "product_name" => $row["product_name"],
            "product_description" => mb_convert_encoding($row["product_description"], 'UTF-8', 'UTF-8'),
            "price" => $row["price"],
            "weight" => $row["weight"],
            "is_active" => $row["productActive"] == '1' ? "Active" : "Deactive",

            "product_images" => $foundedImages,
            
            "brand_name" => $row["brand_name"],
            "brand_id" => $row["brand_id"],
            "category_name" => $row["category_name"],
            "category_id" => $row["category_id"],
            "sub_category_name" => $row["sub_category_name"],
            "sub_category_id" => $row["sub_category_id"],
            
            "quantity" => 100
        );

        array_push($products, $productElement);
    }

    if(count($products) > 0) {
        $result = array(
            'message' => $products, 
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
    $productInfo = json_decode(file_get_contents('php://input'), true);
    if($productInfo != null) {
        $productInfo = $productInfo["productData"];
    }
    
    $productname = $productInfo['productname'];
    $productDescription = $productInfo['productDescription'];
    $productprice = $productInfo['productprice'];
    $productweight = $productInfo['productweight'];
    $checkStock = $productInfo['checkStock'];
    $brand = $productInfo['brand'];
    $category = $productInfo['category'];
    $subcategory = $productInfo['subcategory'];
    $image = $productInfo['image'];

    include("dist/conf/db.php");
    $pdo = Database::connect();
    
    if(
        $productname != "" &&
        $productDescription != "" &&
        $productprice != "" &&
        $productweight != "" &&
        $checkStock != "" &&
        $brand != "" &&
        $category != "" &&
        $subcategory != "" &&
        $image != ""    
    ) {
            $p1isAdded = false;
            $p2isAdded = false;
            $p3isAdded = false;
            
            $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                
            // Adding product info
            $sql = "INSERT INTO `products`
                (
                `product_name`,
                `product_description`,
                `price`,
                `weight`,
                `is_active`
                )
                VALUES
                (?,?,?,?,?);
            ";
            $q = $pdo->prepare($sql);
            $p1isAdded = $q->execute(array(
                $productname,
                $productDescription,
                $productprice,
                $productweight,
                '1'
            ));
            $product_id = $pdo->LastInsertId();

            // Adding product images
            $images = explode(",", $image);
            foreach ($images as $singleImage) {
                $sql = "INSERT INTO `product_images`
                    (
                    `product_id`,
                    `file_name`,
                    `is_active`
                    )
                    VALUES
                    (?,?,?)
                ";
                $q = $pdo->prepare($sql);
                $p2isAdded = $q->execute(array($product_id,$singleImage,'1'));
            }

            // Adding new mapping
            $sql = "INSERT INTO `product_mapping`
                (
                `product_id`,
                `brand_id`,
                `category_id`,
                `sub_category_id`,
                `is_active`
                )
                VALUES
                (?,?,?,?,?);
            ";
            $q = $pdo->prepare($sql);
            $p3isAdded = $q->execute(array(
                $product_id,
                $brand,
                $category,
                $subcategory,
                '1'
            ));

            //Success Result
            if($p1isAdded == true && $p3isAdded == true){
                $result= ([
                    "message" => "Product Information Is Added successfully.",
                    "sub_categoryTitle" => $productname,
                    "status" => "success",
                    'statusCode' => 200
                ]);
            }
            
        
    } else {
        $result= ([
            "message" => "Incomplete inforamtion.",
            "sub_categoryTitle" => $productname,
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

// var_dump(json_encode($result, JSON_INVALID_UTF8_IGNORE));
echo json_encode($result, JSON_INVALID_UTF8_IGNORE);
// var_dump(json_last_error());
// echo json_encode($result);

exit();