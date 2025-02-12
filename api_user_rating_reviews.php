<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

$REQUEST_METHOD = $_SERVER["REQUEST_METHOD"];

if ($REQUEST_METHOD == "POST") {
    $userInfo = json_decode(file_get_contents('php://input'), true);

    if (!$userInfo) {
        echo json_encode(["data" => "Invalid JSON input", "status" => "fail", "statusCode" => 400]);
        exit();
    }

    include("dist/conf/db.php");
    $pdo = Database::connect();

    // Required Fields
    $requiredFields = ['user_id', 'order_id', 'product_id', 'rating', 'message'];
    foreach ($requiredFields as $field) {
        if (!isset($userInfo[$field]) || empty($userInfo[$field])) {
            echo json_encode(["data" => ucfirst(str_replace("_", " ", $field)) . " cannot be empty.", "status" => "fail", "statusCode" => 400]);
            exit();
        }
    }

    $user_id = trim($userInfo['user_id']);
    $order_id = trim($userInfo['order_id']); // Single value now
    $product_ids = $userInfo['product_id']; // Array
    $ratings = $userInfo['rating']; // Array
    $messages = $userInfo['message']; // Array

    // Validate Arrays Length
    if (count($product_ids) !== count($ratings) || count($product_ids) !== count($messages)) {
        echo json_encode(["data" => "Array lengths do not match", "status" => "fail", "statusCode" => 400]);
        exit();
    }

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

    // Check if Order Exists
    $sqlCheckOrder = "SELECT * FROM orders WHERE order_id = ?";
    $qOrder = $pdo->prepare($sqlCheckOrder);
    $qOrder->execute([$order_id]);
    if (!$qOrder->fetch(PDO::FETCH_ASSOC)) {
        echo json_encode(["data" => "Order ID $order_id does not exist", "status" => "fail", "statusCode" => 404]);
        exit();
    }

    // Validate All Data Before Inserting
    foreach ($product_ids as $i => $product_id) {
        $product_id = trim($product_id);
        $rating = trim($ratings[$i]);

        // Validate rating (should be between 1-5)
        if ($rating < 1 || $rating > 5) {
            echo json_encode(["data" => "Invalid rating for product ID $product_id (must be 1-5)", "status" => "fail", "statusCode" => 400]);
            exit();
        }

        // Check if Product Exists
        $sqlCheckProduct = "SELECT * FROM products WHERE product_id = ?";
        $qProduct = $pdo->prepare($sqlCheckProduct);
        $qProduct->execute([$product_id]);
        if (!$qProduct->fetch(PDO::FETCH_ASSOC)) {
            echo json_encode(["data" => "Product ID $product_id does not exist", "status" => "fail", "statusCode" => 404]);
            exit();
        }
    }

    // If all validations pass, start transaction
    $pdo->beginTransaction();

    try {
        // Insert Reviews for Each Product
        $insertedReviews = 0;
        for ($i = 0; $i < count($product_ids); $i++) {
            $product_id = trim($product_ids[$i]);
            $rating = trim($ratings[$i]);
            $message = trim($messages[$i]);

            $sqlInsert = "INSERT INTO rating_review (user_id, order_id, product_id, rating, message) VALUES (?, ?, ?, ?, ?)";
            $stmtInsert = $pdo->prepare($sqlInsert);
            $stmtInsert->execute([$user_id, $order_id, $product_id, $rating, $message]);

            $insertedReviews++;
        }

        // Commit transaction
        $pdo->commit();

        echo json_encode([
            "data" => "$insertedReviews reviews added successfully.",
            "status" => "success",
            "statusCode" => 200
        ]);
    } catch (Exception $e) {
        // Rollback transaction if something fails
        $pdo->rollBack();
        echo json_encode(["data" => "Error inserting reviews: " . $e->getMessage(), "status" => "fail", "statusCode" => 500]);
    }

} else {
    echo json_encode(["data" => "Invalid request method", "status" => "fail", "statusCode" => 405]);
}

exit();
