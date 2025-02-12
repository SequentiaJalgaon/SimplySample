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

    $sql = "SELECT * FROM address ";
    $q = $pdo->query($sql);
    // print_R($sql);
    // exit();
    
    foreach ($pdo->query($sql) as $row) 
    {

        $categoryElement = array (

            "address_id"=> $row["address_id"],
            "user_id"=> $row["user_id"],
            "line_1"=> $row["line_1"],
            "line_2"=> $row["line_2"],
            "city"=> $row["city"],
            "state"=> $row["state"],
            "zipcode"=> $row["zipcode"]
        );

        array_push($categories, $categoryElement);
    }

    if(count($categories) > 0) {
     
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