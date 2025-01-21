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

    if(isset($_GET['status'])) {
        $status = $_GET['status']; 
    }

    include("dist/conf/db.php");
    $pdo = Database::connect();
    $brands = array();
    
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
        $categoryIds = array();
        $categories = array();
        $brand_id = $row["brand_id"];

        $sql12 = "SELECT * FROM brand_vs_category bc JOIN category c ON bc.category_id = c.category_id  WHERE brand_id = '$brand_id'";
        $q12 = $pdo->query($sql12);
        foreach ($pdo->query($sql12) as $row12) 
        {
                array_push($categoryIds, $row12['category_id']);
                array_push($categories, $row12['category_name']);
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
            "brand_logo" => $row["brand_logo"],
            "food_licence_number" => $row["food_licence_number"],
            "category_id" => implode(",<br>", $categoryIds),
            "categories" => implode(",<br>", $categories),
            "business_name" => $row["business_name"]
        );

        array_push($brands, $brandElement);
    }

    if(count($brands) > 0) {
        // echo "<pre>";
        // var_dump (($brands));
        // echo "</pre>";
        $result = array(
            'message' => $brands, 
            'status' => true,
            'statusCode' => 200
        );
    } else {
        // $result = array(
        //     'message' => 'No Record Found', 
        //     'status' => false, 
        //     'statusCode' => 400);
    }
}

else if($REQUEST_METHOD == "POST") {
    
    $subcategoryid_edit = "";
    $subcategoryTitle = "";
    $parentCategoryName = "";
    $isActive = "";

    if(isset($_POST['subcategoryid_edit'])) {
        $subcategoryid_edit = $_POST['subcategoryid_edit'];
    }
    if(isset($_POST['subcategoryTitle'])) {
        $subcategoryTitle = $_POST['subcategoryTitle'];
    }
    if(isset($_POST['parentCategoryName'])) {
        $parentCategoryName = $_POST['parentCategoryName'];
    }
    if(isset($_POST['isActive'])) {
        $isActive = $_POST['isActive'];
        if($isActive == false) $isActive = 0;
        if($isActive == true) $isActive = 1;
    }

    include("dist/conf/db.php");
    $pdo = Database::connect();
    
    if(
        $subcategoryTitle != "" &&
        $parentCategoryName != "" &&
        $isActive != ""    
    ) {

        $sql = "SELECT * FROM sub_category WHERE sub_category_name = ?";
        $q = $pdo->prepare($sql);
        $q->execute(array($subcategoryTitle));
        $subCategoryArray = $q->fetch(PDO::FETCH_ASSOC);
        
        if($subCategoryArray == "") {
            $added_on = date('Y-m-d H-i-s');
            
            $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            $sql = "INSERT INTO `sub_category`(`sub_category_name`,`added_on`,`is_active`) VALUES (?,?,?)";
            $q = $pdo->prepare($sql);
            $isAdded = $q->execute(array($subcategoryTitle, $added_on, 1));
            
            if($isAdded == true){
                $result= ([
                    "message" => "Sub Category Added successfully.",
                    "sub_categoryTitle" => $subcategoryTitle,
                    "status" => "success",
                    'statusCode' => 200
                ]);
            }
            
        } else if ($parentCategoryName != "") {
            $sql = "SELECT * FROM category WHERE category_name = ?";
            $q = $pdo->prepare($sql);
            $q->execute(array($parentCategoryName));
            $categoryArray = $q->fetch(PDO::FETCH_ASSOC);

            if($categoryArray) {
                $category_id = $categoryArray['category_id'];
                $sub_category_id = subCategoryArray['sub_category_id'];

                $sql = "SELECT * FROM category_vs_subcategory WHERE category_id = ? and sub_category_id = ?";
                $q = $pdo->prepare($sql);
                $q->execute(array($category_id, $sub_category_id));
                $category_vs_subcategory = $q->fetch(PDO::FETCH_ASSOC);
                if($category_vs_subcategory) {
                    if($category_vs_subcategory['is_active'] == 0) {
                        
                    }
                }
            }

        } else {
            $result= ([
                "message" => "Sub Category Alaready Present.",
                "sub_categoryTitle" => $subcategoryTitle,
                "status" => "fail",
                'statusCode' => 200
            ]);
        }
    } else {
        $result= ([
            "message" => "Incomplete inforamtion.",
            "sub_categoryTitle" => $subcategoryTitle,
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

exit();