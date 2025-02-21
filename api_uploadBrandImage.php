<?php
// Set headers to allow CORS (optional, if you're calling from a different origin)
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');

include("dist/conf/db.php");
$pdo = Database::connect();

// Define the folder where the images will be saved
$brandImagePath = 'uploads/logos/';

// Check if the save folder exists, if not, create it
if (!file_exists($brandImagePath)) {
    mkdir($brandImagePath, 0777, true);
}

// Function to save the base64 image data to a file
function saveBase64Image($base64Data, $filePath) {
    // Clean the base64 string (remove data URI scheme part)
    $base64Clean = preg_replace('#^data:image/\w+;base64,#i', '', $base64Data);

    // Decode the base64 data into binary
    $imageData = base64_decode($base64Clean);

    // Check if the decoding was successful
    if ($imageData === false) {
        return false;
    }

    // Save the binary data as an image file
    return file_put_contents($filePath, $imageData);
}

// Check if data was sent via POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Get the raw POST data (JSON)
    $input = json_decode(file_get_contents('php://input'), true);
    $input = $input["brandLogo"];
    // Check if images are provided in the request
    if (isset($input['images']) && is_array($input['images'])) {
        $responses = [];

        // Process each image
        foreach ($input['images'] as $image) {
            // Validate the image object
            if (isset($image['name']) && isset($image['base64Data'])) {
                $name = $image['name'];
                $base64Data = $image['base64Data'];

                // Define the file path where the image will be saved
                $filePath = $brandImagePath . '/' . $name;
                
                if (isset($input['brand_id']) && $input['brand_id'] > 0) {
                    $brand_id = $input['brand_id'];
                    $sql = "UPDATE `brand_info` SET 
                    `brand_logo` = '$name'
                    WHERE `brand_id` = $brand_id ";
                    $q = $pdo->prepare($sql);
                    $q->execute(array());
                }

                // Save the image and collect the response
                $success = saveBase64Image($base64Data, $filePath);
                if ($success) {
                    $responses[] = ['name' => $name, 'status' => 'success'];
                } else {
                    $responses[] = ['name' => $name, 'status' => 'error'];
                }
            } else {
                $responses[] = ['status' => 'error', 'data' => 'Invalid image data'];
            }
        }

        // Send a JSON response with the result
        echo json_encode(['status' => 'success', 'responses' => $responses]);
    } else {
        echo json_encode(['status' => 'error', 'data' => 'No images provided']);
    }
} else {
    echo json_encode(['status' => 'error', 'data' => 'Invalid request method']);
}
?>
