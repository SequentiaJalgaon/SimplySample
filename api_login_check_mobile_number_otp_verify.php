<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

date_default_timezone_set("Asia/Kolkata");

$fixedInterval = "24 HOUR";
$otpExpiryTime = "180 SECOND"; // In Seconds

$REQUEST_METHOD = $_SERVER["REQUEST_METHOD"];
$result = "";

$currentdDateTime = date('Y-m-d H:i:s');

if($REQUEST_METHOD == "POST") {
    
    $userInfo = json_decode(file_get_contents('php://input'), true);    
    
    $mobile_number = "";
    $verification_code = "";
    $authkey = 0;

    if(isset($userInfo['mobile_number'])) {
        $mobile_number = trim($userInfo['mobile_number']);
    }
    
    if(isset($userInfo['verification_code'])) {
        $verification_code = (int)$userInfo['verification_code'];
    }    
    
    if(isset($userInfo['authkey'])) {
        $authkey = (int)$userInfo['authkey'];
    }    
    
    
    if($mobile_number == "" || strlen($mobile_number) != 10 || $verification_code == "" || strlen($verification_code) != 6 ) {
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
            
                if($mobileFound['is_active'] == '0') {
                    $result= ([
                        "data" => "User is suspended",
                        "title" => $mobile_number,
                        "status" => "fail",
                        "statusCode" => 202
                    ]);
                    echo json_encode($result);
                    exit();
                } 

                if($mobileFound['is_active'] == '1') {

                    $user_id = $mobileFound['user_id'];

                    // $sql = "SELECT * FROM user_vs_verification_code WHERE mobile_number = ? and user_id = ? and added_on >= NOW() - INTERVAL ".$fixedInterval." ORDER BY id_user_verification_code DESC";

                    $sql = "SELECT * FROM user_vs_verification_code WHERE mobile_number = ? AND verification_code = ? AND user_id = ? ORDER BY id_user_verification_code DESC";
                    $q = $pdo->prepare($sql);
                    $q->execute(array($mobile_number, $verification_code, $user_id));
                    $resultsFound = $q->fetchAll(PDO::FETCH_ASSOC);
                    
                    if(count($resultsFound) > 0) {
                        foreach($resultsFound as $resultFound) {
                            // $resultFound['expiry_time']= (int)$resultFound['expiry_time'];
                            // $optExpiryTime = date('Y-m-d H:i:s', strtotime( "+".$resultFound['expiry_time']." SECOND", strtotime($resultFound['added_on'])));
                            
                            $optExpiryTime = date('Y-m-d H:i:s', strtotime( "+".$otpExpiryTime, strtotime($resultFound['added_on'])));
                          
                            if ($optExpiryTime >= $currentdDateTime) {
                                        
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
                                    "data" => "OTP is expired",
                                    "title" => $mobile_number,
                                    "status" => "fail",
                                    "statusCode" => 202
                                ]);
                            }

                        }
                    } else if($authkey) {
                        $sql = "SELECT * FROM user_vs_verification_code WHERE id_user_verification_code = ? ORDER BY id_user_verification_code DESC";
                        $q = $pdo->prepare($sql);
                        $q->execute(array($authkey));
                        $resultsFound = $q->fetch(PDO::FETCH_ASSOC);

                        if($resultsFound) {
                            $result= ([
                                "data" => "Incorrect Mobile Number OR Invalid Verification Code",
                                "title" => $mobile_number,
                                "status" => "fail",
                                "statusCode" => 202
                            ]);
                        } else {
                            $result= ([
                                "data" => "Infomation Not Found",
                                "title" => $mobile_number,
                                "status" => "fail",
                                "statusCode" => 403
                            ]);
                        }
                        
                    } else {
                        $result= ([
                            "data" => "OTP is invalid",
                            "title" => $mobile_number,
                            "status" => "fail",
                            "statusCode" => 202
                        ]);
                    }

                } else {
                        $result = array(
                            'data' => null, 
                            "title" => null,
                            'status' => false, 
                            'statusCode' => 402);
                }
            
        } else {
            $result= ([
                "data" => "Mobile Number Not Found",
                "title" => $mobile_number,
                "status" => "fail",
                "statusCode" => 400
            ]);
        }
    }    

}
else {
    $result = array(
        'data' => 'Requested Method is not supported', 
        "title" => null,
        'status' => false, 
        'statusCode' => 401);
}

if($result == null) {
    $result = array(
        'data' => null, 
        "title" => null,
        'status' => false, 
        'statusCode' => 401);
}
echo json_encode($result);

exit();