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

    <title>Sub Category List</title>

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

    <!-- Page CSS -->
    <link rel="stylesheet" href="assets/vendor/css/pages/app-ecommerce.css" />
    <style>
      .hidden {
        display: none !important;
      }
    </style>
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

              <div
                class="bs-toast toast toast-ex animate__animated my-2"
                role="alert"
                aria-live="assertive"
                aria-atomic="true"
                data-bs-delay="2000">
                <!-- style="display: inline; opacity: 1"> -->
                <div class="toast-header">
                  <!-- <i class="ri-home-4-fill me-2"></i> -->
                  <div class="me-auto fw-medium" id="entityTitle"></div>
                  <!-- <small class="text-muted">11 mins ago</small> -->
                  <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                </div>
                <div class="toast-body"><span id="messageText"></span></div>
              </div>

              <div class="app-ecommerce-category">
                <!-- Category List Table -->
                <div class="card">
                  <div class="card-datatable table-responsive">
                    <table class="datatables-sub-category-list table">
                      <thead>
                        <tr>
                          <th></th>
                          <th></th>
                          <th>Sub Categories</th>
                          <!-- <th class="hidden"></th> -->
                          <th class="text-nowrap text-sm-end">Category</th>
                          <!-- <th class="hidden"></th> -->
                          <th class="text-nowrap text-sm-end">Total Products</th>
                          <th class="text-nowrap text-sm-end">Status</th>
                          <th class="text-lg-center">Actions</th>
                        </tr>
                      </thead>
                    </table>
                  </div>
                </div>
                <!-- Offcanvas to add new sub category -->
                <div
                  class="offcanvas offcanvas-end"
                  tabindex="-1"
                  id="offcanvasEcommerceCategoryList"
                  aria-labelledby="offcanvasEcommerceCategoryListLabel">
                  <!-- Offcanvas Header -->
                  <div class="offcanvas-header">
                    <h5 id="offcanvasEcommerceCategoryListLabel" class="offcanvas-title">Add Sub Category</h5>
                    <button
                      type="button"
                      class="btn-close text-reset"
                      data-bs-dismiss="offcanvas"
                      aria-label="Close"></button>
                  </div>
                  <!-- Offcanvas Body -->
                  <div class="offcanvas-body border-top">
                    <form class="pt-0" action="#" enctype="multipart/form-data" id="eCommerceCategoryListForm" >
                      <!-- Image -->
                      <!-- <div class="form-floating form-floating-outline mb-5">
                        <input class="form-control" type="file" id="ecommerce-category-image" />
                        <label for="ecommerce-category-image">Attachment</label>
                      </div> -->
                      <input type="hidden" id="subcategoryid_edit">
                      <!-- Parent category -->
                      <div class="mb-5 ecommerce-select2-dropdown">
                        <div class="form-floating form-floating-outline">
                          <select
                            id="ecommerce-category-parent-category"
                            class="select2 form-select"
                            data-placeholder="Select parent category"
                            data-allow-clear="true" required>
                            <!-- <option value="">Select parent Category</option>
                            <option value="Household">Household</option>
                            <option value="Management">Management</option>
                            <option value="Electronics">Electronics</option>
                            <option value="Office">Office</option>
                            <option value="Automotive">Automotive</option> -->
                          </select>
                          <label for="ecommerce-category-parent-category">Parent category</label>
                        </div>
                      </div>
                      <!-- Title -->
                      <div class="form-floating form-floating-outline mb-5">
                        <input
                          type="text"
                          class="form-control"
                          id="ecommerce-category-title"
                          placeholder="Enter sub category title"
                          name="categoryTitle"
                          aria-label="category title" required />
                        <label for="ecommerce-category-title">Sub Category Title</label>
                      </div>
                      <div class="form-floating form-floating-outline mb-5">
                        <div class="form-check form-check-success">
                          <input class="form-check-input" type="checkbox" value="" id="isActiveSubCat" checked>
                          <label class="form-check-label" for="isActiveSubCat">
                            Is Active
                          </label>
                        </div>
                      </div>

                      <!-- Submit and reset -->
                      <div>
                        <button type="button" class="btn btn-primary me-3 data-submit" onclick="myFunction()">Add</button>
                        <button type="reset" class="btn btn-outline-danger" data-bs-dismiss="offcanvas">Discard</button>
                      </div>
                    </form>
                  </div>
                </div>

                
                <!-- Offcanvas to edit sub category -->
                <div
                  class="offcanvas offcanvas-end"
                  tabindex="-1"
                  id="offcanvasEcommerceCategoryListedit"
                  aria-labelledby="offcanvasEcommerceCategoryListLabel">
                  <!-- Offcanvas Header -->
                  <div class="offcanvas-header">
                    <h5 id="offcanvasEcommerceCategoryListLabel" class="offcanvas-title">Edit Sub Category</h5>
                    <button
                      type="button"
                      class="btn-close text-reset"
                      data-bs-dismiss="offcanvas"
                      aria-label="Close"></button>
                  </div>
                  <!-- Offcanvas Body -->
                  <div class="offcanvas-body border-top">
                    <form class="pt-0" action="#" enctype="multipart/form-data" id="eCommerceCategoryListForm" >
                      <!-- Image -->
                      <!-- <div class="form-floating form-floating-outline mb-5">
                        <input class="form-control" type="file" id="ecommerce-category-image" />
                        <label for="ecommerce-category-image">Attachment</label>
                      </div> -->
                      <input type="hidden" id="subcategoryid_edit">
                      <input type="hidden" id="cat_subcat_id">
                      <!-- Parent category -->
                      <div class="mb-5 ecommerce-select2-dropdown">
                        <div class="form-floating form-floating-outline">
                          <select
                            id="ecommerce-category-parent-category-edit"
                            class="select2 form-select"
                            data-placeholder="Select parent category"
                            data-allow-clear="true" required>
                          </select>
                          <label for="ecommerce-category-parent-category-edit">Parent category</label>
                        </div>
                      </div>
                      <!-- Title -->
                      <div class="form-floating form-floating-outline mb-5">
                        <input
                          type="text"
                          class="form-control"
                          id="ecommerce-category-title-edit"
                          placeholder="Enter sub category title"
                          name="categoryTitle"
                          aria-label="category title" required />
                        <label for="ecommerce-category-title">Sub Category Title</label>
                      </div>
                      <div class="form-floating form-floating-outline mb-5">
                        <div class="form-check form-check-success">
                          <input class="form-check-input" type="checkbox" value="" id="isActiveSubCatEdit" checked>
                          <label class="form-check-label" for="isActiveSubCatEdit">
                            Is Active
                          </label>
                        </div>
                      </div>

                      <!-- Submit and reset -->
                      <div>
                        <button type="button" class="btn btn-primary me-3 data-submit" onclick="myFunctionUpdate()">Update</button>
                        <button type="reset" class="btn btn-outline-danger" data-bs-dismiss="offcanvas">Discard</button>
                      </div>
                    </form>
                  </div>
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

    <!-- Page JS -->
    <script src="assets/js/app-ecommerce-sub-category-list.js"></script>
    <script>
    // document.getElementById("eCommerceCategoryListForm").addEventListener("submit", function(event) {
  
</script>
  </body>
</html>
