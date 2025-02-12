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

    // Check if user_id and order_id are provided
    if (!isset($_GET['user_id']) || empty($_GET['user_id']) || !isset($_GET['order_id']) || empty($_GET['order_id'])) {
        echo json_encode([
            'message' => 'User ID and Order ID are required',
            'status' => false,
            'statusCode' => 400
        ]);
        exit();
    }

    $user_id = $_GET['user_id'];
    $order_id = $_GET['order_id'];

    // Fetch order details for the specific user and order ID
    $sql = "SELECT * FROM orders WHERE user_id = ? AND order_id = ?";
    $stmt = $pdo->prepare($sql);
    $stmt->execute([$user_id, $order_id]);
    $orders = $stmt->fetchAll(PDO::FETCH_ASSOC);

    if (!empty($orders)) {
        // Since order_id is unique, there will be at most one order
        $order = $orders[0];

        $order = array_map('trim', $orders[0]);

        $id_user_vs_address = $order['user_address_id'] ?? null;
        // $id_user_vs_address = 1;
        
        // Fetch products related to this order
        $sql1 = "SELECT * FROM order_vs_product WHERE order_id = ?";
        $stmt1 = $pdo->prepare($sql1);
        $stmt1->execute([$order_id]);
        $order_products = $stmt1->fetchAll(PDO::FETCH_ASSOC);

        $sqladdr = "SELECT * FROM user_vs_address WHERE id_user_vs_address = ?";
        $stmt_addr = $pdo->prepare($sqladdr);
        $stmt_addr->execute([$id_user_vs_address]);
        $order_addr = $stmt_addr->fetch(PDO::FETCH_ASSOC);

        // print_r($id_user_vs_address);
        // exit();

        $result = [
            'order_data' => $order,
            'product_data' => $order_products,
            'address_data' => $order_addr,
            'message' => 'User order data fetched successfully',
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
