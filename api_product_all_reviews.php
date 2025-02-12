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


if($REQUEST_METHOD == "GET") {
    include("dist/conf/db.php");
    $pdo = Database::connect();
    $host = "http://".$_SERVER['HTTP_HOST']."/simplysample/uploads/productIamges/";
    
        if(isset($_GET["productId"]) && $_GET["productId"] > 0) {
            $productId = $_GET["productId"];
            $product = array (
                "user_iamge" => null,
                "user_name" => "",
                "rating" => 0,
                "message" => ""
            );    

            
            $sql = "SELECT * FROM products WHERE product_id = ?";
            $q = $pdo->prepare($sql);
            $q->execute(array($productId));
            $isPresent = $q->fetch(PDO::FETCH_ASSOC);


            if($isPresent){                                    

                    $reviews = array();

                    $sqlrating_review = "SELECT MAX(rating) as rating, message, u.user_id, order_id, product_id, r.user_id, u.first_name, u.last_name,  u.profile_photo, r.added_on FROM rating_review r JOIN users u ON u.user_id = r.user_id WHERE product_id = $productId GROUP BY r.user_id ORDER BY rating,added_on LIMIT 2";
                    foreach ($pdo->query($sqlrating_review) as $row) 
                    {
                        $reviewElement = array (
                            "profile_photo" => $row["profile_photo"],
                            "name" => $row["first_name"]." ".$row["last_name"],
                            "rating" => $row["rating"],
                            "message" => $row["message"],
                            "added_on" => $row["added_on"]
                        );
        
                        array_push($reviews, $reviewElement);
                    }

                    $averageRating = 0;
                    $fiveStarRating = 0;
                    $fourStarRating = 0;
                    $threeStarRating = 0;
                    $twoStarRating = 0;
                    $oneStarRating = 0;

                    $sqlrating_review = "SELECT SUM(rating) as totalRating, COUNT(user_id) as totalCustomers FROM rating_review WHERE product_id = ? and status = 'Active'";
                    $rating_review = $pdo->prepare($sqlrating_review);
                    $rating_review->execute(array($productId));      
                    $rating_review = $rating_review->fetch(PDO::FETCH_ASSOC);
                    if($rating_review['totalRating'] != null && $rating_review['totalRating'] > 0 && $rating_review['totalRating'] > 0 ) {
                        //Average rating as per users
                        $averageRating = (float)$rating_review['totalRating']/$rating_review['totalCustomers'];
                        
                        //Round of to 0.5
                        // $averageRating = round($averageRating * 2) / 2;
                    }

                    $sqlrating_review = "SELECT rating, SUM(rating) as totalRating, COUNT(rating) as totalRatingCount FROM rating_review WHERE product_id = $productId and status = 'Active' GROUP BY rating";
                    // $rating_review = $pdo->prepare($sqlrating_review);
                    // $rating_review->execute(array($productId));      
                    // $rating_review = $rating_review->fetchAll(PDO::FETCH_ASSOC);
                    
                    foreach ($pdo->query($sqlrating_review) as $rating_review) 
                    {

                        switch ($rating_review['rating']) {
                            case 5:
                              $fiveStarRating++;
                              break;
                            case 4:
                              $fourStarRating++;
                              break;
                            case 3:
                              $threeStarRating++;
                              break;
                            case 2:
                              $twoStarRating++;
                              break;
                            case 1:
                              $oneStarRating++;
                              break;
                            default:
                                1;
                          }
                    }

                    $CustomersFeedback = [
                        "averageRating" => $averageRating,
                        "fiveStarRating" => $fiveStarRating,
                        "fourStarRating" => $fourStarRating,
                        "threeStarRating" => $threeStarRating,
                        "twoStarRating" => $twoStarRating,
                        "oneStarRating" => $oneStarRating
                        ];

                    
                    $result = array(
                        'data' => "Product Information Feeded",
                        'ratingInfo' => $reviews, 
                        'CustomersFeedback' => $CustomersFeedback, 
                        'status' => true,
                        'statusCode' => 200
                    );

            } else {
                $result = array(
                    'data' => "Product Not Found",
                    'ratingInfo' => null, 
                    'status' => true,
                    'statusCode' => 200
                );
                echo "";
            }

        }

        else {
            $result= ([
                "data" => "Incomplete inforamtion.",
                "status" => "fail",
                'statusCode' => 200
            ]);
        }
}

else {
    $result = array(
        'data' => 'Requested Method is not supported', 
        'status' => false, 
        'statusCode' => 200);
}

// var_dump(json_encode($result, JSON_INVALID_UTF8_IGNORE));
echo json_encode($result, JSON_INVALID_UTF8_IGNORE);
// var_dump(json_last_error());
// echo json_encode($result);

exit();