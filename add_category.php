<?php
  include_once ('dist/conf/checklogin.php'); 

  // if ($_SESSION['login_id'] == "superadmin" || $_SESSION['login_id'] == "ASSISTANT" ){
  //   header('location:dashboard');
  // }

  include ('dist/conf/db.php');
  $pdo = Database::connect();

  if(isSet($_POST["submit"]))
  { 

    // echo "<pre>";
    // print_r($_POST);
    // exit();
    
    $location = $_POST['location'];
    $subCount= count($_POST['location']);

    for($i=0;$i<$subCount;$i++) 
    {        

        $added_on = date('Y-m-d H-i-s');
        $locationSingle = $location[$i];

        // echo "<pre>";
        // print_r($locationSingle);
        // exit();

        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $sql = "INSERT INTO `category`(`category_name`,`added_on`,`is_active`) VALUES (?,?,?)";
        $q = $pdo->prepare($sql);
        $q->execute(array($locationSingle, $added_on, 1));
    }

    header('location:add_category.php');

    // $location = $_POST['location'];

    // $added_on = date('Y-m-d H-i-s');
    // // $status = "Active";

    // // echo "<pre>";
    // // print_r($_POST);
    // // exit();
    
    // $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    // $sql = "INSERT INTO `location`(`name`) VALUES (?)";
    // $q = $pdo->prepare($sql);
    // $q->execute(array($location));
    // // $lastInsertedId = $pdo->lastInsertId();    
     
  }

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

    <title>Add Category | Simply Sample </title>

    <meta name="description" content="" />
    <style>
   /* When either input is focused, apply border color to both */
    .prefix-class:focus,
    .user-id-class:focus,
    .user-id-class:focus + .prefix-class,
    .prefix-class:focus + .user-id-class
     {
        border: 2px solid #666cff; /* Highlight both inputs on focus */
    }
  </style>
    <!-- *********** header******************  -->
    <?php include ('layout/header_css.php');  ?>
     <!-- *********** /header******************  -->
    
  </head>

  <body>
    <!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">
      <div class="layout-container">
        <!-- *********** sidebar ******************  -->
        <?php include ('layout/sidebar.php');  ?>

        <!-- Layout container -->
        <div class="layout-page">

            <?php include ('layout/header.php');  ?>

          <!-- Content wrapper -->
          <div class="content-wrapper">
            <!-- Content -->

            <!-- *************** - main containt in page write here - **********************  -->
            <!-- <div class="container-xxl flex-grow-1 container-p-y">
                <div class="card">
                    <h5 class="card-header mar-bot-10">Add Product Category</h5>
                    <div class="card-body demo-vertical-spacing demo-only-element">
                        <div class="d-flexz align-items-center1 justify-content-center1">
                        <form action="#" class="form-repeater" method="POST" enctype="multipart/form-data">
                            <div data-repeater-list="group-a">
                            <div data-repeater-item="" style=""  class="items" data-group="test">
                                <div class="box-body" id="lead_addmore_div">
                                <div class="row">

                                    <div class="mb-6 col-lg-12 col-xl-12 col-12 mb-0">
                                      <div class="form-floating form-floating-outline">
                                        <input type="text" name="location[]" id="form-repeater-3-5" class="form-control" placeholder="Product Category" oninput="this.value = this.value.replace(/[^A-Za-z\s]/g, '')" required>
                                        <label for="form-repeater-1-1">Product Category</label>
                                      </div>
                                    </div>
                                    
                                  </div>
                                  <hr class="mt-0">
                                </div>
                            </div>

                            <div class="row mt-10">
                                  <div class="col-md-12">
                                        <button type="submit"  data-bs-toggle="tooltip" data-bs-placement="left"  class="btn btn-success me-4 waves-effect waves-light d-flex float-right" name="submit"   style="float: right;">Submit</button>
                                        <button type="button" onclick="addMore();" class="btn btn-primary waves-effect waves-light repeater-add-btn addmore-btn">
                                          <i class="ri-add-line me-1"></i>
                                          <span class="align-middle"> More</span>
                                        </button>
                                  </div>
                            </div>

                          </form>

                        </div>
                    </div>
                </div>
              </div> -->
              <!-- *************** - /main containt in page write here - **********************  -->
            <!-- / Content -->

            <div class="container-xxl flex-grow-1 container-p-y">
              <div class="app-ecommerce-category">
                <!-- Category List Table -->
                <div class="card">
                  <div class="card-datatable table-responsive">
                    <table class="datatables-category-list table">
                      <thead>
                        <!-- <tr>
                            <th>#</th>
                            <th>Name OF Categories</th>
                            <th>Action</th>
                        </tr> -->
                        <tr>
                          <th></th>
                          <th></th>
                          <th>Categories</th>
                          <th class="text-nowrap text-sm-end">Total Products &nbsp;</th>
                          <!-- <th class="text-nowrap text-sm-end">Total Earning</th> -->
                          <th class="text-lg-center">Actions</th>
                        </tr>
                      </thead>
                      <tbody>
                            <?php 
                                $i = 1;
                                $sql = "SELECT * FROM category ";
                                // $sql = "SELECT * FROM admin where login_role = 'ASSISTANT' OR login_role = 'RECEPTIONIST' OR login_role = 'TECHNICIAN' ";
                                $q = $pdo->query($sql);
                                foreach ($pdo->query($sql) as $row) 
                                { 
                            ?>
                            <tr>
                                    <td></td>
                                    <td></td>
                                    <td><?php echo $row["category_name"]; ?></td>
                                    <td class="text-nowrap text-sm-end">10</td>
                                    <td class="text-lg-center">
                                        <!-- <div class="dropdown"> -->
                                            <!-- <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown"><i class="ri-more-2-line"></i></button>
                                            <div class="dropdown-menu"> -->
                                                <!-- <a class="dropdown-item waves-effect" href="edit_location?id=<?php echo $row["id"]; ?>"><i class="ri-pencil-line me-1"></i> Edit</a> -->
                                                <a class="dropdown-item open-myModal text-danger" data-bs-toggle="modal" data-bs-target="#enableOTP" data-id="<?php echo $row["category_id"]; ?>"><i class="ri-delete-bin-7-line me-1"></i> </a>
                                            <!-- </div> -->

                                            <a class="dropdown-item open-editModal text-primary" 
                                                data-bs-toggle="modal" 
                                                data-bs-target="#editCategoryModal" 
                                                data-id="<?php echo $row['category_id']; ?>" 
                                                data-name="<?php echo $row['category_name']; ?>">
                                                <i class="ri-pencil-line me-1"></i>
                                                </a>
                                        <!-- </div> -->
                                    </td>
                            </tr>
                            <?php $i++; } ?>
                        </tbody>
                    </table>
                  </div>
                </div>
                <!-- Offcanvas to add new customer -->
                <div
                  class="offcanvas offcanvas-end"
                  tabindex="-1"
                  id="offcanvasEcommerceCategoryList"
                  aria-labelledby="offcanvasEcommerceCategoryListLabel">
                  <!-- Offcanvas Header -->
                  <div class="offcanvas-header">
                    <h5 id="offcanvasEcommerceCategoryListLabel" class="offcanvas-title">Add Category</h5>
                    <button
                      type="button"
                      class="btn-close text-reset"
                      data-bs-dismiss="offcanvas"
                      aria-label="Close"></button>
                  </div>
                  <!-- Offcanvas Body -->
                  <div class="offcanvas-body border-top">
                    <form class="pt-0" id="eCommerceCategoryListForm" onsubmit="return false">
                      <!-- Title -->

                      <div class="form-floating form-floating-outline mb-5">
                        <input
                          type="text"
                          class="form-control"
                          id="ecommerce-category-title"
                          placeholder="Enter category title"
                          name="categoryTitle"
                          aria-label="category title" />
                        <label for="ecommerce-category-title">Title</label>
                      </div>

                      <!-- Slug -->
                      <div class="form-floating form-floating-outline mb-5">
                        <input
                          type="text"
                          id="ecommerce-category-slug"
                          class="form-control"
                          placeholder="Enter slug"
                          aria-label="slug"
                          name="slug" />
                        <label for="ecommerce-category-slug">Slug</label>
                      </div>

                      <!-- Image -->
                      <div class="form-floating form-floating-outline mb-5">
                        <input class="form-control" type="file" id="ecommerce-category-image" />
                        <label for="ecommerce-category-image">Attachment</label>
                      </div>
                      <!-- Parent category -->
                      <div class="mb-5 ecommerce-select2-dropdown">
                        <div class="form-floating form-floating-outline">
                          <select
                            id="ecommerce-category-parent-category"
                            class="select2 form-select"
                            data-placeholder="Select parent category"
                            data-allow-clear="true">
                            <option value="">Select parent Category</option>
                            <option value="Household">Household</option>
                            <option value="Management">Management</option>
                            <option value="Electronics">Electronics</option>
                            <option value="Office">Office</option>
                            <option value="Automotive">Automotive</option>
                          </select>
                          <label for="ecommerce-category-parent-category">Parent category</label>
                        </div>
                      </div>
                      <!-- Description -->
                      <div class="mb-5">
                        <div class="form-control p-0 pt-1">
                          <div class="comment-editor border-0" id="ecommerce-category-description"></div>
                          <div class="comment-toolbar border-0 rounded">
                            <div class="d-flex justify-content-end">
                              <span class="ql-formats me-0">
                                <button class="ql-bold"></button>
                                <button class="ql-italic"></button>
                                <button class="ql-underline"></button>
                                <button class="ql-list" value="ordered"></button>
                                <button class="ql-list" value="bullet"></button>
                                <button class="ql-link"></button>
                                <button class="ql-image"></button>
                              </span>
                            </div>
                          </div>
                        </div>
                      </div>
                      <!-- Status -->
                      <div class="mb-5 ecommerce-select2-dropdown">
                        <div class="form-floating form-floating-outline">
                          <select
                            id="ecommerce-category-status"
                            class="select2 form-select"
                            data-placeholder="Select category status">
                            <option value="">Select category status</option>
                            <option value="Scheduled">Scheduled</option>
                            <option value="Publish">Publish</option>
                            <option value="Inactive">Inactive</option>
                          </select>
                          <label for="ecommerce-category-status">Parent status</label>
                        </div>
                      </div>
                      <!-- Submit and reset -->
                      <div>
                        <button type="submit" class="btn btn-primary me-3 data-submit">Add</button>
                        <button type="reset" class="btn btn-outline-danger" data-bs-dismiss="offcanvas">Discard</button>
                      </div>
                    </form>
                  </div>
                </div>
              </div>
            </div>

            <!-- Footer -->
            <?php //include_once('layout/footer.php'); ?>
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

    <!-- Core JS -->
    <!-- build:js assets/vendor/js/core.js -->
      <!-- Footer -->
        <?php include('layout/footer_css.php'); ?>
      <!-- / Footer -->
      <script>
          function addMore() {
            // $("<DIV>").load("lead_addmore.php?exist", function() {
                $("#lead_addmore_div").append('<div class="row"><div class="mb-6 col-lg-12 col-xl-12 col-12 mb-0"><div class="form-floating form-floating-outline"><input type="text" name="location[]" id="form-repeater-3-5" class="form-control" placeholder="Product Category"  required><label for="form-repeater-1-1">Product Category</label></div></div></div><hr class="mt-0">');
            // }); 
          }
      </script>
   
    
  </body>
</html>
