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

    $status = "";
    $brand_id_edit = 0;

    if(isset($_GET['status'])) {
        $status = $_GET['status']; 
    }

    if(isset($_GET['brand_id'])) {
        $brand_id_edit = $_GET['brand_id']; 
    }

    include("dist/conf/db.php");
    $pdo = Database::connect();
    $brands = array();
    $host = "http://".$_SERVER['HTTP_HOST']."/simplysample/uploads/logos/";
    if($status == "pending") {

        $sql = "SELECT 
                b.brand_id, 
                b.brand_name, 
                address_line_1, address_line_2, taluka, city, state, pincode, address_type,
                document_title, file_title,
                first_name, last_name, contact_number, email, registration_year, gst_number, brand_logo, food_licence_number,
                bc.category_id, c.category_name,
                business_name,
                b.is_active as brands_is_active, 
                ba.is_active as ba_is_active, 
                bd.is_active as bd_is_active,
                bc.is_active as bc_is_active, 
                bb.is_active as bb_is_active, 
                bu.is_active as bu_is_active
            FROM    brands b
            JOIN    brand_address ba ON ba.brand_id = b.brand_id
            JOIN    brand_documents bd ON bd.brand_id = b.brand_id
            JOIN    brand_info bi ON bi.brand_id = b.brand_id
            JOIN    brand_vs_category bc ON bc.brand_id = b.brand_id
            JOIN    category c ON c.category_id = bc.category_id
            JOIN    business_vs_brand bb ON bb.brand_id = b.brand_id
            JOIN    business bu ON bu.business_id = bb.business_id
            WHERE   status = 'Pending'
            GROUP BY b.brand_id
        ";
    } else if($status == "approved") {

        $sql = "SELECT 
                b.brand_id, 
                b.brand_name, 
                address_line_1, address_line_2, taluka, city, state, pincode, address_type,
                document_title, file_title,
                first_name, last_name, contact_number, email, registration_year, gst_number, brand_logo, food_licence_number,
                bc.category_id, c.category_name,
                business_name,
                b.is_active as brands_is_active, 
                ba.is_active as ba_is_active, 
                bd.is_active as bd_is_active,
                bc.is_active as bc_is_active, 
                bb.is_active as bb_is_active, 
                bu.is_active as bu_is_active
            FROM    brands b
            JOIN    brand_address ba ON ba.brand_id = b.brand_id
            JOIN    brand_documents bd ON bd.brand_id = b.brand_id
            JOIN    brand_info bi ON bi.brand_id = b.brand_id
            JOIN    brand_vs_category bc ON bc.brand_id = b.brand_id
            JOIN    category c ON c.category_id = bc.category_id
            JOIN    business_vs_brand bb ON bb.brand_id = b.brand_id
            JOIN    business bu ON bu.business_id = bb.business_id
            WHERE   status = 'Approved'
            GROUP BY b.brand_id
        ";
    } else if($status == "onboard") {

        $sql = "SELECT 
                b.brand_id, 
                b.brand_name, 
                address_line_1, address_line_2, taluka, city, state, pincode, address_type,
                document_title, file_title,
                first_name, last_name, contact_number, email, registration_year, gst_number, brand_logo, food_licence_number,
                bc.category_id, c.category_name,
                business_name,
                b.is_active as brands_is_active, 
                ba.is_active as ba_is_active, 
                bd.is_active as bd_is_active,
                bc.is_active as bc_is_active, 
                bb.is_active as bb_is_active, 
                bu.is_active as bu_is_active
            FROM    brands b
            JOIN    brand_address ba ON ba.brand_id = b.brand_id
            JOIN    brand_documents bd ON bd.brand_id = b.brand_id
            JOIN    brand_info bi ON bi.brand_id = b.brand_id
            JOIN    brand_vs_category bc ON bc.brand_id = b.brand_id
            JOIN    category c ON c.category_id = bc.category_id
            JOIN    business_vs_brand bb ON bb.brand_id = b.brand_id
            JOIN    business bu ON bu.business_id = bb.business_id
            WHERE   status = 'Onboarded'
            GROUP BY b.brand_id
        ";
    } else if($status == "rejected") {

        $sql = "SELECT 
                b.brand_id, 
                b.brand_name, 
                address_line_1, address_line_2, taluka, city, state, pincode, address_type,
                document_title, file_title,
                first_name, last_name, contact_number, email, registration_year, gst_number, brand_logo, food_licence_number,
                bc.category_id, c.category_name,
                business_name,
                b.is_active as brands_is_active, 
                ba.is_active as ba_is_active, 
                bd.is_active as bd_is_active,
                bc.is_active as bc_is_active, 
                bb.is_active as bb_is_active, 
                bu.is_active as bu_is_active
            FROM    brands b
            JOIN    brand_address ba ON ba.brand_id = b.brand_id
            JOIN    brand_documents bd ON bd.brand_id = b.brand_id
            JOIN    brand_info bi ON bi.brand_id = b.brand_id
            JOIN    brand_vs_category bc ON bc.brand_id = b.brand_id
            JOIN    category c ON c.category_id = bc.category_id
            JOIN    business_vs_brand bb ON bb.brand_id = b.brand_id
            JOIN    business bu ON bu.business_id = bb.business_id
            WHERE   status = 'Rejected'
            GROUP BY b.brand_id
        ";
    } else {

        $sql = "SELECT 
                b.brand_id, 
                b.brand_name, 
                address_line_1, address_line_2, taluka, city, state, pincode, address_type,
                document_title, file_title,
                first_name, last_name, contact_number, email, registration_year, gst_number, brand_logo, food_licence_number,
                bc.category_id, c.category_name,
                business_name,
                b.is_active as brands_is_active, 
                ba.is_active as ba_is_active, 
                bd.is_active as bd_is_active,
                bc.is_active as bc_is_active, 
                bb.is_active as bb_is_active, 
                bu.is_active as bu_is_active
            FROM    brands b
            JOIN    brand_address ba ON ba.brand_id = b.brand_id
            JOIN    brand_documents bd ON bd.brand_id = b.brand_id
            JOIN    brand_info bi ON bi.brand_id = b.brand_id
            JOIN    brand_vs_category bc ON bc.brand_id = b.brand_id
            JOIN    category c ON c.category_id = bc.category_id
            JOIN    business_vs_brand bb ON bb.brand_id = b.brand_id
            JOIN    business bu ON bu.business_id = bb.business_id
            WHERE   1
            GROUP BY b.brand_id
        ";

    }

    $q = $pdo->query($sql);
    foreach ($pdo->query($sql) as $row) 
    {
        $categoryArray = array();
        $categoryIds = array();
        $categories = array();
        $brand_id = $row["brand_id"];

        $sql12 = "SELECT * FROM brand_vs_category bc JOIN category c ON bc.category_id = c.category_id  WHERE brand_id = '$brand_id'";
        $q12 = $pdo->query($sql12);
        foreach ($pdo->query($sql12) as $row12) 
        {
                array_push($categoryIds, $row12['category_id']);
                array_push($categories, $row12['category_name']);
                $categoryElement = [
                    "category_id" => $row12['category_id'],
                    "category_name" => $row12['category_name']
                ];
                array_push($categoryArray , $categoryElement);
        }

        $brandElement = array (
            "id" => $row["brand_id"],
            "brand_name" => $row["brand_name"],
            "address_line_1" => $row["address_line_1"],
            "address_line_2" => $row["address_line_2"],
            "taluka" => $row["taluka"],
            "city" => $row["city"],
            "state" => $row["state"],
            "pincode" => $row["pincode"],
            "address_type" => $row["address_type"],
            "document_title" => $row["document_title"],
            "file_title" => $row["file_title"],
            "firstname" => $row["first_name"],
            "lastname" => $row["last_name"],
            "contact" => $row["contact_number"],
            "email" => $row["email"],
            "registration_year" => $row["registration_year"],
            "gst_number" => $row["gst_number"],
            "brand_logo" => $host.$row["brand_logo"],
            "food_licence_number" => $row["food_licence_number"],
            "category_id" => implode(",", $categoryIds),
            "categories" => implode(",", $categories),
            "categoryArray" => $categoryArray,
            "business_name" => $row["business_name"]
        );

        array_push($brands, $brandElement);
    }

    if(count($brands) > 0) {
        // echo "<pre>";
        // var_dump (($brands));
        // echo "</pre>";
        $result = array(
            'data' => $brands, 
            'status' => true,
            'statusCode' => 200
        );
    } else {
        $result = array(
            'data' => 'No Record Found', 
            'status' => false, 
            'statusCode' => 400);
    }
    
    if($brand_id_edit > 0) {
        
        $sql = "SELECT 
                b.brand_id, 
                b.brand_name,
                document_title, file_title,
                first_name, last_name, contact_number, email, registration_year, gst_number, brand_logo, food_licence_number,requested_categories,
                bc.category_id, c.category_name,
                business_name,
                b.is_active as brands_is_active, 
                bd.is_active as bd_is_active,
                bc.is_active as bc_is_active, 
                bb.is_active as bb_is_active, 
                bu.is_active as bu_is_active
            FROM    brands b
            JOIN    brand_documents bd ON bd.brand_id = b.brand_id
            JOIN    brand_info bi ON bi.brand_id = b.brand_id
            JOIN    brand_vs_category bc ON bc.brand_id = b.brand_id
            JOIN    category c ON c.category_id = bc.category_id
            JOIN    business_vs_brand bb ON bb.brand_id = b.brand_id
            JOIN    business bu ON bu.business_id = bb.business_id
            WHERE   b.brand_id = $brand_id_edit
            GROUP BY b.brand_id
        ";
        $q = $pdo->prepare($sql);
        $q->execute(array());
        $brandPresent = $q->fetch(PDO::FETCH_ASSOC);

        $categories = array();

        $sql12 = "SELECT * FROM brand_vs_category bc JOIN category c ON bc.category_id = c.category_id  WHERE brand_id = '$brand_id_edit'";
        $q12 = $pdo->query($sql12);
        foreach ($pdo->query($sql12) as $row12) 
        {
                $categoryElement = [
                    "category_id"=> $row12["category_id"],
                    "category_name"=> $row12['category_name']
                ];
                array_push($categories, $categoryElement);
        }
        

        $requested_categories= [];
        $requested_categoriesstring = $brandPresent['requested_categories'];

        $sqlreq = "SELECT * FROM brand_vs_category bc JOIN category c ON bc.category_id = c.category_id  WHERE brand_id IN ('$requested_categoriesstring')";
        $qreq = $pdo->query($sqlreq);
        foreach ($pdo->query($sqlreq) as $rowreq) 
        {
                $categoryElement = [
                    "category_id"=> $rowreq["category_id"],
                    "category_name"=> $rowreq['category_name']
                ];
                array_push($requested_categories, $categoryElement);
        }


        $registeredAddress =  [];
        $delieveryAddress =  [];

        $brandAd = "SELECT * FROM brand_address ba JOIN brands b ON ba.brand_id = b.brand_id  WHERE b.brand_id = '$brand_id_edit'";
        $qBrandAd = $pdo->query($brandAd);
        foreach ($pdo->query($brandAd) as $rowBrandAd) 
        {
            if($rowBrandAd["address_type"] == "registered"){
                $registeredAddress = [
                    "address_line_1" => $rowBrandAd["address_line_1"],
                    "address_line_2" => $rowBrandAd["address_line_2"],
                    "taluka" => $rowBrandAd["taluka"],
                    "city" => $rowBrandAd["city"],
                    "state" => $rowBrandAd["state"],
                    "pincode" => $rowBrandAd["pincode"],
                    "status" => $rowBrandAd["status"],
                    "address_type" => $rowBrandAd["address_type"]
                ];
            }
            if($rowBrandAd["address_type"] == "delivery"){
                $delieveryAddress = [
                    "address_line_1" => $rowBrandAd["address_line_1"],
                    "address_line_2" => $rowBrandAd["address_line_2"],
                    "taluka" => $rowBrandAd["taluka"],
                    "city" => $rowBrandAd["city"],
                    "state" => $rowBrandAd["state"],
                    "pincode" => $rowBrandAd["pincode"],
                    "status" => $rowBrandAd["status"],
                    "address_type" => $rowBrandAd["address_type"]
                ];
            }
        }

        $documents = [];
        $sqlDoc = "SELECT * FROM brand_documents bd JOIN brands b ON b.brand_id = bd.brand_id  WHERE b.brand_id = '$brand_id_edit' and bd.is_active = '1'";
        $qDoc = $pdo->query($sqlDoc);
        foreach ($pdo->query($sqlDoc) as $rowDoc) 
        {
            $documentElement = [
                $rowDoc["document_title"] => $rowDoc["file_title"],
            ];
            array_push($documents, $documentElement);
        }

        $brandElement = array (
            "id" => $brandPresent["brand_id"],
            "brand_name" => $brandPresent["brand_name"],
            "registered_address"=> $registeredAddress,
            "delievery_address"=> $delieveryAddress,
            "documents" => $documents,
            "firstname" => $brandPresent["first_name"],
            "lastname" => $brandPresent["last_name"],
            "contact" => $brandPresent["contact_number"],
            "email" => $brandPresent["email"],
            "registration_year" => $brandPresent["registration_year"],
            "gst_number" => $brandPresent["gst_number"],
            "brand_logo" => $brandPresent["brand_logo"],
            "food_licence_number" => $brandPresent["food_licence_number"],
            "categories" => $categories,
            "requestedCategories" => $requested_categories,
            "business_name" => $brandPresent["business_name"]
        );

        $result = array(
            'data' => $brandElement, 
            'status' => true,
            'statusCode' => 200
        );
    }



}

