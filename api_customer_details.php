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

    $sql = "SELECT * FROM users";
    $q = $pdo->query($sql);
    // print_R($sql);
    // exit();
    
    foreach ($pdo->query($sql) as $row) 
    {
        // print_R($row);
        // exit();

        $categoryElement = array (

            "id"=> $row["user_id"],
            "customer"=> $row["first_name"],
            "customer_id"=> $row["user_id"],
            "email"=> $row["email"],
            "country"=> "",
            "country_code"=> "",
            "order"=> "",
            "total_spent"=> "",
            "image"=> "3.png",
            "contact"=> $row["mobile_number"]
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
 else {
    $result = array(
        'message' => 'Requested Method is not supported', 
        'status' => false, 
        'statusCode' => 200);
}
echo json_encode($result);
exit();