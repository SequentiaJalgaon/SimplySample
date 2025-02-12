<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>File Upload</title>
</head>
<body>

    <h2>Upload a File</h2>
    <form id="fileUploadForm" enctype="multipart/form-data">
        <input type="file" id="fileInput" name="file" />
        <button type="submit">Upload</button>
    </form>

    <script>
        document.getElementById("fileUploadForm").addEventListener("submit", function(event) {
            event.preventDefault(); // Prevent default form submission

            let formData = new FormData();
            let fileInput = document.getElementById("fileInput");

            if (fileInput.files.length > 0) {
                formData.append("file", fileInput.files[0]);

                fetch("upload.php", {
                    method: "POST",
                    body: formData,
                })
                .then(response => response.json())
                .then(data => {
                    console.log("File uploaded successfully:", data);
                    alert("File uploaded successfully!");
                })
                .catch(error => {
                    console.error("Error uploading file:", error);
                    alert("Error uploading file.");
                });
            } else {
                alert("Please select a file to upload.");
            }
        });
    </script>

</body>
</html>
