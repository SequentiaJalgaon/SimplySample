<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

$fixedInterval = "24 HOUR";
$otpExpiryTime = "180 SECOND";

$REQUEST_METHOD = $_SERVER["REQUEST_METHOD"];
$result = "";

if($REQUEST_METHOD == "POST") {
    
    $userInfo = json_decode(file_get_contents('php://input'), true);    
    
    $mobile_number = "";
    // $is_resend = 0;

    if(isset($userInfo['mobile_number'])) {
        $mobile_number = trim($userInfo['mobile_number']);
    }
    
    // if(isset($userInfo['is_resend'])) {
    //     $is_resend = (int)$userInfo['is_resend'];
    // }    
    
    if($mobile_number == "" || strlen($mobile_number) != 10) {
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
        $startTime = date("Y-m-d H:i:s");
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

                    $sql = "SELECT * FROM user_vs_verification_code WHERE mobile_number = ? and  user_id = ? and added_on >= NOW() - INTERVAL ".$fixedInterval." ORDER BY id_user_verification_code DESC";
                    $q = $pdo->prepare($sql);
                    $q->execute(array($mobile_number, $user_id));
                    $otpRequested = $q->fetchAll(PDO::FETCH_ASSOC);
                    
                    $lastOTPRequestedTime = "";
                    // $lastOTPExpiryTime = "";
                    $_24hoursOTPCountWithoutResend = 0;
                    // $_24hoursOTPCountWithResend = 0;
                    $verification_code = random_int(100000, 999999);

                    if(count($otpRequested) > 0)   {       
                        foreach($otpRequested as $otpRequest) {
                            
                            // Way - 1
                            ++$_24hoursOTPCountWithoutResend;

                            if($lastOTPRequestedTime == "" && $otpRequest['added_on'] != "" && $otpRequest['expiry_time'] != null) {
                                $lastOTPRequestedTime = $otpRequest['added_on'];
                            }

                            
                            // Way - 2
                            // if($lastOTPRequestedTime == "" && $otpRequest['added_on'] != "" && $otpRequest['expiry_time'] != null) {
                            //     $lastOTPRequestedTime = $otpRequest['added_on'];
                            // }

                            // if($lastOTPExpiryTime == "" && $otpRequest['expiry_time'] != "" && $otpRequest['expiry_time'] != null) {
                            //     $lastOTPExpiryTime = $otpRequest['expiry_time'];
                            // }

                            // if($otpRequest['is_resend'] > 0) {
                            //     ++$_24hoursOTPCountWithResend;                                
                            // }
                            // else {
                                // ++$_24hoursOTPCountWithoutResend;
                            // }
                        }
                        
                        if(date('Y-m-d H:i:s', strtotime('+1 minutes', strtotime($lastOTPRequestedTime))) < $startTime) {
                            
                            // Restrict user for OTP request in last 24 hours 
                            if($_24hoursOTPCountWithoutResend < 3)  {                        
                                
                                
                                $dbOtpExpiryTime = date('Y-m-d H:i:s', strtotime('+3 minutes', strtotime($startTime)));
    
                                $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                                $sql = "INSERT INTO user_vs_verification_code(user_id, mobile_number, verification_code, added_on, expiry_time) VALUES (?,?,?,?,?)";
                                $q = $pdo->prepare($sql);
                                $isInserted = $q->execute([$user_id, $mobile_number, $verification_code, $startTime, $dbOtpExpiryTime ]);
                                $authkey = $pdo->lastInsertId();
                                $result = [
                                    "data" => "OTP generated successfully.",
                                    "title" => $mobile_number,
                                    "authkey" => $authkey,
                                    "status" => "success",
                                    'statusCode' => 200
                                ];
    
                            } else {
                                // You have exhasusted the limit to login throught OTP, please try using password
                                // after fixed interval
                                $result= ([
                                    "data" => "You have exceeded the maximum attempts to login throught OTP, please try using password",
                                    "title" => $mobile_number,
                                    "status" => "fail",
                                    "statusCode" => 202
                                ]);
                            }
                        } else {
                            // Please wait for a minute before requesting another OTP
                            $result= ([
                                "data" => "Please wait for a minute before requesting another OTP",
                                "title" => $mobile_number,
                                "status" => "fail",
                                "statusCode" => 202
                            ]);
                        }
                    } else {
                        // Way - 1
                        // If otp requesting before 1 minute
                        
                            $dbOtpExpiryTime = date('Y-m-d H:i:s', strtotime($otpExpiryTime, strtotime($startTime)));

                            $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                            $sql = "INSERT INTO user_vs_verification_code(user_id, mobile_number, verification_code, added_on, expiry_time) VALUES (?,?,?,?,?)";
                            $q = $pdo->prepare($sql);
                            $isInserted = $q->execute([$user_id, $mobile_number, $verification_code, $startTime, $dbOtpExpiryTime ]);
                            $authkey = $pdo->lastInsertId();
                            $result = [
                                "data" => "OTP generated successfully.",
                                "title" => $mobile_number,
                                "authkey" => $authkey,
                                "status" => "success",
                                'statusCode' => 200
                            ];
                        
                    }
                    

                    


                    // Way - 2 - Incomplete
                    // Checking wheather there is an active OTP
                    // if($lastOTPExpiryTime < date("Y-m-d H:i:s"))  {                        
                        
                    //     $startTime = date("Y-m-d H:i:s");
                    //     $dbOtpExpiryTime = date('Y-m-d H:i:s', strtotime('+3 minutes', strtotime($startTime)));

                    //     $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                    //     $sql = "INSERT INTO user_vs_verification_code(user_id, mobile_number, verification_code, added_on, expiry_time) VALUES (?,?,?,?,?)";
                    //     $q = $pdo->prepare($sql);
                    //     $isInserted = $q->execute([$user_id, $mobile_number, $verification_code, $startTime, $dbOtpExpiryTime ]);
                    // }

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