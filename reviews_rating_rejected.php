<?php
  include_once ('dist/conf/checklogin.php'); 
  include ('dist/conf/db.php');
  $pdo = Database::connect();
?>
<!doctype html>

<html
  lang="en"
  class="light-style layout-navbar-fixed layout-menu-fixed layout-compact"
  dir="ltr"
  data-theme="theme-default"
  data-assets-path="assets/"
  data-template="vertical-menu-template"
  data-style="light">
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

    <title> Rejected Reviews & Ratings</title>

    <meta name="description" content="" />

    <!-- *********** header******************  -->
    <?php include ('layout/header_css.php');  ?>
     <!-- *********** /header******************  -->
    
    <!-- Vendors CSS -->
    <link rel="stylesheet" href="assets/vendor/libs/datatables-bs5/datatables.bootstrap5.css" />
    <link rel="stylesheet" href="assets/vendor/libs/datatables-responsive-bs5/responsive.bootstrap5.css" />
    <link rel="stylesheet" href="assets/vendor/libs/datatables-buttons-bs5/buttons.bootstrap5.css" />
    <link rel="stylesheet" href="assets/vendor/libs/datatables-checkboxes-jquery/datatables.checkboxes.css" />
    <link rel="stylesheet" href="assets/vendor/libs/select2/select2.css" />
    <link rel="stylesheet" href="assets/vendor/libs/@form-validation/form-validation.css" />
    <link rel="stylesheet" href="assets/vendor/libs/quill/typography.css" />
    <link rel="stylesheet" href="assets/vendor/libs/quill/katex.css" />
    <link rel="stylesheet" href="assets/vendor/libs/quill/editor.css" />

    <link rel="stylesheet" href="assets/vendor/libs/rateyo/rateyo.css" />
    <!-- Page CSS -->
    <link rel="stylesheet" href="assets/vendor/css/pages/app-ecommerce.css" />

  </head>

  <body>
    <!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">
      <div class="layout-container">
        <!-- *********** sidebar ******************  -->
        <?php include ('layout/sidebar.php');  ?>
        <!-- Menu -->
        <!-- / Menu -->

        <!-- Layout container -->
        <div class="layout-page">
          
          <?php include ('layout/header.php');  ?>          
          

          <!-- / Navbar -->

          <!-- Content wrapper -->
          <div class="content-wrapper">
            <!-- Content -->

            <div class="container-xxl flex-grow-1 container-p-y">
              

              <!-- review List Table -->
              <div class="card">
                <div class="card-header border-bottom">
                  <h5 class="card-title mb-4">View Rejected Ratings & Reviews</h5>
                  <div class="d-flex justify-content-between align-items-center row gap-5 gx-6 gap-md-0">
                    <div class="col-md-4 product_status"></div>
                    <div class="col-md-4 product_category"></div>
                    <div class="col-md-4 product_stock"></div>
                  </div>
                </div>
                <div class="card-datatable table-responsive">
                  <!-- <h3 style="font-size: 20px; font-weight: bold;margin-bottom: 0px;color: #333;text-align: left;padding-left: 18px;margin-top: 17px;">View reviews</h3> -->
                  <table class="datatables-review-approved table">
                    <thead>
                      <tr>
                        <th></th>
                        <th style="width: 10%;">Order ID</th>
                        <th class="text-nowrap">Product</th>
                        <th class="text-nowrap">User</th>
                        <th class="text-nowrap">Review</th>
                        <th>Date</th>
                        <!-- <th class="text-nowrap">Status</th>
                        <th>Actions</th> -->
                      </tr>
                    </thead>
                  </table>
                </div>
              </div>
            </div>
            <!-- / Content -->

            <!-- Footer -->
            <?php include('layout/footer.php'); ?>
            <!-- / Footer -->

            <div class="content-backdrop fade"></div>
          </div>
          <!-- Content wrapper -->
        </div>
        <!-- / Layout page -->
      </div>

      <!-- Overlay -->
      <div class="layout-overlay layout-menu-toggle"></div>

      <!-- Drag Target Area To SlideIn Menu On Small Screens -->
      <div class="drag-target"></div>
    </div>
    <!-- / Layout wrapper -->

    <?php include('layout/footer_css.php'); ?>

    <!-- Core JS -->
    <!-- endbuild -->

    <script src="assets/vendor/libs/rateyo/rateyo.js"></script>

    <!-- Page JS -->
    <!-- <script src="assets/js/app-ecommerce-sub-category-list.js"></script> -->
    <script src="assets/js/app-ecommerce-reviews-rejected.js"></script>
    <!-- <script src="assets/js/app-ecommerce-reviews copy.js"></script> -->
    <!-- <script src="assets/js/extended-ui-star-ratings.js"></script> -->

    <script>
        // Event listener for "Make Approved" button
        // document.addEventListener('click', function (event) {
        //   console.log(event);
        //     if (event.target.classList.contains('approve-btn')) {
        //         var id = event.target.getAttribute('data-id');
        //         updateStatus(id, 'approved');
        //     }
        // });

        // // Event listener for "Make Rejected" button
        // document.addEventListener('click', function (event) {
        //   console.log(event);
        //     if (event.target.classList.contains('reject-btn')) {
        //         var id = event.target.getAttribute('data-id');
        //         updateStatus(id, 'rejected');
        //     }
        // });

        // Function to send AJAX request to update status
        function updateStatus(id, status) {
            var xhr = new XMLHttpRequest();
            xhr.open('POST', 'update_status.php', true);
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    var response = JSON.parse(xhr.responseText);
                    if (response.success) {
                        alert('Status updated successfully!');
                        // Reload or update the DataTable as needed
                        location.reload(); // Example: reload the page
                    } else {
                        alert('Failed to update status: ' + response.message);
                    }
                }
            };
            xhr.send('id=' + encodeURIComponent(id) + '&status=' + encodeURIComponent(status));
        }
    </script>

  </body>
</html>
