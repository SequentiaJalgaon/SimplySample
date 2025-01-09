<?php
    $id = "";
    
    if(isset($_GET['id'])) {
        $id = $_GET['id'];
    }
    
    $status = "";

    if(isset($_GET['status'])) {
        $status = $_GET['status'];
    }

    include("dist/conf/db.php");
    $pdo = Database::connect();
    
    if($id != "") {

        $sql = "SELECT * FROM brands WHERE brand_id = ?";
        $q = $pdo->prepare($sql);
        $q->execute(array($id));
        $isPresent = $q->fetch(PDO::FETCH_ASSOC);
        
        if($isPresent != "") {        
            
            if($isPresent['status'] != $status)
            {

                $edited_on = date('Y-m-d H-i-s');
                
                $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                $sql = "UPDATE `brands` SET status = '$status', edited_on = '$edited_on' WHERE brand_id = '$id'";
                $q = $pdo->prepare($sql);
                $isAdded = $q->execute(array());
                
                if($isAdded == true){
                    $result= ([
                        "message" => "Brand Status Updated Successfully.",
                        "BrandTitle" => isset($isPresent['brand_name']) ? $isPresent['brand_name'] : "",
                        "status" => "success",
                        'statusCode' => 200
                    ]);
                }
            } else {
                $result= ([
                    "message" => "Brand Status Already Updated.",
                    "BrandTitle" => isset($isPresent['brand_name']) ? $isPresent['brand_name'] : "",
                    "status" => "fail",
                    'statusCode' => 200
                ]);
            }
            
        } else {
            $result= ([
                "message" => "Brand Not Found.",
                "BrandTitle" => "",
                "status" => "fail",
                'statusCode' => 200
            ]);
        }
    } else {
        $result= ([
            "message" => "Invalid Brand.",
            "BrandTitle" => "",
            "status" => "fail",
            'statusCode' => 200
        ]);
    }

    // echo json_encode($result);
    header("location: approved-brands");