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

    <title>Products List</title>

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
          <!-- Navbar -->

            <?php include ('layout/header.php');  ?>          

          <!-- / Navbar -->

          <!-- Content wrapper -->
          <div class="content-wrapper">
            <!-- Content -->

            <div class="container-xxl flex-grow-1 container-p-y">
              <!-- Product List Table -->
              <div class="card">
                <div class="card-header">
                  <h5 class="card-title mb-4">Filter</h5>
                  <div class="d-flex justify-content-between align-items-center row gap-5 gx-6 gap-md-0">
                    <div class="col-md-4 product_status"></div>
                    <div class="col-md-4 product_category"></div>
                    <div class="col-md-4 product_stock"></div>
                  </div>
                </div>
                <div class="card-datatable table-responsive">
                  <table class="datatables-products table">
                    <thead>
                      <tr>
                        <th></th>
                        <th></th>
                        <th>product</th>
                        <th>category</th>
                        <th>stock</th>
                        <th>weight</th>
                        <th>price</th>
                        <th>qty</th>
                        <th>status</th>
                        <th>actions</th>
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
    
    <!-- Page JS -->
    <script src="assets/js/app-ecommerce-product-list.js"></script>
    
  </body>
</html>
