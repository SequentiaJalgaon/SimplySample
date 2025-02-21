<?php
include("dist/conf/db.php");
$pdo = Database::connect();
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
      if(isset($_REQUEST['id'])) {
        $id = $_REQUEST['id'];
      } else {
        $id = 0;
      }


    //   $sql = "SELECT 
    //             b.brand_id, 
    //             b.brand_name, 
    //             address_line_1, address_line_2, taluka, city, state, pincode, address_type,
    //             document_title, file_title,
    //             first_name, last_name, contact_number, email, registration_year, gst_number, brand_logo, food_licence_number,
    //             bc.category_id, c.category_name,
    //             business_name,
    //             b.is_active as brands_is_active, 
    //             ba.is_active as ba_is_active, 
    //             bd.is_active as bd_is_active,
    //             bc.is_active as bc_is_active, 
    //             bb.is_active as bb_is_active, 
    //             bu.is_active as bu_is_active
    //           FROM    brands b
    //           JOIN    brand_address ba ON ba.brand_id = b.brand_id
    //           JOIN    brand_documents bd ON bd.brand_id = b.brand_id
    //           JOIN    brand_info bi ON bi.brand_id = b.brand_id
    //           JOIN    brand_vs_category bc ON bc.brand_id = b.brand_id
    //           JOIN    category c ON c.category_id = bc.category_id
    //           JOIN    business_vs_brand bb ON bb.brand_id = b.brand_id
    //           JOIN    business bu ON bu.business_id = bb.business_id
    //           WHERE   
    //                   b.brand_id = $id 
    //                   and status='Approved'
    //           GROUP BY bc.category_id";
    
    
      $sql = "SELECT 
                b.brand_id, b.brand_name, requested_categories, b.is_active as brands_is_active,
                first_name, last_name, contact_number, email, registration_year, gst_number, brand_logo, food_licence_number
            FROM    brands b
            JOIN    brand_info bi ON bi.brand_id = b.brand_id
            WHERE   b.brand_id = $id  and status = 'Approved'";
            
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


      $primarycategoriesNames = "";
      $categorieIDs = array();
      $categorieNames = array();
      
      foreach ($dataBrand as $row) 
      { 
        $requestedCategories = $row['requested_categories'];
        if($requestedCategories != "") {
          $sqlc = "SELECT * FROM category WHERE category_id IN ($requestedCategories)"; 
          $qc = $pdo->query($sqlc);
          foreach ($pdo->query($sqlc) as $rowc) {
            if(!in_array($rowc['category_id'], $categorieIDs)) {
                array_push($categorieIDs, $rowc["category_id"]);
                array_push($categorieNames, $rowc["category_name"]);
                
                  if($primarycategoriesNames != "") {
                    $primarycategoriesNames .= ", ".'{"value" : "'.$rowc['category_name'].'","readonly" : true, "title" : "'.$rowc['category_name'].'"}';
                  } else {
                    $primarycategoriesNames .= '{"value" : "'.$rowc['category_name'].'","readonly" : true, "title" : "'.$rowc['category_name'].'"}';
                  }
            }    
          } 
        }
        

        if(isset($row["brand_name"])) { $brand_name = $row["brand_name"]; } else { $row["brand_name"] = ""; }
        if(isset($row["address_line_2"])) { $address_line_2 = $row["address_line_2"]; } else { $row["address_line_2"] = ""; }
        if(isset($row["address_line_1"])) { $address_line_1 = $row["address_line_1"]; } else { $row["address_line_1"] = ""; }
        if(isset($row["taluka"])) { $taluka = $row["taluka"]; } else { $row["taluka"] = ""; }
        if(isset($row["city"])) { $city = $row["city"]; } else { $row["city"] = ""; }
        if(isset($row["state"])) { $state = $row["state"]; } else { $row["state"] = ""; }
        if(isset($row["pincode"])) { $pincode = $row["pincode"]; } else { $row["pincode"] = ""; }
        if(isset($row["address_type"])) { $address_type = $row["address_type"]; } else { $row["address_type"] = ""; }
        if(isset($row["document_title"])) { $document_title = $row["document_title"]; } else { $row["document_title"] = ""; }
        if(isset($row["file_title"])) { $file_title = $row["file_title"]; } else { $row["file_title"] = ""; }
        if(isset($row["first_name"])) { $firstname = $row["first_name"]; } else { $row["first_name"] = ""; }
        if(isset($row["last_name"])) { $lastname = $row["last_name"]; } else { $row["last_name"] = ""; }
        if(isset($row["contact_number"])) { $contact = $row["contact_number"]; } else { $row["contact_number"] = ""; }
        if(isset($row["email"])) { $email = $row["email"]; } else { $row["email"] = ""; }
        if(isset($row["registration_year"])) { $registration_year = $row["registration_year"]; } else { $row["registration_year"] = ""; }
        if(isset($row["gst_number"])) { $gst_number = $row["gst_number"]; } else { $row["gst_number"] = ""; }
        if(isset($row["brand_logo"])) { $brand_logo = $row["brand_logo"]; } else { $row["brand_logo"] = ""; }
        if(isset($row["food_licence_number"])) { $food_licence_number = $row["food_licence_number"]; } else { $row["food_licence_number"] = ""; }
        if(isset($row["category_id"])) { $category_id = $row["category_id"]; } else { $row["category_id"] = ""; }
        if(isset($row["business_name"])) { $business_name = $row["business_name"]; } else { $row["business_name"] = ""; }
        
        if($address_type == "registered") {
          if($address_line_2 == "") {
            $registerAddress = $address_line_1 . $address_line_2 . $taluka . $city . $pincode;
          } else {
            $registerAddress = $address_line_2;
          }
        }
        if($address_type == "delivery") {
          if($address_line_2 == "") {
            $delieveryAddress = $address_line_1 . $address_line_2 . $taluka . $city . $pincode;
          } else {
            $delieveryAddress = $address_line_2;
          }
        }
      }
      
      
      
      if(isset($_POST['submit'])) {
          
        $firstName = $_POST["firstName"];
        $lastname = $_POST["lastname"];
        $email = $_POST["email"];
        $contact = $_POST["contact"];
        $primaryCategories = $_POST["TagifyReadonly"];
        $businessname = $_POST["businessname"];
        // $registerAddress = $_POST["registerAddress"];
        $registration_year = $_POST["registration_year"];
        // $delieveryAddress = $_POST["delieveryAddress"];
        $gst_number = $_POST["gst_number"];
        $food_licence_number = $_POST["food_licence_number"];

        
        $r_address_line_1 = $_POST["r_address_line_1"];
        $r_address_line_2 = $_POST["r_address_line_2"];
        $r_taluka = $_POST["r_taluka"];
        $r_city = $_POST["r_city"];
        $r_state = $_POST["r_state"];
        $r_pincode = $_POST["r_pincode"];

        $d_address_line_1 = $_POST["d_address_line_1"];
        $d_address_line_2 = $_POST["d_address_line_2"];
        $d_taluka = $_POST["d_taluka"];
        $d_city = $_POST["d_city"];
        $d_state = $_POST["d_state"];
        $d_pincode = $_POST["d_pincode"];

        // $providedCategories = $_POST["providedCategories"];
        
        $sql = "INSERT INTO `brand_address` (
        `address_line_1`, 
        `address_line_2`, 
        `taluka`, 
        `city`, 
        `state`, 
        `pincode`, 
        address_type, `brand_id`, `is_active` ) VALUES (?,?,?,?,?,?,?,?,?)";
        // $sql = "UPDATE `brand_address` SET `address_line_2` = ? WHERE `brand_id` = ? and address_type = 'registered' ";
        $q = $pdo->prepare($sql);
        $q->execute(array(
          $r_address_line_1, 
          $r_address_line_2, 
          $r_taluka, 
          $r_city, 
          $r_state, 
          $r_pincode, 
          'registered',  $id, '1'));

        // $sql = "UPDATE `brand_address` SET `address_line_2` = ? WHERE `brand_id` = ? and address_type = 'delivery' ";
        $sql = "INSERT INTO `brand_address` (
          `address_line_1`, 
          `address_line_2`, 
          `taluka`, 
          `city`, 
          `state`, 
          `pincode`, 
          address_type, `brand_id`, `is_active` ) VALUES (?,?,?,?,?,?,?,?,?)";
          // $sql = "UPDATE `brand_address` SET `address_line_2` = ? WHERE `brand_id` = ? and address_type = 'registered' ";
          $q = $pdo->prepare($sql);
          $q->execute(array(
            $d_address_line_1, 
            $d_address_line_2, 
            $d_taluka, 
            $d_city, 
            $d_state, 
            $d_pincode, 
            'delivery',  $id, '1'));

        $sql = "INSERT INTO `business` (`business_name`, `is_active` ) VALUES (?,?)";
        $q = $pdo->prepare($sql);
        $q->execute(array($businessname, '1'));
        $businessId = $pdo->lastInsertId();
        
        $sql = "INSERT INTO `business_vs_brand` (`business_id`, `brand_id`, `is_active` ) VALUES (?,?,?)";
        $q = $pdo->prepare($sql);
        $q->execute(array($businessId, $id, '1'));


        $sql = "UPDATE `brand_info` SET 
        `first_name` = ? ,
        `last_name` = ? ,
        `contact_number` = ? ,
        `email` = ? ,
        `registration_year` = ? ,
        `gst_number` = ? ,
        `food_licence_number` = ?, 
        `is_active` = ?
        WHERE `brand_id` = ? ";
        $q = $pdo->prepare($sql);
        $q->execute(array( 
          $firstName,
          $lastname,
          $contact,
          $email,
          $registration_year,
          $gst_number,
          $food_licence_number,
          '1',
          $id
        ));

        $sql = "UPDATE `brands` SET `status` = 'Onboarded' WHERE `brand_id` = ?";
        $q = $pdo->prepare($sql);
        $q->execute(array($id));

        $sql = "UPDATE `brand_vs_category` SET `is_active` = '0' WHERE `brand_id` = ?";
        $q = $pdo->prepare($sql);
        $q->execute(array($id));
        
        $json = $_POST["ProvidedCategories"];
        $data = json_decode($json, true);
        foreach ($data as $item) {
            $categoryTitle = $item['value'];
            if($categoryTitle != null && $categoryTitle != "") {
                  
                  $sqlcc = "SELECT * FROM category WHERE category_name = '$categoryTitle'";
                  $qcc = $pdo->prepare($sqlcc);
                  $qcc->execute(array());
                  $dataCategory = $qcc->fetch(PDO::FETCH_ASSOC);
                  
                    if($dataCategory) {
                        $category_id = $dataCategory['category_id'];
                        $sql = "INSERT INTO `brand_vs_category` ( `category_id`, `brand_id`, `is_active`) VALUES ( $category_id, $id, '1')";
                        $q = $pdo->prepare($sql);
                        $q->execute(array()); 
                        
                    }
            }
        }
        
        $foodlicense = $_FILES["foodlicense"];
        $gst_cert = $_FILES["gst_cert"];
        
        $gst_cert_title = "";
        $foodlicense_title = "";
        
        $documentPath = "brandDocuments/".$id."/";
        
        if($foodlicense['name'] != "") {
            
            if (!file_exists($documentPath)) {
                mkdir($documentPath, 0777, true);
            }

            $foodlicense_file = $_FILES['foodlicense'];    
            $foodlicense_title = "foodlicense_".date('d_m_Y_H_i_s')."_".$foodlicense['name'];
            move_uploaded_file($_FILES['foodlicense']['tmp_name'], $documentPath.$foodlicense_title);
            
            $sql = "INSERT INTO `brand_documents`(`brand_id`, `document_title`, `file_title`, `is_active`) VALUES (?, ?, ?, ?)";
            $q = $pdo->prepare($sql);
            $q->execute(array($id, "Food License", $foodlicense_title, '1')); 
        }
        
        if($gst_cert['name'] != "") {
            
            if (!file_exists($documentPath)) {
                mkdir($documentPath, 0777, true);
            }

            $gst_cert_file = $_FILES['gst_cert'];    
            $gst_cert_title = "gst_certificate_".date('d_m_Y_H_i_s')."_".$gst_cert['name'];
            move_uploaded_file($_FILES['gst_cert']['tmp_name'], $documentPath.$gst_cert_title);
            
            $sql = "INSERT INTO `brand_documents`(`brand_id`, `document_title`, `file_title`, `is_active`) VALUES (?, ?, ?, ?)";
            $q = $pdo->prepare($sql);
            $q->execute(array($id, "GST Certificate", $gst_cert_title, '1')); 
        }
        
        header("location: onboarded-brands");
        
                        
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

    <title>OnBoard Brand</title>

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
                 
                <form action="#" method="POST" enctype="multipart/form-data" id="myForm">
                    <div
                      class="d-flex flex-column flex-md-row justify-content-between align-items-start align-items-md-center mb-6 row-gap-4">
                      <div class="d-flex flex-column justify-content-center">
                        <h4 class="mb-1">OnBoard a Brand</h4>
                        <!-- <p class="mb-0">Orders placed across your store</p> -->
                      </div>
                      <div class="d-flex align-content-center flex-wrap gap-4">
                        <button type="button" onclick="javascript: window.location.href = 'approved-brands';" class="btn btn-outline-secondary">Discard</button>
                        <!-- <button class="btn btn-outline-primary">Save draft</button> -->
                        <button type="submit" name="submit" class="btn btn-primary">OnBoard Brand</button>
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
                            <!-- <div class="form-floating form-floating-outline mb-5">
                              <input
                                type="text"
                                class="form-control"
                                id="ecommerce-product-name"
                                placeholder="Brand title"
                                name="productTitle"
                                aria-label="Brand title" />
                              <label for="ecommerce-product-name">First Name</label>
                            </div> -->

                            <div class="row mb-5 gx-5">
                              <div class="col">
                                <div class="form-floating form-floating-outline">
                                  <input
                                    type="text"
                                    class="form-control"
                                    id="ecommerce-product-firstName"
                                    placeholder="00000"
                                    name="firstName"
                                    value="<?php echo $firstname; ?>"
                                    aria-label="Brand First Name" />
                                  <label for="ecommerce-product-firstName">First Name</label>
                                </div>
                              </div>
                              <div class="col">
                                <div class="form-floating form-floating-outline">
                                  <input
                                    type="text"
                                    class="form-control"
                                    id="ecommerce-product-lastname"
                                    placeholder="0123-4567"
                                    name="lastname"
                                    value="<?php echo $lastname; ?>"
                                    aria-label="Brand Last Name" />
                                  <label for="ecommerce-product-name">Last Name</label>
                                </div>
                              </div>
                            </div>

                            <div class="row mb-5 gx-5">
                              <div class="col">
                                <div class="form-floating form-floating-outline">
                                  <input
                                    type="email"
                                    class="form-control"
                                    id="ecommerce-product-email"
                                    placeholder="00000"
                                    name="email"
                                    value="<?php echo $email; ?>"
                                    aria-label="Brand Email" />
                                  <label for="ecommerce-product-sku">Email</label>
                                </div>
                              </div>
                              <div class="col">
                                <div class="form-floating form-floating-outline">
                                  <input
                                    type="text"
                                    class="form-control"
                                    id="ecommerce-product-barcode"
                                    placeholder="12321-45671"
                                    name="contact"
                                    value="<?php echo $contact; ?>"
                                    aria-label="Brand barcode" />
                                  <label for="ecommerce-product-name">Contact</label>
                                </div>
                              </div>
                            </div>
                            
                            <!-- Comment -->
                            <!-- <div>
                              <p class="mb-1">Description (Optional)</p>
                              <div class="form-control p-0 pt-1">
                                <div class="comment-toolbar border-0 border-bottom">
                                  <div class="d-flex justify-content-start">
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
                                <div class="comment-editor border-0 pb-1" id="ecommerce-category-description"></div>
                              </div>
                            </div> -->
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
                              
                            <div class="form-floating form-floating-outline mb-5">
                              <input
                                type="text"
                                class="form-control"
                                id="businessname"
                                placeholder="Business Name"
                                name="businessname"
                                value="<?php echo $business_name; ?>"
                                aria-label="Business Name" />
                              <label for="ecommerce-product-price">Business Name</label>
                            </div>
                            <div class="form-floating form-floating-outline mb-5">
                              <input
                                type="number"
                                class="form-control"
                                id="registration_year"
                                placeholder="Year of Registration In Industry"
                                name="registration_year"
                                value="<?php echo $registration_year == 0000 ? "" : $registration_year; ?>"
                                aria-label="Year of Registration In Industry" />
                              <label for="ecommerce-product-discount-price">Year of Registration In Industry</label>
                            </div>
                            
                            <div class="form-floating form-floating-outline mb-5">
                              <input
                                type="text"
                                class="form-control"
                                id="gst_number"
                                placeholder="GST Number"
                                name="gst_number"
                                value="<?php echo $gst_number; ?>"
                                aria-label="GST Number" />
                              <label for="GST Number">GST Number</label>
                            </div>
                            <div class="form-floating form-floating-outline mb-5">
                              <input
                                type="text"
                                class="form-control"
                                id="food_licence_number"
                                placeholder="Food Licence Number"
                                name="food_licence_number"
                                value="<?php echo $food_licence_number; ?>"
                                aria-label="Food Licence Number" />
                              <label for="Food Licence Number">Food Licence Number</label>
                            </div>
                            <!-- Charge tax check box -->
                            <!-- <div class="form-check m-2 me-0 pb-2">
                              <input class="form-check-input" type="checkbox" value="" id="price-charge-tax" checked />
                              <label class="form-check-label" for="price-charge-tax"> Charge tax on this product </label>
                            </div> -->
                            <!-- Instock switch -->
                            <!-- <div class="d-flex justify-content-between align-items-center border-top pt-4">
                              <p class="mb-0">In Same</p>
                              <div class="w-25 d-flex justify-content-end">
                                <div class="form-check form-switch me-n3 mb-0">
                                  <input type="checkbox" class="form-check-input" checked />
                                </div>
                              </div>
                            </div> -->
                          </div>
                        </div>
                        <!-- /Business Information -->                         

                        <div class="card mb-6">
                          <div class="card-header">
                            <h5 class="card-title mb-0">Registered Address</h5>
                            <hr>
                          </div>
                          <div class="card-body">
                              
                            <div class="form-floating form-floating-outline mb-5">
                              <input
                                type="text"
                                class="form-control"
                                id="r_address_line_1"
                                placeholder="Registered Address Line 1"
                                name="r_address_line_1"
                                
                                aria-label="Registered-Address-Line-1" />
                              <label for="Registered-Address-Line-1">Registered Address Line 1</label>
                            </div>
                            <div class="form-floating form-floating-outline mb-5">
                              <input
                                type="text"
                                class="form-control"
                                id="r_address_line_2"
                                placeholder="Registered Address Line 2"
                                name="r_address_line_2"
                                
                                aria-label="Registered-Address-Line-2" />
                              <label for="Registered-Address-Line-2">Registered Address Line 2</label>
                            </div>
                            
                            <div class="form-floating form-floating-outline mb-5">
                              <input
                                type="text"
                                class="form-control"
                                id="r_taluka"
                                placeholder="Registered Taluka"
                                name="r_taluka"
                                
                                aria-label="Registered Taluka" />
                              <label for="Registered Taluka">Registered Taluka</label>
                            </div>
                            
                            <div class="form-floating form-floating-outline mb-5">
                              <input
                                type="text"
                                class="form-control"
                                id="r_city"
                                placeholder="Registered City"
                                name="r_city"
                                
                                aria-label="Registered City" />
                              <label for="Registered City">Registered City</label>
                            </div>
                            
                            <div class="form-floating form-floating-outline mb-5">
                              <input
                                type="text"
                                class="form-control"
                                id="r_state"
                                placeholder="Registered State"
                                name="r_state"
                                
                                aria-label="Registered State" />
                              <label for="Registered State">Registered State</label>
                            </div>
                            
                            <div class="form-floating form-floating-outline mb-5">
                              <input
                                type="number"
                                maxlength="6"
                                class="form-control"
                                id="r_pincode"
                                placeholder="Registered Pincode"
                                name="r_pincode"
                                
                                aria-label="Registered Pincode" />
                              <label for="Registered Pincode">Registered Pincode</label>
                            </div>
                            
                          </div>
                        </div>

                        <div class="card mb-6">
                          <div class="card-header">
                            <h5 class="card-title mb-0">Delivery Address</h5>
                            <hr>
                          </div>
                          <div class="card-body">
                              
                            <div class="form-floating form-floating-outline mb-5">
                              <input
                                type="text"
                                class="form-control"
                                id="d_address_line_1"
                                placeholder="Delivery Address Line 1"
                                name="d_address_line_1"
                                
                                aria-label="Delivery-Address-Line-1" />
                              <label for="Delivery-Address-Line-1">Delivery Address Line 1</label>
                            </div>
                            <div class="form-floating form-floating-outline mb-5">
                              <input
                                type="text"
                                class="form-control"
                                id="d_address_line_2"
                                placeholder="Delivery Address Line 2"
                                name="d_address_line_2"
                                
                                aria-label="Delivery-Address-Line-2" />
                              <label for="Delivery-Address-Line-2">Delivery Address Line 2</label>
                            </div>
                            
                            <div class="form-floating form-floating-outline mb-5">
                              <input
                                type="text"
                                class="form-control"
                                id="d_taluka"
                                placeholder="Delivery Taluka"
                                name="d_taluka"
                                
                                aria-label="Delivery Taluka" />
                              <label for="Delivery Taluka">Delivery Taluka</label>
                            </div>
                            
                            <div class="form-floating form-floating-outline mb-5">
                              <input
                                type="text"
                                class="form-control"
                                id="d_city"
                                placeholder="Delivery City"
                                name="d_city"
                                
                                aria-label="Delivery City" />
                              <label for="Delivery City">Delivery City</label>
                            </div>
                            
                            <div class="form-floating form-floating-outline mb-5">
                              <input
                                type="text"
                                class="form-control"
                                id="d_state"
                                placeholder="Delivery State"
                                name="d_state"
                                
                                aria-label="Delivery State" />
                              <label for="Delivery State">Delivery State</label>
                            </div>
                            
                            <div class="form-floating form-floating-outline mb-5">
                              <input
                                type="number"
                                maxlength="6"
                                class="form-control"
                                id="d_pincode"
                                placeholder="Delivery Pincode"
                                name="d_pincode"
                                
                                aria-label="Delivery Pincode" />
                              <label for="Delivery Pincode">Delivery Pincode</label>
                            </div>
                            
                          </div>
                        </div>

                            
                        <!-- Documents -->
                        <div class="card mb-6">
                          <div class="card-header">
                            <h5 class="card-title mb-0">Documents</h5>
                            <hr>
                          </div>
                          <div class="card-body">
                            <!-- <form class="form-repeater"> -->
                              <div data-repeater-list="group-a">
                                <div data-repeater-item>
                                  <div class="row gx-5">
                                    <!-- <div class="mb-6 col-sm-4">
                                      <div class="form-floating form-floating-outline">
                                        <select
                                          id="select2Basic"
                                          class="select2 form-select"
                                          data-placeholder="Option"
                                          data-allow-clear="true">
                                          <option value="doc_1" selected>Document 1</option>
                                        </select>
                                        <label for="select2Basic">Option</label>
                                      </div>
                                    </div> -->
                                    <div class="mb-2 col-sm-12">
                                      <!-- <div class="form-floating form-floating-outline">
                                        <input
                                          type="text"
                                          id="form-repeater-1-2"
                                          class="form-control"
                                          placeholder="Enter size" />
                                        <label for="form-repeater-1-2">Value</label>
                                      </div> -->
                                      <!-- <div class="mb-4">
                                        <label for="formFile" class="form-label">Default file input example</label>
                                        <input class="form-control" type="file" id="formFile" />
                                      </div> -->
                                      <div class="input-group">
                                        <label class="input-group-text" for="inputGroupFile01"><b>Food License</b></label>
                                        <input type="file" id="foodlicense" name="foodlicense" class="form-control" id="inputGroupFile01" />
                                      </div>
                                    </div>
                                  </div>
                                  <div class="row gx-5">
                                    <div class="mb-2 col-sm-12">
                                      <div class="input-group">
                                        <label class="input-group-text" for="inputGroupFile02"><b>GST Certificate</b></label>
                                        <input type="file" id="gst_cert" name="gst_cert" class="form-control" id="inputGroupFile02" />
                                      </div>
                                    </div>
                                  </div>
                                  <div class="row gx-5" style="display: none;">
                                    <div class="mb-2 col-sm-12">
                                      <div class="input-group">
                                        <label class="input-group-text" for="inputGroupFile03"><b>Food License</b></label>
                                        <input type="file" id="inputfile3" name="inputfile3" class="form-control" id="inputGroupFile03" />
                                      </div>
                                    </div>
                                  </div>
                                  <div class="row gx-5" style="display: none;">
                                    <div class="mb-2 col-sm-12">
                                      <div class="input-group">
                                        <label class="input-group-text" for="inputGroupFile04"><b>Food License</b></label>
                                        <input type="file" id="inputfile4" name="inputfile4" class="form-control" id="inputGroupFile04" />
                                      </div>
                                    </div>
                                  </div>
                                  
                                </div>
                              </div>
                              <!-- <div>
                                <button class="btn btn-primary" data-repeater-create>
                                  <i class="ri-add-line ri-16px me-2"></i>
                                  Add another option
                                </button>
                              </div> -->
                            <!-- </form> -->
                          </div>
                        </div>
                        <!-- /Documents -->
                         
                      </div>
                      <!-- /Second column -->

                      <!-- Second column -->
                      <div class="col-12 col-lg-4">

                      
                        <!-- Logo -->
                        <div class="card mb-6">
                            <h5 class="card-header">Logo</h5>
                            <div class="card-body">
                                <?php if($brand_logo != "") { ?>
                                    <div>
                                      <img class="img-fluid mb-2 rounded-4" src="uploads/logos/<?php echo $brand_logo; ?>">
                                      <hr>
                                    </div>
                                <?php } ?>
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
                                <button type="button" onclick="myFunction(event, <?php echo $id; ?>)" class="btn btn-primary mt-4">Upload Logo</button>
                            </div>
                        </div>
                        <!-- /Logo -->

                        <!-- Requested Categories -->
                        <?php 
                          $primarycategoriesNames = "";
                          $sql = "SELECT * FROM category";
                          $q = $pdo->query($sql);
                          foreach ($pdo->query($sql) as $row) {
                            if(in_array($row['category_id'], $categorieIDs)) {
                              if($primarycategoriesNames != "") {
                                $primarycategoriesNames .= ", ".'{"value" : "'.$row['category_name'].'","readonly" : true, "title" : "'.$row['category_name'].'"}';
                              } else {
                                $primarycategoriesNames .= '{"value" : "'.$row['category_name'].'","readonly" : true, "title" : "'.$row['category_name'].'"}';
                              }
                              // if($primarycategoriesNames != "") {
                              //   $row['category_name'] != "" ? $primarycategoriesNames .= ", ".$row['category_name'] : "";
                              // else 
                              //   $row['category_name'] != "" ? $primarycategoriesNames .= $row['category_name'] : "";
                            }    
                          } 
                        ?>
                        <div class="card mb-6">
                          <div class="card-header">
                            <h5 class="card-title mb-0">Requested Categories</h5>
                          </div>
                          <div class="card-body">                            
                              <div class="mb-3">
                                <div class="form-floating form-floating-outline"> 
                                  <input
                                      id="TagifyReadonly"
                                      class="form-control readonlyMix"
                                      name="TagifyReadonly"
                                      readonly
                                      value = '<?php echo '['.$primarycategoriesNames.']'; ?>'
                                  >
                                    <label for="TagifyReadonly">Readonly</label>
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
                                    name="ProvidedCategories"
                                    class="form-control h-auto"
                                    placeholder="select Categories"
                                    value="<?php echo implode(", ", $categorieNames); ?>"
                                    />
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

    <script src="assets\js\app-ecommerce-brand-onboard.js"></script>                     
    
    <!-- <script src="assets/vendor/libs/bootstrap-select/bootstrap-select.js"></script> -->
    <!-- <script src="assets/vendor/libs/bloodhound/bloodhound.js"></script> -->

  </body>
</html>
a