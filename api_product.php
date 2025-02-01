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

        if(isset($_GET["productId"]) && $_GET["productId"] > 0 && isset($_GET["brand_id"]) && $_GET["brand_id"] > 0)
        {
            $brand_id = $_GET["brand_id"];
            $products = array();

            $sqlAllProductImages = "SELECT * FROM product_images";
            $AllProductImages = $pdo->prepare($sqlAllProductImages);
            $AllProductImages->execute(array());      
            $AllProductImages = $AllProductImages->fetchAll(PDO::FETCH_ASSOC);    
            
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
                WHERE     pm.is_active = '1'
                    and   p.brand_id = $brand_id
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
                    "is_featured" => $row["is_featured"] == '1' ? "Featured" : "",

                    "product_images" => $foundedImages,
                    
                    "brand_name" => $row["brand_name"],
                    "brand_id" => $row["brand_id"],
                    "category_name" => $row["category_name"],
                    "category_image" => $row["categoryImage"],
                    "category_id" => $row["category_id"],
                    "sub_category_name" => $row["sub_category_name"],
                    "sub_category_id" => $row["sub_category_id"],
                    
                    "quantity" => 100
                );

                array_push($products, $productElement);
            }

            if(count($products) > 0) {
                $result = array(
                    'data' => $products, 
                    'status' => true,
                    'statusCode' => 200
                );
            } else {
                $result = array(
                    'data' => 'No Record Found', 
                    'status' => false, 
                    'statusCode' => 200);
            }

        }

        else if(isset($_GET["productId"]) && $_GET["productId"] > 0 && isset($_GET["category_id"]) && $_GET["category_id"] > 0)
        {
            $category_id = $_GET["category_id"];
            $products = array();

            $sqlAllProductImages = "SELECT * FROM product_images";
            $AllProductImages = $pdo->prepare($sqlAllProductImages);
            $AllProductImages->execute(array());      
            $AllProductImages = $AllProductImages->fetchAll(PDO::FETCH_ASSOC);    
            
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
                WHERE     pm.is_active = '1'
                    and   p.category_id = $category_id
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
                    "is_featured" => $row["is_featured"] == '1' ? "Featured" : "",

                    "product_images" => $foundedImages,
                    
                    "brand_name" => $row["brand_name"],
                    "brand_id" => $row["brand_id"],
                    "category_name" => $row["category_name"],
                    "category_image" => $row["categoryImage"],
                    "category_id" => $row["category_id"],
                    "sub_category_name" => $row["sub_category_name"],
                    "sub_category_id" => $row["sub_category_id"],
                    
                    "quantity" => 100
                );

                array_push($products, $productElement);
            }

            if(count($products) > 0) {
                $result = array(
                    'data' => $products, 
                    'status' => true,
                    'statusCode' => 200
                );
            } else {
                $result = array(
                    'data' => 'No Record Found', 
                    'status' => false, 
                    'statusCode' => 200);
            }

        } 

        else if(isset($_GET["productId"]) && $_GET["productId"] > 0) {
            $productId = $_GET["productId"];
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
                "quantity" => 0
            );    

            
            $sql = "SELECT * FROM products WHERE product_id = ?";
            $q = $pdo->prepare($sql);
            $q->execute(array($productId));
            $isPresent = $q->fetch(PDO::FETCH_ASSOC);


            if($isPresent){

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

                    {
                        $sqlAllProductImages = "SELECT * FROM product_images WHERE product_id = ? and is_active = '1'";
                        $AllProductImages = $pdo->prepare($sqlAllProductImages);
                        $AllProductImages->execute(array($productId));      
                        $AllProductImages = $AllProductImages->fetchAll(PDO::FETCH_ASSOC);  

                        $foundedImages = [];
                        $searchKey = "product_id";
                        foreach ($AllProductImages as $subarray) {
                            if (array_key_exists($searchKey, $subarray)) {
                                if($subarray[$searchKey] == $productId){
                                    if($subarray['is_active'] == '1') {
                                        $foundedImages[] = $subarray['file_name']; 
                                    }
                                }
                            }
                        }
                        count($foundedImages) == 0 ? $foundedImages = null : "";
                    }                   

                    {                      
                        $product["product_id"] = $productInfo["product_id"];
                        $product["product_name"] = $productInfo["product_name"];
                        $product["product_description"] = mb_convert_encoding($productInfo["product_description"], 'UTF-8', 'UTF-8');
                        $product["price"] = $productInfo["price"];
                        $product["weight"] = $productInfo["weight"];
                        $product["is_active"] = $productInfo["productActive"] == '1' ? "Active" : "Deactive";

                        $product["product_images"] = implode(",",$foundedImages);
                        
                        $product["brand_name"] = $productInfo["brand_name"];
                        $product["brand_id"] = $productInfo["brand_id"];
                        $product["category_name"] = $productInfo["category_name"];
                        $product["category_image"] = $productInfo["categoryImage"];
                        $product["category_id"] = $productInfo["category_id"];
                        $product["sub_category_name"] = $productInfo["sub_category_name"];
                        $product["sub_category_id"] = $productInfo["sub_category_id"];
                        
                        $product["quantity"] = 100;
    
                    }

                    $result = array(
                        'data' => "Product Information Feeded",
                        'productInfo' => $product, 
                        'status' => true,
                        'statusCode' => 200
                    );

                } else {
                    $result = array(
                        'data' => "Couldn't Retrieve Product Information", 
                        'productInfo' => null,
                        'status' => true,
                        'statusCode' => 200
                    );
                }
            } else {
                $result = array(
                    'data' => "Product Not Found",
                    'productInfo' => null, 
                    'status' => true,
                    'statusCode' => 200
                );
                echo "";
            }

        }

        
        else if(isset($_GET["featured"])) {

            $products = array();

            $sqlAllProductImages = "SELECT * FROM product_images";
            $AllProductImages = $pdo->prepare($sqlAllProductImages);
            $AllProductImages->execute(array());      
            $AllProductImages = $AllProductImages->fetchAll(PDO::FETCH_ASSOC);    
            
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
                WHERE   pm.is_active = '1' and is_featured = '1' LIMIT 4
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
                    "is_featured" => $row["is_featured"] == '1' ? "Featured" : "",

                    "product_images" => $foundedImages,
                    
                    "brand_name" => $row["brand_name"],
                    "brand_id" => $row["brand_id"],
                    "category_name" => $row["category_name"],
                    "category_image" => $row["categoryImage"],
                    "category_id" => $row["category_id"],
                    "sub_category_name" => $row["sub_category_name"],
                    "sub_category_id" => $row["sub_category_id"],
                    
                    "quantity" => 100
                );

                array_push($products, $productElement);
            }

            if(count($products) > 0) {
                $result = array(
                    'data' => $products, 
                    'status' => true,
                    'statusCode' => 200
                );
            } else {
                $result = array(
                    'data' => 'No Record Found', 
                    'status' => false, 
                    'statusCode' => 200);
            }

        }
        
        
        else if(count($_GET) == 0)
        {
            $products = array();

            $sqlAllProductImages = "SELECT * FROM product_images";
            $AllProductImages = $pdo->prepare($sqlAllProductImages);
            $AllProductImages->execute(array());      
            $AllProductImages = $AllProductImages->fetchAll(PDO::FETCH_ASSOC);    
            
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
                    "is_featured" => $row["is_featured"] == '1' ? "Featured" : "",

                    "product_images" => $foundedImages,
                    
                    "brand_name" => $row["brand_name"],
                    "brand_id" => $row["brand_id"],
                    "category_name" => $row["category_name"],
                    "category_image" => $row["categoryImage"],
                    "category_id" => $row["category_id"],
                    "sub_category_name" => $row["sub_category_name"],
                    "sub_category_id" => $row["sub_category_id"],
                    
                    "quantity" => 100
                );

                array_push($products, $productElement);
            }

            if(count($products) > 0) {
                $result = array(
                    'data' => $products, 
                    'status' => true,
                    'statusCode' => 200
                );
            } else {
                $result = array(
                    'data' => 'No Record Found', 
                    'status' => false, 
                    'statusCode' => 200);
            }

        } 

        else {
            $result= ([
                "data" => "Incomplete inforamtion.",
                "status" => "fail",
                'statusCode' => 200
            ]);
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
            // $images = explode(",", $image);
            $images = $image;
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
                    "data" => "Product Information Is Added successfully.",
                    "ProductTitle" => $productname,
                    "status" => "success",
                    'statusCode' => 200
                ]);
            }
            
        
    } else {
        $result= ([
            "data" => "Incomplete inforamtion.",
            "ProductTitle" => $productname,
            "status" => "fail",
            'statusCode' => 200
        ]);
    }

}

