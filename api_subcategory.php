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
    $sql = "SELECT 
                c.category_id, c.category_name, s.is_active as sub_is_active,
                sc.cat_subcat_id, sc.is_active as catsub_is_active,
                s.sub_category_id, s.sub_category_name,   
                c.is_active as cat_is_active
        FROM    category_vs_subcategory sc
        JOIN    category c ON sc.category_id = c.category_id
        JOIN    sub_category s ON sc.sub_category_id = s.sub_category_id
        WHERE   sc.is_active = '1'
    ";
    $q = $pdo->query($sql);
    foreach ($pdo->query($sql) as $row) 
    {
        $sub_categoryElement = array (
            "cat_subcat_id" => $row["cat_subcat_id"],
            "id" => $row["sub_category_id"],
            "sub_categoryName" => $row["sub_category_name"],
            "categoryID" => $row["category_id"],
            "categoryName" => $row["category_name"],
            "mapping_active" => $row["catsub_is_active"],
            "sub_active" => $row["sub_is_active"],
            "cat_active" => $row["cat_is_active"],
            "total_products" => 100
        );

        array_push($categories, $sub_categoryElement);
    }

    if(count($categories) > 0) {
        // echo "<pre>";
        // var_dump (($categories));
        // echo "</pre>";
        $result = array(
            'data' => $categories, 
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
            
            $sub_category_id = $pdo->lastInsertId();

            if($isAdded == true){
                $result= ([
                    "data" => "Sub Category Added successfully.",
                    "sub_categoryTitle" => $subcategoryTitle,
                    "status" => "success",
                    'statusCode' => 200
                ]);
            }
            
        // } else if ($parentCategoryName != "") {
            $sql = "SELECT * FROM category WHERE category_name = ?";
            $q = $pdo->prepare($sql);
            $q->execute(array($parentCategoryName));
            $categoryArray = $q->fetch(PDO::FETCH_ASSOC);

            if($categoryArray) {
                $category_id = $categoryArray['category_id'];
                // $sub_category_id = subCategoryArray['sub_category_id'];

                $sql = "SELECT * FROM category_vs_subcategory WHERE category_id = ? and sub_category_id = ?";
                $q = $pdo->prepare($sql);
                $q->execute(array($category_id, $sub_category_id));
                $category_vs_subcategory = $q->fetch(PDO::FETCH_ASSOC);

                if(!$category_vs_subcategory) {

                    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                    $sql = "INSERT INTO `category_vs_subcategory`(`category_id`,`sub_category_id`,`is_active`) VALUES (?,?,?)";
                    $q = $pdo->prepare($sql);
                    $isAdded1 = $q->execute(array($category_id, $sub_category_id, '1'));

                }
            }

        } 
        else {
            $result= ([
                "data" => "Sub Category Alaready Present.",
                "sub_categoryTitle" => $subcategoryTitle,
                "status" => "fail",
                'statusCode' => 200
            ]);
        }
    } else {
        $result= ([
            "data" => "Incomplete inforamtion.",
            "sub_categoryTitle" => $subcategoryTitle,
            "status" => "fail",
            'statusCode' => 200
        ]);
    }

} 