else if($REQUEST_METHOD == "POST") {
    
    $firstname = "";
    $lastname = "";
    $email = "";
    $phone_number = 0;
    $brand_name = "";
    $sample_size = "";
    $additional_comments = "";
    $categories = "";

    // parse_str(file_get_contents('php://input'), $_POST);
    $_POST = json_decode(file_get_contents('php://input'));
    if(count($_POST) > 0) $_POST = (array) $_POST[0];

    if(isset($_POST['firstname'])) {
        $firstname = trim($_POST['firstname']);
    }

    if(isset($_POST['lastname'])) {
        $lastname = trim($_POST['lastname']);
    }

    if(isset($_POST['email'])) {
        $email = trim($_POST['email']);
    }

    if(isset($_POST['phone_number'])) {
        $phone_number = trim($_POST['phone_number']);
    } 

    if(isset($_POST['brand_name'])) {
        $brand_name = trim($_POST['brand_name']);
    }

    if(isset($_POST['sample_size'])) {
        $sample_size = trim($_POST['sample_size']);
    }

    if(isset($_POST['additional_comments'])) {
        $additional_comments = trim($_POST['additional_comments']);
    }

    if(isset($_POST['categories'])) {
        $categories = trim($_POST['categories']);
    }     
    
    include("dist/conf/db.php");
    $pdo = Database::connect();
    
    if(
        $firstname != "" && 
        $lastname != "" && 
        $email != "" && 
        $phone_number != "" && 
        $brand_name != "" && 
        $sample_size != "" && 
        $categories != ""
    ) {

        $sql = "SELECT * FROM brands WHERE brand_name = ? and is_active = 1";
        $q = $pdo->prepare($sql);
        $q->execute(array($brand_name));
        $isBrandPresent = $q->fetch(PDO::FETCH_ASSOC);
        
        if($isBrandPresent == "") {   

            $sql = "SELECT * FROM brand_info WHERE email = ? and is_active = 1";
            $q = $pdo->prepare($sql);
            $q->execute(array($email));
            $isDuplicateEmail = $q->fetch(PDO::FETCH_ASSOC);
            
            if($isDuplicateEmail == "") {
                
                $sql = "SELECT * FROM brand_info WHERE contact_number = ? and is_active = 1";
                $q = $pdo->prepare($sql);
                $q->execute(array($phone_number));
                $isDuplicatePhone = $q->fetch(PDO::FETCH_ASSOC);
                
                if($isDuplicatePhone == "") {

                    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                    $sql = "INSERT INTO `brands`(
                    `brand_name`,
                    `status`,
                    `is_active`
                    ) VALUES (?,?,?)";
                    $q = $pdo->prepare($sql);
                    $isBrandAdded = $q->execute(array(
                        $brand_name,
                        'Pending',
                        '0'
                    ));
                    
                    if($isBrandAdded != ""){
                        
                        $brand_id = $pdo->lastInsertId();

                        if($brand_id > 0) {
                            $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                            $sql = "INSERT INTO `brand_info`(
                            `brand_id`,
                            `first_name`,
                            `last_name`,
                            `email`,
                            `contact_number`,
                            `sample_size`,
                            `additional_comments`,
                            `requested_categories`,
                            `is_active`
                            ) VALUES (?,?,?,?,?,?,?,?,?)";
                            $q = $pdo->prepare($sql);
                            $isAdded = $q->execute(array(
                                $brand_id,
                                $firstname,
                                $lastname,
                                $email,
                                $phone_number,
                                $sample_size,
                                $additional_comments,
                                $categories,
                                '0'
                            ));
                            
                            if($isAdded == true){
                                $result= ([
                                    "data" => "Brand and Information Saved Successfully",
                                    "brand_name" => $brand_name,
                                    "status" => "success",
                                    'statusCode' => 200
                                ]);
                            }
                        } else {
                            $result= ([
                                "data" => "Brand Information Not Saved.",
                                "brand_name" => $brand_name,
                                "status" => "success",
                                'statusCode' => 200
                            ]);
                        }
                    } else {
                        $result= ([
                            "data" => "Brand Information Not Saved.",
                            "brand_name" => $brand_name,
                            "status" => "success",
                            'statusCode' => 200
                        ]);
                    }

                } else {
                    $result= ([
                        "data" => "Duplicate Contact Number Found.",
                        "brand_name" => $brand_name,
                        "status" => "fail",
                        'statusCode' => 200
                    ]);
                }
            } else {
                $result= ([
                    "data" => "Duplicate Email Found.",
                    "brand_name" => $brand_name,
                    "status" => "fail",
                    'statusCode' => 200
                ]);
            }
        } else {
            $result= ([
                "data" => "Brand name already exist.",
                "brand_name" => $brand_name,
                "status" => "fail",
                'statusCode' => 200
            ]);
        }
    } else {
        $result= ([
            "data" => "Insufficient Information.",
            "brand_name" => $brand_name,
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