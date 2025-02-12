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

    // Check if user_id is provided in the request
    if (!isset($_GET['user_id']) || empty($_GET['user_id'])) {
        echo json_encode([
            'message' => 'User ID is required',
            'status' => false,
            'statusCode' => 400
        ]);
        exit();
    }

    $user_id = $_GET['user_id'];

    // Fetch orders for the specific user
    // $sql = "SELECT * FROM orders WHERE user_id = ?";
    $sql = "SELECT * FROM orders WHERE user_id = ? And status='Delivered' ";
    $stmt = $pdo->prepare($sql);
    $stmt->execute([$user_id]);
    $orders = $stmt->fetchAll(PDO::FETCH_ASSOC);

    if (!empty($orders)) {
        $result = [
            'data' => $orders,
            'message' => 'Users order data fetch successfully',
            'status' => true,
            'statusCode' => 200
        ];
    } else {
        $result = [
            'message' => 'No orders found for this user',
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
