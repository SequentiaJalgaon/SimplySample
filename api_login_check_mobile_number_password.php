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
    
    $userInfo = json_decode(file_get_contents('php://input'), true);
    
    
    $mobile_number = "";
    $password = "";
    
    if(isset($userInfo['mobile_number'])) {
        $mobile_number = trim($userInfo['mobile_number']);
    }
    if(isset($userInfo['password'])) {
        $password = $userInfo['password'];
    }
    
    // if($mobile_number == "" || $password == "" || strlen($mobile_number) != 10 || !preg_match('/^(?=.*\d)(?=.*[\W_]).{6,}$/', $password)) {
    if($mobile_number == "" || $password == "" || strlen($mobile_number) != 10) {
        $result= ([
            "data" => "Incorrect information.",
            "title" => $mobile_number,
            "status" => "fail",
            "statusCode" => 202
        ]);
        echo json_encode($result);
        exit();
    }

    include("dist/conf/db.php");
    $pdo = Database::connect();
    
    {
        $sql = "SELECT * FROM users WHERE mobile_number = ?";
        $q = $pdo->prepare($sql);
        $q->execute(array($mobile_number));
        $mobileFound = $q->fetch(PDO::FETCH_ASSOC);
        
        if($mobileFound != false) {
            
            if (password_verify($password, $data['password'])) 
            // if ($password == $mobileFound['password']) 
            {
                if($mobileFound['is_active'] == 0) {
                    $result= ([
                        "data" => "User is suspended",
                        "title" => $mobile_number,
                        "status" => "fail",
                        "statusCode" => 202
                    ]);
                    echo json_encode($result);
                    exit();
                }
                
                $user_id = $mobileFound['user_id'];
                
                $addressArray = [];
                $sqluser_vs_address = "SELECT * FROM user_vs_address WHERE user_id = '$user_id' and is_active = '1'";
                $quser_vs_address = $pdo->query($sqluser_vs_address);
                foreach ($pdo->query($sqluser_vs_address) as $rowuser_vs_address)
                { 
                    $addressDetails = [
                        "Line_1" => $rowuser_vs_address["address_line_1"],
                        "Line_2" => $rowuser_vs_address["address_line_2"],
                        "Taluka" => $rowuser_vs_address["taluka"],
                        "City" => $rowuser_vs_address["city"],
                        "State" => $rowuser_vs_address["state"],
                        "Pincode" => $rowuser_vs_address["pincode"]
                    ];
                    
                    array_push($addressArray, $addressDetails);
                }
                
                $categoryArray = [];
                $user_id = $mobileFound['user_id'];
                $sqluser_vs_address = "SELECT 
                        c.category_id, 
                        c.category_name, 
                        c.category_image,
                        uc.is_active as userCategoryActive,
                        c.is_active as categoryActive
                FROM 
                    user_vs_category uc
                JOIN 
                    category c 
                ON  
                    uc.category_id = c.category_id
                WHERE 
                        uc.user_id = '$user_id'
                ";
                    // and uc.is_active = "1"
                    // and c.is_active = "1"
                $quser_vs_address = $pdo->query($sqluser_vs_address);
                foreach ($pdo->query($sqluser_vs_address) as $rowuser_vs_address)
                { 
                    $categoryDetails = [
                        "category_id" => $rowuser_vs_address["category_id"],
                        "category_name" => $rowuser_vs_address["category_name"],
                        "category_image" => $rowuser_vs_address["category_image"],
                        "UserCategoryActive" => $rowuser_vs_address["userCategoryActive"],
                        "CategoryActive" => $rowuser_vs_address["categoryActive"]
                    ];
                    array_push($categoryArray, $categoryDetails);
                }

                $userDetails = [
                    "UserId" => $mobileFound['user_id'],
                    "FirstName" => $mobileFound['first_name'],
                    "LastName" => $mobileFound['last_name'],
                    "MobileNumber" => $mobileFound['mobile_number'],
                    "Gender" => $mobileFound['gender'],
                    "ProfilePhoto" => $mobileFound['profile_photo'],
                    "Addresses" => $addressArray,
                    "Categories" => $categoryArray
                ];
                
                $result= ([
                    "data" => $userDetails,
                    "title" => $mobile_number,
                    "status" => "success",
                    "statusCode" => 200
                ]);

            } else {
                $result= ([
                    "data" => "Incorrect Password",
                    "title" => $mobile_number,
                    "status" => "fail",
                    "statusCode" => 202
                ]);
            }
        } else {
            $result= ([
                "data" => "Mobile Number Not Found",
                "title" => $mobile_number,
                "status" => "fail",
                "statusCode" => 200
            ]);
        }
    }    

}
else {
    $result = array(
        'data' => 'Requested Method is not supported', 
        "title" => null,
        'status' => false, 
        'statusCode' => 405);
}

if($result == null) {
    $result = array(
        'data' => null, 
        "title" => null,
        'status' => false, 
        'statusCode' => 204);
}
echo json_encode($result);

exit();