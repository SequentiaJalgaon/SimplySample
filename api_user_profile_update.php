<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET, POST");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

include("dist/conf/db.php");
$pdo = Database::connect();

$REQUEST_METHOD = $_SERVER["REQUEST_METHOD"];
$result = [];
$currentDateTime = date('Y-m-d H:i:s');

if ($REQUEST_METHOD == "GET") {
    // Handle GET request to fetch user details with categories
    if (!isset($_GET['user_id']) && !isset($_GET['mobile_number'])) {
        echo json_encode([
            "data" => "User ID or Mobile Number is required.",
            "title" => "",
            "status" => "fail",
            "statusCode" => 400
        ]);
        exit();
    }

    $user_id = $_GET['user_id'] ?? null;
    $mobile_number = $_GET['mobile_number'] ?? null;

    // Fetch user details
    $sql = "SELECT * FROM users WHERE user_id = ? OR mobile_number = ?";
    $q = $pdo->prepare($sql);
    $q->execute([$user_id, $mobile_number]);
    $user = $q->fetch(PDO::FETCH_ASSOC);

    if ($user) {
        // Fetch user categories

        // $sqlCategories = "SELECT c.category_id, c.category_name 
        //                   FROM user_vs_category uc
        //                   JOIN category c ON uc.category_id = c.category_id
        //                   WHERE uc.user_id = ? AND uc.is_active = 1";
        // $qCategories = $pdo->prepare($sqlCategories);
        // $qCategories->execute([$user['user_id']]);
        // $categories = $qCategories->fetchAll(PDO::FETCH_ASSOC);

        $sqlCategories = "SELECT * FROM user_vs_category WHERE user_id = ? AND is_active = '1'";
        $qCategories = $pdo->prepare($sqlCategories);
        $qCategories->execute([$user['user_id']]);
        $categories = $qCategories->fetchAll(PDO::FETCH_ASSOC);

        // print_r($sqlCategories);
        // exit();

        echo json_encode([
            "data" => [
                "user" => $user,
                "categories" => $categories
            ],
            "title" => "User Found",
            "status" => "success",
            "statusCode" => 200
        ]);
    } else {
        echo json_encode([
            "data" => "User Not Found",
            "title" => "",
            "status" => "fail",
            "statusCode" => 404
        ]);
    }
    exit();
}

if ($REQUEST_METHOD == "POST") {
    $userInfo = json_decode(file_get_contents('php://input'), true);

    $requiredFields = ['user_id', 'mobile_number', 'first_name', 'last_name', 'gender', 'city', 'state', 'zipcode', 'profile_photo', 'categories'];
    foreach ($requiredFields as $field) {
        if (empty($userInfo[$field])) {
            echo json_encode([
                "data" => ucfirst(str_replace("_", " ", $field)) . " cannot be empty.",
                "title" => "",
                "status" => "fail",
                "statusCode" => 400
            ]);
            exit();
        }
    }

    $user_id = trim($userInfo['user_id']);
    $mobile_number = trim($userInfo['mobile_number']);
    $first_name = trim($userInfo['first_name']);
    $last_name = trim($userInfo['last_name']);
    $gender = trim($userInfo['gender']);
    $city = trim($userInfo['city']);
    $state = trim($userInfo['state']);
    $zipcode = trim($userInfo['zipcode']);
    $profile_photo = trim($userInfo['profile_photo']);
    $categories = $userInfo['categories'];

    $sql = "SELECT * FROM users WHERE user_id = ? AND mobile_number = ?";
    $q = $pdo->prepare($sql);
    $q->execute([$user_id, $mobile_number]);
    $userExists = $q->fetch(PDO::FETCH_ASSOC);

    if (!$userExists) {
        echo json_encode([
            "data" => "User not found.",
            "title" => "",
            "status" => "fail",
            "statusCode" => 404
        ]);
        exit();
    }

    if ($userExists['is_active'] == '0') {
        echo json_encode([
            "data" => "This User is suspended.",
            "title" => "",
            "status" => "fail",
            "statusCode" => 403
        ]);
        exit();
    }

    $sqlUpdate = "UPDATE users SET first_name = ?, last_name = ?, gender = ?, profile_photo = ?, city = ?, state = ?, pincode = ? WHERE mobile_number = ? AND user_id = ?";
    $qUpdate = $pdo->prepare($sqlUpdate);
    $qUpdate->execute([$first_name, $last_name, $gender, $profile_photo, $city, $state, $zipcode, $mobile_number, $user_id]);

    // Update categories
    $categoriesString = implode(",", array_map('intval', $categories));
    $sql = "SELECT category_id FROM category WHERE category_id IN ($categoriesString)";
    $q = $pdo->prepare($sql);
    $q->execute();
    $categoriesFound = $q->fetchAll(PDO::FETCH_ASSOC);

    if ($categoriesFound) {
        $pdo->prepare("UPDATE user_vs_category SET is_active = '0' WHERE user_id = ?")->execute([$user_id]);

        foreach ($categoriesFound as $category) {
            $categoryId = $category['category_id'];
            $q = $pdo->prepare("SELECT COUNT(*) FROM user_vs_category WHERE user_id = ? AND category_id = ?");
            $q->execute([$user_id, $categoryId]);
            $exists = $q->fetchColumn();

            if ($exists) {
                $pdo->prepare("UPDATE user_vs_category SET is_active = '1' WHERE user_id = ? AND category_id = ?")->execute([$user_id, $categoryId]);
            } else {
                $pdo->prepare("INSERT INTO user_vs_category(user_id, category_id, is_active) VALUES (?, ?, '1')")->execute([$user_id, $categoryId]);
            }
        }
    }

    echo json_encode([
        "data" => "User and categories updated successfully.",
        "title" => "",
        "status" => "success",
        "statusCode" => 200
    ]);
    exit();
}

// If method is not GET or POST
echo json_encode([
    "data" => "Method Not Allowed",
    "title" => "",
    "status" => "fail",
    "statusCode" => 405
]);
exit();
?>
