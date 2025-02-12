<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

$REQUEST_METHOD = $_SERVER["REQUEST_METHOD"];

if ($REQUEST_METHOD == "GET") {
    include("dist/conf/db.php");
    $pdo = Database::connect();

    // Check if rating_review_id is provided in the request
    if (!isset($_GET['rating_review_id']) || empty($_GET['rating_review_id'])) {
        echo json_encode([
            'message' => 'Rating Review ID is required',
            'status' => false,
            'statusCode' => 400
        ]);
        exit();
    }

    $rating_review_id = $_GET['rating_review_id'];

    


    // Fetch address for the specific user
    $sql = "SELECT * FROM rating_review WHERE id = ?";
    $stmt = $pdo->prepare($sql);
    $stmt->execute([$rating_review_id]);
    $rating_data = $stmt->fetch(PDO::FETCH_ASSOC);

    // print_r($rating_review_id);
    // exit();

    if (!empty($rating_data)) {
        $result = [
            'data' => $rating_data,
            'message' => 'Users rating data fetch successfully',
            'status' => true,
            'statusCode' => 200
        ];
    } else {
        $result = [
            'message' => 'No rating found for this user',
            'status' => false,
            'statusCode' => 404
        ];
    }
} else {
    $result = [
        'message' => 'Requested Method is not supported',
        'status' => false,
        'statusCode' => 405
    ];
}

echo json_encode($result);
exit();
