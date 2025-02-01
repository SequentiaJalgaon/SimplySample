<?php
include("dist/conf/db.php");
$pdo = Database::connect();

      if(isset($_REQUEST['id'])) {
        $id = $_REQUEST['id'];
      } else {
        $id = 0;
      }


      $sql = "SELECT 
                b.brand_id, 
                b.brand_name, 
                address_line_1, address_line_2, taluka, city, state, pincode, address_type,
                document_title, file_title,
                first_name, last_name, contact_number, email, registration_year, gst_number, brand_logo, food_licence_number,
                bc.category_id, c.category_name,
                business_name,
                b.is_active as brands_is_active, 
                ba.is_active as ba_is_active, 
                bd.is_active as bd_is_active,
                bc.is_active as bc_is_active, 
                bb.is_active as bb_is_active, 
                bu.is_active as bu_is_active
              FROM    brands b
              JOIN    brand_address ba ON ba.brand_id = b.brand_id
              JOIN    brand_documents bd ON bd.brand_id = b.brand_id
              JOIN    brand_info bi ON bi.brand_id = b.brand_id
              JOIN    brand_vs_category bc ON bc.brand_id = b.brand_id
              JOIN    category c ON c.category_id = bc.category_id
              JOIN    business_vs_brand bb ON bb.brand_id = b.brand_id
              JOIN    business bu ON bu.business_id = bb.business_id
              WHERE   
                      b.brand_id = $id 
              GROUP BY bc.category_id";
      $q = $pdo->prepare($sql);
      $q->execute(array());
      $dataBrand = $q->fetchAll(PDO::FETCH_ASSOC);
      if($dataBrand==null) {
        header("location: approved-brands");
      }
      $brand_name = "";
      $address_line_1 = "";
      $address_line_2 = "";
      $taluka = "";
      $city = "";
      $state = "";
      $pincode = "";
      $address_type = "";
      $document_title = "";
      $file_title = "";
      $firstname = "";
      $lastname = "";
      $contact = "";
      $email = "";
      $registration_year = "";
      $gst_number = "";
      $brand_logo = "";
      $food_licence_number = "";
      $category_id = "";
      $business_name = "";
      $registerAddress = "";
      $delieveryAddress = "";

      $categories = array();
      $categorieIDs = array();
      $categorieNames = array();
      foreach ($dataBrand as $row) 
      { 
        array_push($categories, $row["category_id"]);
        array_push($categorieIDs, $row["category_id"]);
        array_push($categorieNames, $row["category_name"]);

        $brand_name = $row["brand_name"];
        $address_line_2 = $row["address_line_2"];
        $address_line_1 = $row["address_line_1"];
        $taluka = $row["taluka"];
        $city = $row["city"];
        $state = $row["state"];
        $pincode = $row["pincode"];
        $address_type = $row["address_type"];
        $document_title = $row["document_title"];
        $file_title = $row["file_title"];
        $firstname = $row["first_name"];
        $lastname = $row["last_name"];
        $contact = $row["contact_number"];
        $email = $row["email"];
        $registration_year = $row["registration_year"];
        $gst_number = $row["gst_number"];
        $brand_logo = $row["brand_logo"];
        $food_licence_number = $row["food_licence_number"];
        $category_id = $row["category_id"];
        $business_name = $row["business_name"];
        if($address_type == "registered") {
          if($address_line_2 == "") {
            $registerAddress = $address_line_1 . $address_line_2 . $taluka . $city . $pincode;
          } else {
            $registerAddress = $address_line_2;
          }
        }
        if($address_type == "delivery")
          if($address_line_2 == "") {
            $delieveryAddress = $address_line_1 . $address_line_2 . $taluka . $city . $pincode;
          } else {
            $delieveryAddress = $address_line_2;
          }
      }
      
      if(isset($_POST['submit'])) {

        $id = 1;
        $firstName = $_POST["firstName"];
        $lastname = $_POST["lastname"];
        $email = $_POST["email"];
        $contact = $_POST["contact"];
        $primaryCategories = $_POST["primaryCategories"];
        $businessname = $_POST["businessname"];
        $registerAddress = $_POST["registerAddress"];
        $registration_year = $_POST["registration_year"];
        $delieveryAddress = $_POST["delieveryAddress"];
        $gst_number = $_POST["gst_number"];
        $food_licence_number = $_POST["food_licence_number"];
        $providedCategories = $_POST["providedCategories"];
        
        // $sql = "UPDATE `brand_address` SET `address_line_2` = ? WHERE `brand_id` = ? and address_type = 'registered' ";
        // $q = $pdo->prepare($sql);
        // $q->execute(array($registerAddress, $id));

        // $sql = "UPDATE `brand_address` SET `address_line_2` = ? WHERE `brand_id` = ? and address_type = 'delivery' ";
        // $q = $pdo->prepare($sql);
        // $q->execute(array($delieveryAddress, $id));

        // $sql = "UPDATE `brand_info` SET 
        // `first_name` = ? ,
        // `last_name` = ? ,
        // `contact_number` = ? ,
        // `email` = ? ,
        // `registration_year` = ? ,
        // `gst_number` = ? ,
        // `food_licence_number` = ?        
        // WHERE `brand_id` = ? ";
        // $q = $pdo->prepare($sql);
        // $q->execute(array( 
        //   $firstName,
        //   $lastname,
        //   $contact,
        //   $email,
        //   $registration_year,
        //   $gst_number,
        //   $food_licence_number,
        //   $id
        // ));

        $sql = "UPDATE `brand_vs_category` SET `is_active` = '0' WHERE `brand_id` = ?";
        $q = $pdo->prepare($sql);
        $q->execute(array($id));
        foreach($providedCategories as $category) {
          $sql = "INSERT INTO `brand_vs_category` ( `category_id`, `brand_id`) VALUES ( ? , ?)";
          $q = $pdo->prepare($sql);
          $q->execute(array($category, $id));
        }
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

    <title>Edit Brand</title>

    <meta name="description" content="" />
   
    <!-- *********** header******************  -->
    <?php include ('layout/header_css.php');  ?>
    <!-- *********** /header******************  -->


    <!-- <link rel="stylesheet" href="assets/vendor/libs/select2/select2.css" /> -->
    <!-- <link rel="stylesheet" href="assets/vendor/libs/bootstrap-select/bootstrap-select.css" /> -->
      <style>
        .tagify {
          height: max-content !important;
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

          <!-- Content wrapper -->
          <div class="content-wrapper">
            <!-- Content -->

            <div class="container-xxl flex-grow-1 container-p-y">
              <div class="app-ecommerce">
                <!-- OnBoard Brand -->
                
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

                <form action="#" method="POST" enctype="multipart/form-data">
                    <div
                      class="d-flex flex-column flex-md-row justify-content-between align-items-start align-items-md-center mb-6 row-gap-4">
                      <div class="d-flex flex-column justify-content-center">
                        <h4 class="mb-1">Edit Brand</h4>
                        <!-- <p class="mb-0">Orders placed across your store</p> -->
                      </div>
                      <div class="d-flex align-content-center flex-wrap gap-4">
                        <button class="btn btn-outline-secondary">Discard</button>
                        <!-- <button class="btn btn-outline-primary">Save draft</button> -->
                        <button type="submit" name="submit" class="btn btn-primary">Update Brand</button>
                      </div>
                    </div>
                    <div class="row">
                      <!-- First column-->
                      <div class="col-12 col-lg-8">
                        <!-- Primary Brand Information -->
                        <div class="card mb-6">
                          <div class="card-header">
                            <h5 class="card-tile mb-0">Primary Brand information</h5>
                            <hr>
                          </div>
                          <div class="card-body">

                            <div class="row mb-5 gx-5">
                              <div class="col">
                                <div class="form-floating form-floating-outline">
                                  <input
                                    type="text"
                                    class="form-control"
                                    id="ecommerce-brand-firstName"
                                    placeholder="First Name"
                                    name="firstName"
                                    aria-label="Brand First Name" required/>
                                  <label for="ecommerce-brand-firstName">First Name</label>
                                </div>
                              </div>
                              <div class="col">
                                <div class="form-floating form-floating-outline">
                                  <input
                                    type="text"
                                    class="form-control"
                                    id="ecommerce-brand-lastname"
                                    placeholder="Last Name"
                                    name="lastname"
                                    aria-label="Brand Last Name" required/>
                                  <label for="ecommerce-brand-name">Last Name</label>
                                </div>
                              </div>
                            </div>

                            <div class="row mb-5 gx-5">
                              <div class="col">
                                <div class="form-floating form-floating-outline">
                                  <input
                                    type="email"
                                    class="form-control"
                                    id="ecommerce-brand-email"
                                    placeholder="Email"
                                    name="email"
                                    aria-label="Brand Email" required/>
                                  <label for="ecommerce-brand-sku">Email</label>
                                </div>
                              </div>
                              <div class="col">
                                <div class="form-floating form-floating-outline">
                                  <input
                                    type="number"
                                    class="form-control"
                                    id="ecommerce-brand-contact"
                                    placeholder="Contact"
                                    name="contact"
                                    aria-label="Brand barcode" required/>
                                  <label for="ecommerce-brand-name">Contact</label>
                                </div>
                              </div>
                            </div>
                            
                          </div>
                        </div>
                        <!-- /Primary Brand Information -->

                        <!-- Business Information -->
                        <div class="card mb-6">
                          <div class="card-header">
                            <h5 class="card-title mb-0">Business Information</h5>
                            <hr>
                          </div>
                          <div class="card-body">
                                <div class="row g-5">
                                    <div class="col-12 col-md-8">
                                        <div class="form-floating form-floating-outline">
                                            <input
                                                type="text"
                                                class="form-control"
                                                id="ecommerce-brand-business-name"
                                                placeholder="Business Name"
                                                name="businessname"
                                                aria-label="Business Name" required/>
                                            <label for="ecommerce-brand-business-name">Business Name</label>
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-4">
                                        <div class="form-floating form-floating-outline">
                                        <input
                                            type="number"
                                            class="form-control"
                                            id="ecommerce-brand-registration-year"
                                            placeholder="Year of Registration In Industry"
                                            name="registration_year"
                                            aria-label="Year of Registration" required/>
                                        <label for="ecommerce-brand-discount-price">Year of Registration In Industry</label>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="input-group">
                                            <label class="input-group-text" for="inputGroupFile01"><b>Food License</b></label>
                                            <input type="file" id="foodlicense" name="foodlicense" class="form-control" />
                                        </div>
                                    </div>
                                    <div class="col-12">
                                    <div class="input-group">
                                            <label class="input-group-text" for="inputGroupFile02"><b>GST Certificate</b></label>
                                            <input type="file" id="gst_cert" name="gst_cert" class="form-control" />
                                        </div>
                                    </div>
                                </div>
                          </div>
                        </div>
                        <!-- /Business Information -->  
                         
                        <div class="card mb-6">
                            <div class="card-header">
                            <h5 class="card-title m-0">Registered Address</h5>
                            </div>
                            <div class="card-body">
                                <div class="row g-5">

                                    <div class="col-12 col-md-12">
                                    <div class="form-floating form-floating-outline">
                                        <input type="text" id="reg_address_line_1" class="form-control" placeholder="Address" />
                                        <label for="address_line_1">Address Line 1</label>
                                    </div>
                                    </div>

                                    <div class="col-12 col-md-12">
                                    <div class="form-floating form-floating-outline">
                                        <input type="text" id="reg_address_line_2" class="form-control" placeholder="Address" />
                                        <label for="address_line_2">Address Line 2</label>
                                    </div>
                                    </div>

                                    <div class="col-12 col-md-3">
                                    <div class="form-floating form-floating-outline">
                                        <input
                                        type="text"
                                        class="form-control phone-mask"
                                        id="reg_taluka"
                                        placeholder="Phone"
                                        name="Taluka"
                                        aria-label="Taluka" />
                                        <label for="taluka">Taluka</label>
                                    </div>
                                    </div>

                                    <div class="col-12 col-md-3">
                                    <div class="form-floating form-floating-outline">
                                        <input type="text" id="reg_loc_city" class="form-control" placeholder="City" />
                                        <label for="loc_city">City</label>
                                    </div>
                                    </div>

                                    <div class="col-12 col-md-3">
                                    <div class="form-floating form-floating-outline">
                                        <input type="text" id="reg_loc_state" class="form-control" placeholder="State" />
                                        <label for="loc_state">State</label>
                                    </div>
                                    </div>

                                    <div class="col-12 col-md-3">
                                    <div class="form-floating form-floating-outline">
                                        <input
                                        type="number"
                                        id="reg_loc_pincode"
                                        class="form-control"
                                        placeholder="PIN Code"
                                        min="0"
                                        max="999999" />
                                        <label for="loc_pincode">PIN Code</label>
                                    </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="card mb-6">
                            <div class="card-header">
                            <h5 class="card-title m-0">Delievery Address</h5>
                            </div>
                            <div class="card-body">
                            <div class="row g-5">

                                <div class="col-12 col-md-12">
                                <div class="form-floating form-floating-outline">
                                    <input type="text" id="del_address_line_1" class="form-control" placeholder="Address" />
                                    <label for="del_address_line_1">Address Line 1</label>
                                </div>
                                </div>

                                <div class="col-12 col-md-12">
                                <div class="form-floating form-floating-outline">
                                    <input type="text" id="del_address_line_2" class="form-control" placeholder="Address" />
                                    <label for="del_address_line_2">Address Line 2</label>
                                </div>
                                </div>

                                <div class="col-12 col-md-3">
                                <div class="form-floating form-floating-outline">
                                    <input
                                    type="text"
                                    class="form-control phone-mask"
                                    id="del_taluka"
                                    placeholder="Phone"
                                    name="Taluka"
                                    aria-label="Taluka" />
                                    <label for="del_taluka">Taluka</label>
                                </div>
                                </div>

                                <div class="col-12 col-md-3">
                                <div class="form-floating form-floating-outline">
                                    <input type="text" id="del_loc_city" class="form-control" placeholder="City" />
                                    <label for="del_loc_city">City</label>
                                </div>
                                </div>

                                <div class="col-12 col-md-3">
                                <div class="form-floating form-floating-outline">
                                    <input type="text" id="del_loc_state" class="form-control" placeholder="State" />
                                    <label for="del_loc_state">State</label>
                                </div>
                                </div>

                                <div class="col-12 col-md-3">
                                <div class="form-floating form-floating-outline">
                                    <input
                                    type="number"
                                    id="del_loc_pincode"
                                    class="form-control"
                                    placeholder="PIN Code"
                                    min="100000"
                                    max="999999" />
                                    <label for="del_loc_pincode">PIN Code</label>
                                </div>
                                </div>
                            </div>
                            </div>
                        </div>

                        <!-- Documents -->
                        <!-- <div class="card mb-6">
                          <div class="card-header">
                            <h5 class="card-title mb-0">Documents</h5>
                            <hr>
                          </div>
                          <div class="card-body">
                            <form class="form-repeater">
                              <div data-repeater-list="group-a">
                                <div data-repeater-item>
                                  <div class="row gx-5">
                                    <div class="mb-2 col-sm-12">
                                      <div class="input-group">
                                        <label class="input-group-text" for="inputGroupFile01"><b>Food License</b></label>
                                        <input type="file" id="foodlicense" name="foodlicense" class="form-control" />
                                      </div>
                                    </div>
                                  </div>
                                  <div class="row gx-5">
                                    <div class="mb-2 col-sm-12">
                                      <div class="input-group">
                                        <label class="input-group-text" for="inputGroupFile02"><b>GST Certificate</b></label>
                                        <input type="file" id="gst_cert" name="gst_cert" class="form-control" />
                                      </div>
                                    </div>
                                  </div>
                                  <div class="row gx-5">
                                    <div class="mb-2 col-sm-12">
                                      <div class="input-group">
                                        <label class="input-group-text" for="inputGroupFile03"><b>Food License</b></label>
                                        <input type="file" id="inputfile3" name="inputfile3" class="form-control" />
                                      </div>
                                    </div>
                                  </div>
                                  <div class="row gx-5">
                                    <div class="mb-2 col-sm-12">
                                      <div class="input-group">
                                        <label class="input-group-text" for="inputGroupFile04"><b>Food License</b></label>
                                        <input type="file" id="inputfile4" name="inputfile4" class="form-control" />
                                      </div>
                                    </div>
                                  </div>
                                  
                                </div>
                              </div>
                            </form>
                          </div>
                        </div> -->
                        <!-- /Documents -->
                         
                      </div>
                      <!-- /Second column -->

                      <!-- Second column -->
                      <div class="col-12 col-lg-4">

                      
                        <!-- Logo -->
                        <div class="card mb-6">
                            <h5 class="card-header">Logo</h5>
                            <div class="card-body">
                                    <div class="row">
                                        <div class="col-12 text-center align-items-center justify-content-center">
                                            <img class="img-fluid mb-2 rounded-4" id="brandLogo" src="">
                                            <hr>
                                        </div>
                                    </div>
                                <!-- <form action="/upload" class="dropzone needsclick" id="dropzone-basic"> -->
                                <div action="/upload" class="dropzone needsclick" id="dropzone-basic">
                                    <div class="dz-message needsclick">
                                    Drop file here or click to update
                                    <span class="note needsclick"
                                        >(This is just a demo dropzone. Selected files are
                                        <span class="fw-medium">not</span> actually update.)</span
                                    >
                                    </div>
                                    <div class="fallback">
                                    <input name="file" type="file" />
                                    </div>
                                </div>
                                <!-- </form> -->
                            </div>
                        </div>
                        <!-- /Logo -->

                        <!-- Requested Categories -->
                        <?php 
                        //   $primarycategoriesNames = "";
                        //   $sql = "SELECT * FROM category";
                        //   $q = $pdo->query($sql);
                        //   foreach ($pdo->query($sql) as $row) {
                        //     if(in_array($row['category_id'], $categorieIDs)) {
                        //       if($primarycategoriesNames != "") {
                        //         $primarycategoriesNames .= ", ".'{"value" : "'.$row['category_name'].'","readonly" : true, "title" : "'.$row['category_name'].'"}';
                        //       } else {
                        //         $primarycategoriesNames .= '{"value" : "'.$row['category_name'].'","readonly" : true, "title" : "'.$row['category_name'].'"}';
                        //       }
                        //     }    
                        //   } 
                        ?>
                        <div class="card mb-6">
                          <div class="card-header">
                            <h5 class="card-title mb-0">Requested Categories</h5>
                          </div>
                          <div class="card-body">                            
                              <div class="mb-3">
                                <div class="form-floating form-floating-outline"> 
                                  <input
                                      id="RequestedCategories"
                                      class="form-control readonlyMix"
                                      name="RequestedCategories"
                                      readonly
                                      >
                                      <!-- value = '<?php //echo '['.$primarycategoriesNames.']'; ?>' -->
                                    <label for="RequestedCategories">Readonly</label>
                                </div>
                              </div>
                            </div>
                          </div>
                        <!-- /Requested Categories -->

                        <!-- Accepted Categories -->
                        <div class="card mb-6">
                          <div class="card-header">
                            <h5 class="card-title mb-0">Accepted Categories</h5>
                          </div>
                          <div class="card-body">                            
                              <div class="mb-3">
                                <div class="form-floating form-floating-outline">
                                  <input
                                    id="ProvidedCategoriesSuggestion"
                                    name="ProvidedCategoriesSuggestion"
                                    class="form-control h-auto"
                                    placeholder="select Categories"
                                    required
                                    />
                                    <!-- value="<?php //echo implode(", ", $categorieNames); ?>" -->
                                  <label for="ProvidedCategoriesSuggestion">Selected Categories</label>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                        <!-- /Accepted Categories -->


                      </div>
                      <!-- /Second column -->
                    </div>
                </form>

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

    <script src="assets\js\app-ecommerce-brand-edit.js"></script>                     
    
    <!-- <script src="assets/vendor/libs/bootstrap-select/bootstrap-select.js"></script> -->
    <!-- <script src="assets/vendor/libs/bloodhound/bloodhound.js"></script> -->

  </body>
</html>
a