else if($REQUEST_METHOD == "PUT") {
    
    $cat_subcat_id = "";
    $subcategoryid_edit = "";
    $subcategoryTitle = "";
    $parentCategoryName = "";
    $isActive = "";

    $subCategoryInfo = json_decode(file_get_contents('php://input'), true);
    if($subCategoryInfo != null) {
        $subCategoryInfo = $subCategoryInfo["subCategoryData"];
    }
    
    if(isset($subCategoryInfo['cat_subcat_id'])) {
        $cat_subcat_id = (int)$subCategoryInfo['cat_subcat_id'];
    }
    if(isset($subCategoryInfo['subCategoryID'])) {
        $subcategoryid_edit = (int)$subCategoryInfo['subCategoryID'];
    }
    if(isset($subCategoryInfo['subcategoryTitle'])) {
        $subcategoryTitle = $subCategoryInfo['subcategoryTitle'];
    }
    if(isset($subCategoryInfo['parentCategoryName'])) {
        $parentCategoryName = $subCategoryInfo['parentCategoryName'];
    }
    if(isset($subCategoryInfo['isActive'])) {
        $isActive = $subCategoryInfo['isActive'];
        if($isActive == false) $isActive = 0;
        if($isActive == true) $isActive = 1;
    }

    
    include("dist/conf/db.php");
    $pdo = Database::connect();

    if(
        $cat_subcat_id > 0 &&
        $subcategoryid_edit > 0 &&
        $subcategoryTitle != "" &&
        $parentCategoryName != "" &&
        $isActive != ""    
    ) {

        $sql = "SELECT * FROM sub_category WHERE sub_category_id = ?";
        $q = $pdo->prepare($sql);
        $q->execute(array($subcategoryid_edit));
        $subCategoryArray = $q->fetch(PDO::FETCH_ASSOC);
        
        if($subCategoryArray != "") {
            
            $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            $sql = "UPDATE `sub_category` SET `sub_category_name` = ?, `is_active` = ? WHERE sub_category_id = ?";
            $q = $pdo->prepare($sql);
            $isUpdated = $q->execute(array($subcategoryTitle, $isActive, $subcategoryid_edit));
            
            $sql = "SELECT * FROM category WHERE category_name = ?";
            $q = $pdo->prepare($sql);
            $q->execute(array($parentCategoryName));
            $categoryArray = $q->fetch(PDO::FETCH_ASSOC);

            if($categoryArray) {
                $category_id = $categoryArray['category_id'];
                $sub_category_id = $subCategoryArray['sub_category_id'];

                $sql = "SELECT * FROM category_vs_subcategory WHERE cat_subcat_id = ?";
                $q = $pdo->prepare($sql);
                $q->execute(array($cat_subcat_id));
                $cat_subcat_id_exist = $q->fetch(PDO::FETCH_ASSOC);

                if($cat_subcat_id_exist) {

                    $sql = "SELECT * FROM category_vs_subcategory WHERE category_id = ? AND sub_category_id = ? and is_active = '1'";
                    $q = $pdo->prepare($sql);
                    $q->execute(array($category_id, $sub_category_id));
                    $category_vs_subcategory = $q->fetch(PDO::FETCH_ASSOC);

                    if(!$category_vs_subcategory) {
                        
                        if($cat_subcat_id_exist['is_active'] == 1) {
                            $sql = "UPDATE `category_vs_subcategory` SET `is_active` = '0' WHERE cat_subcat_id = ?";
                            $q = $pdo->prepare($sql);
                            $isUpdated1 = $q->execute(array($cat_subcat_id));
                        }

                        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                        $sql = "INSERT INTO `category_vs_subcategory`(`category_id`,`sub_category_id`,`is_active`) VALUES (?,?,?)";
                        $q = $pdo->prepare($sql);
                        $isUpdated2 = $q->execute(array($category_id, $sub_category_id, '1'));
                    }
                }
            } else {
                $result= ([
                    "data" => "Category Not Found.",
                    "sub_categoryTitle" => $subcategoryTitle,
                    "status" => "fail",
                    'statusCode' => 400
                ]);
            }
            
            if($isUpdated == true){
                $result= ([
                    "data" => "Sub Category Updated successfully.",
                    "sub_categoryTitle" => $subcategoryTitle,
                    "status" => "success",
                    'statusCode' => 200
                ]);
            }

        } 
        else {
            $result= ([
                "data" => "Sub Category Not Found.",
                "sub_categoryTitle" => $subcategoryTitle,
                "status" => "fail",
                'statusCode' => 400
            ]);
        }
    } else {
        $result= ([
            "data" => "Incomplete inforamtion.",
            "sub_categoryTitle" => $subcategoryTitle,
            "status" => "fail",
            'statusCode' => 300
        ]);
    }

} 

else {
    $result = array(
        'data' => 'Requested Method is not supported', 
        'status' => false, 
        'statusCode' => 500);
}

echo json_encode($result);

exit();