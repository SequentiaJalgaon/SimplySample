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
    $category_id = $_POST['category_name_id'];

    for($i=0;$i<$subCount;$i++) 
    {        

        $added_on = date('Y-m-d H-i-s');
        $locationSingle = $location[$i];

        // echo "<pre>";
        // print_r($locationSingle);
        // exit();

        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $sql = "INSERT INTO `sub_category`(`sub_category_name`,`added_on`,`is_active`) VALUES (?,?,?)";
        $q = $pdo->prepare($sql);
        $q->execute(array($locationSingle, $added_on, 1));
        $lastInsertedId = $pdo->lastInsertId();   

        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $sqlc = "INSERT INTO `category_vs_subcategory`(`cat_id`,`sub_cat_id`,`added_on`,`is_active`) VALUES (?,?,?,?)";
        $q = $pdo->prepare($sqlc);
        $q->execute(array($category_id, $lastInsertedId, $added_on, 1));


    }

    // header('location:add_subcategory.php');   
    header('location:view-subcategories.php');   
     
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

    <title>Add Sub-Category | Simply Sample </title>

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

            <div class="container-xxl flex-grow-1 container-p-y">
              <!-- *************** - main containt in page write here - **********************  -->
              <!-- <h5 class="card-header mar-bot-10">Add Product Category</h5> -->
                <div class="card">
                    <h5 class="card-header mar-bot-10">Add Product Sub-Category</h5>
                    <!-- <h6 class="card-header">Add form    Details </h6> -->
                    <div class="card-body demo-vertical-spacing demo-only-element">
                        <div class="d-flexz align-items-center1 justify-content-center1">
                        

                        <!-- </form> -->
                        <form action="#" class="form-repeater" method="POST" enctype="multipart/form-data">

                            <div class="col-md-12" style="">
                              <div class="row">
                                <label class="col-sm-4 col-form-label text-sm-end mar-top">Category Name</label>
                                  <div class="col-sm-4">
                                    <select id="roleDropdown" name="category_name_id" class="select2 form-select select2-hidden-accessible" data-allow-clear="true" data-select2-id="formtabs-country" tabindex="-1" aria-hidden="true" required>
                                            <option value="" data-select2-id="18">Select Category Name</option>
                                            <?php
                                                $sql = "SELECT * FROM  category ";
                                                foreach ($pdo->query($sql) as $row) 
                                                { 
                                                ?>
                                                    <option value="<?php echo $row['category_id']?>"><?php echo $row['category_name']?></option> 
                                                <?php } ?>
                                    </select>
                                  </div>
                              </div>
                            </div>

                            <hr style="">
                            <!--  -->
                            <div data-repeater-list="group-a">
                              <div data-repeater-item="" style=""  class="items" data-group="test">
                                <div class="box-body" id="lead_addmore_div">
                                  <div class="row">

                                    <div class="mb-6 col-lg-12 col-xl-12 col-12 mb-0">
                                      <div class="form-floating form-floating-outline">
                                        <input type="text" name="location[]" id="form-repeater-3-5" class="form-control" placeholder="Product Sub-Category" oninput="this.value = this.value.replace(/[^A-Za-z\s]/g, '')" required>
                                        <label for="form-repeater-1-1">Product Sub-Category</label>
                                      </div>
                                    </div>
                                    
                                  </div>
                                  <hr class="mt-0">
                                </div>
                              </div>

                            <div class="row mt-10">
                                  <div class="col-md-12">
                                        <button type="submit"  data-bs-toggle="tooltip" data-bs-placement="left"  class="btn btn-success me-4 waves-effect waves-light d-flex float-right" name="submit"   style="float: right;">Submit</button>
                                        <!-- <button type="button" class="btn btn-primary mt-4" onclick="addVariant()">+ Add</button> -->
                                        <button type="button" onclick="addMore();" class="btn btn-primary waves-effect waves-light repeater-add-btn addmore-btn">
                                          <i class="ri-add-line me-1"></i>
                                          <span class="align-middle"> More</span>
                                        </button>
                                        <!-- <button type="reset" class="btn btn-outline-secondary waves-effect  d-flex float-left" title="Go Back To The Page">Cancel</button> -->
                                        <!-- <button type="reset" class="btn btn-outline-danger waves-effect" data-bs-dismiss="offcanvas">Discard</button> -->
                                  </div>
                            </div>

                          </form>

                        </div>
                    </div>
                </div>
               <!-- *************** - /main containt in page write here - **********************  -->
            </div>
            <!-- / Content -->

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
                $("#lead_addmore_div").append('<div class="row"><div class="mb-6 col-lg-12 col-xl-12 col-12 mb-0"><div class="form-floating form-floating-outline"><input type="text" name="location[]" id="form-repeater-3-5" class="form-control" placeholder="Product Sub-Category"  required><label for="form-repeater-1-1">Product Sub-Category</label></div></div></div><hr class="mt-0">');
            // }); 
          }
      </script>
   
    
  </body>
</html>
