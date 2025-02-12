<?php

// Check if a file is being uploaded
if (isset($_FILES['file'])) {
    $file = $_FILES['file'];

    // Define the target directory for file storage
    $targetDir = "uploads/";
    
    // Ensure the uploads directory exists
    if (!is_dir($targetDir)) {
        mkdir($targetDir, 0777, true);
    }

    // Get the file's original name and its temporary upload path
    $fileName = basename($file["name"]);
    $targetFilePath = $targetDir . $fileName;

    // Check if the file already exists (optional)
    if (file_exists($targetFilePath)) {
        echo json_encode(["data" => "File already exists.", "status" => "error"]);
        exit;
    }

    // Move the uploaded file to the target directory
    if (move_uploaded_file($file["tmp_name"], $targetFilePath)) {
        // Respond with success
        echo json_encode([
            "data" => "File uploaded successfully.",
            "filename" => $fileName,
            "file_path" => $targetFilePath,
            "status" => "success"
        ]);
    } else {
        // Respond with an error if the file could not be moved
        echo json_encode(["data" => "Error uploading file.", "status" => "error"]);
    }
} else {
    // No file was uploaded
    echo json_encode(["data" => "No file uploaded.", "status" => "error"]);
}

?>
