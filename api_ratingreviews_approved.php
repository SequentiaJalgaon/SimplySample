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

// print_R(hello);
// exit();

if($REQUEST_METHOD == "GET") {

    include("dist/conf/db.php");
    $pdo = Database::connect();


    $categories = array();
    // $sql = "SELECT * FROM rating_review";
    $sql = "
        SELECT 
            rr.id, rr.order_id, rr.product_id, rr.user_id, rr.added_on, rr.status, rr.rating, rr.message,
            p.product_id,
            p.product_name,
            p.product_description,
            u.first_name,
            u.last_name,
            u.email,
            u.profile_photo,
            pd.file_name,
            pm.brand_id,
            pm.product_id,
            b.brand_id,
            b.brand_name
        FROM rating_review rr
        INNER JOIN products p ON rr.product_id = p.product_id
        INNER JOIN users u ON rr.user_id = u.user_id
        INNER JOIN orders o ON rr.order_id = o.order_id
        LEFT JOIN product_images pd ON rr.product_id = pd.product_id
        INNER JOIN product_mapping pm ON rr.product_id = pm.product_id
        INNER JOIN brands b ON pm.brand_id = b.brand_id

        WHERE rr.status = 'Approved'
        GROUP BY rr.id order by rr.id desc
    ";
    $q = $pdo->query($sql);
    // print_R($sql);
    // exit();
    // foreach ($pdo->query($sql) as $row) 
    foreach ($q as $row) 
    {

        // SERVER PATH (Dynamic)
        // $row["file_name"] != "" ? $productImage = "http://".$_SERVER['HTTP_HOST']."/simplysample/uploads/productIamges/".$row["file_name"] : $productImage = "";
        // $row["profile_photo"] != "" ? $userImage = "http://".$_SERVER['HTTP_HOST']."/simplysample/uploads/userImages/".$row["file_name"].$row["profile_photo"] : $userImage = "";

        // LOCAL PATH (Dynamic)
        $row["file_name"] != "" ? $productImage = "http://".$_SERVER['HTTP_HOST']."/gvk/ss_with_api_nir/simply_sample_materialize/uploads/productIamges/".$row["file_name"] : $productImage = "http://".$_SERVER['HTTP_HOST']."/gvk/ss_with_api_nir/simply_sample_materialize/assets/img/products/card-weekly-sales-watch.png";

        $row["profile_photo"] != "" ? $userImage = "http://".$_SERVER['HTTP_HOST']."/gvk/ss_with_api_nir/simply_sample_materialize/uploads/userImages/".$row["profile_photo"] : $userImage = "http://".$_SERVER['HTTP_HOST']."/gvk/ss_with_api_nir/simply_sample_materialize/assets/img/avatars/1.png";

        // STATIC path(for check)
        // $productImage = "http://".$_SERVER['HTTP_HOST']."/gvk/ss_with_api_nir/simply_sample_materialize/assets/img/products/woodenchair.png";
        // $userImage = "http://".$_SERVER['HTTP_HOST']."/gvk/ss_with_api_nir/simply_sample_materialize/assets/img/avatars/1.png";

        $categoryElement = array (

            "id"=> $row["id"],
            "order_id"=> $row["order_id"],
            "product_id"=> $row["product_id"],
            "product_name"=> $row["product_name"],
            // "product_description"=> $row["product_description"],
            "product_description"=> $row["brand_name"],
            "product_image"=> $productImage,
            "reviewer"=> $row["first_name"]. " ".$row["last_name"],
            "email"=> $row["email"],
            // "avatar"=> "1.png",
            "avatar"=> $userImage,
            "date"=> $row["added_on"],
            "status"=> $row["status"],
            "review"=> $row["rating"],
            "head"=> "",
            "para"=> $row["message"]

            // "id"=> $row["order_id"],
            // "product"=> $row["order_id"],
            // "company_name"=> $row["order_id"],
            // "product_image"=> $row["order_id"],
            // "reviewer"=> $row["order_id"],
            // "email"=> $row["order_id"],
            // "avatar"=> "",
            // "date"=> $row["added_on"],
            // "status"=> $row["status"],
            // "review"=> $row["rating"],
            // "head"=> "",
            // "para"=> $row["message"]

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
    //

} else {
    $result = array(
        'message' => 'Requested Method is not supported', 
        'status' => false, 
        'statusCode' => 200);
}

echo json_encode($result);

exit();