else if($REQUEST_METHOD == "PUT") {
    
    $productInfoGetData = json_decode(file_get_contents('php://input'), true);
    if($productInfoGetData != null) {
        $productInfo = $productInfoGetData["productData"];
    }
    if($productInfo) {
        $productID = isset($productInfo['productID']) ? $productInfo['productID'] : "";
        $productname = isset($productInfo['productname']) ? $productInfo['productname'] : "";
        $productDescription = isset($productInfo['productDescription']) ? $productInfo['productDescription'] : "";
        $productprice = isset($productInfo['productprice']) ? $productInfo['productprice'] : "";
        $productweight = isset($productInfo['productweight']) ? $productInfo['productweight'] : "";
        $checkStock = isset($productInfo['checkStock']) ? $productInfo['checkStock'] : "";
        $brand = isset($productInfo['brand']) ? $productInfo['brand'] : "";
        $category = isset($productInfo['category']) ? $productInfo['category'] : "";
        $subcategory = isset($productInfo['subcategory']) ? $productInfo['subcategory'] : "";
        $image = isset($productInfo['image']) ? $productInfo['image'] : "";
        $action = isset($productInfo['action']) ? $productInfo['action'] : "";
        $featured = isset($productInfo['featured']) ? $productInfo['featured'] : "";

        include("dist/conf/db.php");
        $pdo = Database::connect();
        
        if(
            $productID > 0 &&
            $productname != "" &&
            $productDescription != "" &&
            $productprice != "" &&
            $productweight != "" &&
            $checkStock != "" &&
            $brand != "" &&
            $category != "" &&
            $subcategory != "" &&
            $image != "" &&
            $action == ""
        ) {
                $p1isUpdated = false;
                $p2isUpdated = false;
                $p3isUpdated = false;
                
                $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                
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
                    WHERE     p.product_id = $productID";
                    
                $q = $pdo->prepare($sql);
                $q->execute(array());
                $productPresent = $q->fetch(PDO::FETCH_ASSOC);
                
                if($productPresent) {    

                    // Adding product info
                    $sql = "UPDATE `products` SET 
                        `product_name` = ?,
                        `product_description` = ?,
                        `price` = ?,
                        `weight` = ?
                        WHERE 
                        product_id = ?;
                    ";
                    $q = $pdo->prepare($sql);
                    $p1isUpdated = $q->execute(array(
                        $productname,
                        $productDescription,
                        $productprice,
                        $productweight,
                        $productID
                    ));

                    $sql = "UPDATE `product_images` SET `is_active` = '0' WHERE `product_id` = ?";
                    $q = $pdo->prepare($sql);
                    $q->execute(array($productID));

                    // Adding product images
                    // $images = explode(",", $image);
                    $images = $image;

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
                        $p2isUpdated = $q->execute(array($productID,$singleImage,'1'));
                    }
                    if(is_array($images) && count($images) <= 0) {
                        $p2isUpdated = true;
                    }


                    // Adding new mapping
                    if(
                        $productPresent["brand_id"] != $brand ||
                        $productPresent["category_id"] != $category ||
                        $productPresent["sub_category_id"] != $subcategory
                    ){
                    
                        $sql = "UPDATE `product_mapping` SET 
                                `is_active` = '0'
                                WHERE 
                                product_id = ?;
                        ";
                        $q = $pdo->prepare($sql);
                        $p1isUpdated = $q->execute(array(
                            $productID
                        ));

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
                            $p3isUpdated = $q->execute(array(
                                $productID,
                                $brand,
                                $category,
                                $subcategory,
                                '1'
                            ));
                    } else {
                        $p3isUpdated = true;
                    }
                    //Success Result
                    if($p1isUpdated == true && $p2isUpdated == true && $p3isUpdated == true){
                        $result= ([
                            "data" => "Product Information Is Updated successfully.",
                            "ProductTitle" => strlen($productname) <= 35 ? $productname : substr($productname, 0, 35)."...",
                            "status" => "success",
                            'statusCode' => 200
                        ]);
                    }
                } else {
                    $result= ([
                        "data" => "Product Not Found",
                        "ProductTitle" => $productname,
                        "status" => "fail",
                        'statusCode' => 200
                    ]);
                }
                
            
        }  

        // Updating Status
        else if($productID > 0 && $action != "") {

            $sql = "SELECT * FROM products WHERE product_id = ?";
            $q = $pdo->prepare($sql);
            $q->execute(array($productID));
            $isPresent = $q->fetch(PDO::FETCH_ASSOC);
            
            if($isPresent != "") {        

                $p1isUpdated = false;

                if($action == "deactive") {
                    
                    $sql = "UPDATE `products` SET `is_active` = '0' WHERE product_id = ?;";
                    $q = $pdo->prepare($sql);
                    $p1isUpdated = $q->execute(array($productID));

                } else if($action == "active") {
                    
                    $sql = "UPDATE `products` SET `is_active` = '1' WHERE product_id = ?;";
                    $q = $pdo->prepare($sql);
                    $p1isUpdated = $q->execute(array($productID));

                } else if($action == "") {
                    $result= ([
                        "data" => "Action cannot be blank.",
                        "title" => "",
                        "status" => "fail",
                        'statusCode' => 200
                    ]);
                }
                
                
                if($p1isUpdated == true ){
                    $result= ([
                        "data" => "Product Status Is Updated successfully.",
                        // "title" => $action == "deactive" ? "Deactive" : "Active",
                        "title" => isset($isPresent['product_name']) 
                        ? ( strlen($isPresent['product_name']) <= 35 ? $isPresent['product_name'] : substr($isPresent['product_name'], 0, 35)."...")
                        : (status == "deactive" ? "Deactive" : "Active" ),
                        "status" => "success",
                        'statusCode' => 200
                    ]);
                }

            } else {
                $result= ([
                    "data" => "Product Not Found.",
                    "title" => status == "deactive" ? "Deactive" : "Active",
                    "ProductTitle" => $productname,
                    "status" => "fail",
                    'statusCode' => 200
                ]);
            }

        } 

        // Mark Featured
        else if($productID > 0 && $featured != "") {

            $sql = "SELECT * FROM products WHERE product_id = ?";
            $q = $pdo->prepare($sql);
            $q->execute(array($productID));
            $isPresent = $q->fetch(PDO::FETCH_ASSOC);
            
            if($isPresent != "") {        

                $p1isUpdated = false;

                if($featured == 1) {

                    $sql = "SELECT count(*) as featuredCount FROM products WHERE `is_featured` = '1'";
                    $q = $pdo->prepare($sql);
                    $q->execute(array());
                    $featuredCount = $q->fetch(PDO::FETCH_ASSOC);
                    
                    if($featuredCount) {
                        if($featuredCount['featuredCount'] < 4) {
                            $sql = "UPDATE `products` SET `is_featured` = '1' WHERE product_id = ?;";
                            $q = $pdo->prepare($sql);
                            $p1isUpdated = $q->execute(array($productID));
                        } else {
                            $result= ([
                                "data" => "Limit reached for marking product as featured.",
                                "title" => $isPresent["product_name"],
                                "status" => "fail",
                                'statusCode' => 200
                            ]);
                        }
                    } else {
                        $sql = "UPDATE `products` SET `is_featured` = '1' WHERE product_id = ?;";
                            $q = $pdo->prepare($sql);
                            $p1isUpdated = $q->execute(array($productID));
                    }

                    if($p1isUpdated == true ){
                        $result= ([
                            "data" => "Product is marked as featured product.",
                            "title" => isset($isPresent['product_name']) 
                            ? ( strlen($isPresent['product_name']) <= 35 ? $isPresent['product_name'] : substr($isPresent['product_name'], 0, 35)."...")
                            : "Featured" ,
                            "status" => "success",
                            'statusCode' => 200
                        ]);
                    }

                } 
                else if($featured == 0) {
                
                    $sql = "UPDATE `products` SET `is_featured` = '0' WHERE product_id = ?;";
                    $q = $pdo->prepare($sql);
                    $p1isUpdated = $q->execute(array($productID));
                    
                    if($p1isUpdated == true ){
                        $result= ([
                            "data" => "Product is marked as non-featured product.",
                            "title" => isset($isPresent['product_name']) 
                            ? ( strlen($isPresent['product_name']) <= 35 ? $isPresent['product_name'] : substr($isPresent['product_name'], 0, 35)."...")
                            : "Not Featured",
                            "status" => "success",
                            'statusCode' => 200
                        ]);
                    }
                } 
                else {
                    $result= ([
                        "data" => "Featured action cannot be blank.",
                        "title" => "",
                        "status" => "fail",
                        'statusCode' => 200
                    ]);
                }

            } else {
                $result= ([
                    "data" => "Product Not Found.",
                    "title" => $featured == "1" ? "Featured" : "",
                    "ProductTitle" => $productname,
                    "status" => "fail",
                    'statusCode' => 200
                ]);
            }

        } 
        
        else {
            $result= ([
                "data" => "Incomplete inforamtion.",
                "ProductTitle" => $productname,
                "status" => "fail",
                'statusCode' => 200
            ]);
        }
    } else {
        $result= ([
            "data" => "Requied inforamtion not found.",
            "ProductTitle" => $productname,
            "status" => "fail",
            'statusCode' => 200
        ]);
    }
}

