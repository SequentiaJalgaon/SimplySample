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
                cat_subcat_id, category_id, category_name, sub_category_id, sub_category_name, sc.is_active as catsub_is_active, s.is_active as sub_is_active , c.is_active as cat_is_active
        FROM    category_vs_subcategory sc
        JOIN    category c ON sc.cat_id = c.category_id
        JOIN    sub_category s ON sc.sub_cat_id = s.sub_category_id
        WHERE   sc.is_active = '1'
    ";
    $q = $pdo->query($sql);
    foreach ($pdo->query($sql) as $row) 
    {
        $sub_categoryElement = array (
            "id" => $row["cat_subcat_id"],
            "sub_categoryID" => $row["sub_category_id"],
            "sub_categoryName" => $row["sub_category_name"],
            "ca tegoryID" => $row["category_id"],
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

                $sql = "SELECT * FROM category_vs_subcategory WHERE cat_id = ? and sub_cat_id = ?";
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