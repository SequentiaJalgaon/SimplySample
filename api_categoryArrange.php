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


if($REQUEST_METHOD == "POST") {
    
    parse_str(file_get_contents('php://input'), $categorySeuqnceArray);
    $categorySeuqnceArray = (array) json_decode(file_get_contents('php://input'));
    
    include("dist/conf/db.php");
    $pdo = Database::connect();
    
    if(isset($categorySeuqnceArray) && count($categorySeuqnceArray) > 0) {
        
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $sql = "UPDATE `category_sequence` SET `is_active` = '0' ";
        $q = $pdo->prepare($sql);
        $isAdded = $q->execute(array());

        foreach($categorySeuqnceArray as $categorySeuqnceElement)
        {
            $categorySeuqnceElement = (array)$categorySeuqnceElement;
            $CategoryId = $categorySeuqnceElement["CategoryId"];
            $SequenceId = $categorySeuqnceElement["SequenceId"];
            
            if($CategoryId != 0 && $SequenceId != 0) {
                $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                $sql = "INSERT INTO `category_sequence`(`category_id`,`sequence_number`,`is_active`) VALUES (?,?,?)";
                $q = $pdo->prepare($sql);
                $addedResult = $q->execute(array($CategoryId, $SequenceId, '1'));
            }
        }

        $result= ([
            "message" => "Category Sequence Updated successfully.",
            "categoryTitle" => "",
            "status" => "success",
            'statusCode' => 200
        ]);

    } else {
        $result= ([
            "message" => "Category Sequence Updation Failed.",
            "categoryTitle" => "",
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