else if($REQUEST_METHOD == "DELETE") {
    
    $productInfo = json_decode(file_get_contents('php://input'), true);
    
    if($productInfo != null) {
        $productInfo = $productInfo["productData"];
    }
    
    $productID = $productInfo['productID'];

    include("dist/conf/db.php");
    $pdo = Database::connect();
    
    if( $productID > 0 ) 
    {
            $p1isDeleted = false;
            $p2isDeleted = false;
            $p3isDeleted = false;
            
            $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                
            // Adding product info
            $sql = "UPDATE `products` SET `is_active` = '0' WHERE product_id = ?;
            ";
            $q = $pdo->prepare($sql);
            $p1isDeleted = $q->execute(array($productID));
            
            $sql = "UPDATE `product_images` SET `is_active` = '0' WHERE `product_id` = ?";
            $q = $pdo->prepare($sql);
            $p2isDeleted = $q->execute(array($product_id));

            $sql = "UPDATE `product_mapping` SET `is_active` = '0' WHERE `product_id` = ?";
            $q = $pdo->prepare($sql);
            $p3isDeleted = $q->execute(array($product_id));

            //Success Result
            if($p1isDeleted == true && $p3isDeleted == true){
                $result= ([
                    "data" => "Product Information Is Deleted successfully.",
                    "ProductID" => $productID,
                    "status" => "success",
                    'statusCode' => 200
                ]);
            }
            
        
    } else {
        $result= ([
            "data" => "Incomplete inforamtion.",
            "ProductID" => $productID,
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

// var_dump(json_encode($result, JSON_INVALID_UTF8_IGNORE));
echo json_encode($result, JSON_INVALID_UTF8_IGNORE);
// var_dump(json_last_error());
// echo json_encode($result);

exit();