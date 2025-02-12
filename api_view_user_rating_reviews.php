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
    // Get query parameters
    $user_id = isset($_GET['user_id']) ? trim($_GET['user_id']) : null;
    $order_id = isset($_GET['order_id']) ? trim($_GET['order_id']) : null;
    // product ID's are Optional
    $product_ids = isset($_GET['product_id']) ? explode(",", $_GET['product_id']) : null;

    // Check if user_id and order_id are provided
    if (!$user_id || !$order_id) {
        echo json_encode(["data" => "user_id and order_id are required.", "status" => "fail", "statusCode" => 400]);
        exit();
    }

    include("dist/conf/db.php");
    $pdo = Database::connect();

    // Check if User Exists and is Active
    $sqlUser = "SELECT * FROM users WHERE user_id = ?";
    $qUser = $pdo->prepare($sqlUser);
    $qUser->execute([$user_id]);
    $userFound = $qUser->fetch(PDO::FETCH_ASSOC);

    if (!$userFound) {
        echo json_encode(["data" => "User not found", "status" => "fail", "statusCode" => 404]);
        exit();
    }

    if ($userFound['is_active'] == '0') {
        echo json_encode(["data" => "User is suspended", "status" => "fail", "statusCode" => 403]);
        exit();
    }

    // Prepare the Query
    // $sql = "SELECT rr.rating, rr.message, rr.product_id, rr.order_id, p.product_name, p.product_description, pd.file_name
    //         FROM rating_review rr
    //         INNER JOIN products p ON rr.product_id = p.product_id
    //         LEFT JOIN product_images pd ON rr.product_id = pd.product_id
    //         WHERE rr.user_id = ? AND rr.order_id = ?";

    $sql = "SELECT 
        rr.id, rr.order_id, rr.product_id, rr.user_id, rr.added_on, rr.status, rr.rating, rr.message,
        p.product_name, p.product_description, pd.file_name,
        u.first_name,
        ovp.product_weight, ovp.product_price
    FROM rating_review rr
    INNER JOIN products p ON rr.product_id = p.product_id
    INNER JOIN users u ON rr.user_id = u.user_id
    INNER JOIN orders o ON rr.order_id = o.order_id
    LEFT JOIN product_images pd ON rr.product_id = pd.product_id
    INNER JOIN order_vs_product ovp ON rr.product_id = ovp.product_id AND rr.order_id = ovp.order_id
    WHERE rr.user_id = ? AND rr.order_id = ?";

    

    // Add product_id filter if provided
    if ($product_ids) {
        $placeholders = implode(',', array_fill(0, count($product_ids), '?'));
        $sql .= " AND rr.product_id IN ($placeholders)";
    }

    // Prepare the query
    $stmt = $pdo->prepare($sql);
    
    // Bind parameters
    $params = [$user_id, $order_id];
    
    // Bind product_id parameters if provided
    if ($product_ids) {
        foreach ($product_ids as $product_id) {
            $params[] = $product_id;
        }
    }

    // Execute the query
    $stmt->execute($params);

    // Fetch reviews
    $reviews = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // print_r($sql);
    // exit();

    if ($reviews) {
        echo json_encode([
            "data" => $reviews,
            "status" => "success",
            "statusCode" => 200
        ]);
    } else {
        echo json_encode(["data" => "No reviews found", "status" => "fail", "statusCode" => 404]);
    }

} else {
    echo json_encode(["data" => "Invalid request method", "status" => "fail", "statusCode" => 405]);
}

exit();
