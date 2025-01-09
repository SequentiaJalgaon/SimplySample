<?php
include("dist/conf/db.php");
$pdo = Database::connect();



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
              WHERE   b.brand_id = 1
              GROUP BY bc.category_id";
      $q = $pdo->prepare($sql);
      $q->execute(array());
      $dataBrand = $q->fetchAll(PDO::FETCH_ASSOC);

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
      foreach ($dataBrand as $row) 
      { 
        array_push($categories, $row["category_id"]);

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

    <title>OnBoard Brand</title>

    <meta name="description" content="" />
   
    <!-- *********** header******************  -->
    <?php include ('layout/header_css.php');  ?>
    <!-- *********** /header******************  -->
    
    <!-- Vendors CSS -->
    <link rel="stylesheet" href="assets/vendor/libs/quill/typography.css" />
    <link rel="stylesheet" href="assets/vendor/libs/quill/katex.css" />
    <link rel="stylesheet" href="assets/vendor/libs/quill/editor.css" />
    <link rel="stylesheet" href="assets/vendor/libs/select2/select2.css" />
    <link rel="stylesheet" href="assets/vendor/libs/dropzone/dropzone.css" />
    <link rel="stylesheet" href="assets/vendor/libs/flatpickr/flatpickr.css" />
    <link rel="stylesheet" href="assets/vendor/libs/tagify/tagify.css" />

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
                 
                <form action="#" method="POST" enctype="multipart/form-data">
                    <div
                      class="d-flex flex-column flex-md-row justify-content-between align-items-start align-items-md-center mb-6 row-gap-4">
                      <div class="d-flex flex-column justify-content-center">
                        <h4 class="mb-1">OnBoard a Brand</h4>
                        <!-- <p class="mb-0">Orders placed across your store</p> -->
                      </div>
                      <div class="d-flex align-content-center flex-wrap gap-4">
                        <button class="btn btn-outline-secondary">Discard</button>
                        <!-- <button class="btn btn-outline-primary">Save draft</button> -->
                        <button type="submit" name="submit" class="btn btn-primary">OnBoard Brand</button>
                      </div>
                    </div>
                    <div class="row">
                      <!-- First column-->
                      <div class="col-12 col-lg-8">
                        <!-- Brand Information -->
                        <div class="card mb-6">
                          <div class="card-header">
                            <h5 class="card-tile mb-0">Primary Brand information</h5>
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
                            <?php 
                              $primarycategoriesNames = "";
                              $sql = "SELECT * FROM category WHERE is_active = '1'";
                              $q = $pdo->query($sql);
                              foreach ($pdo->query($sql) as $row) {
                                if(in_array($row['category_id'], $categories)) {
                                  $primarycategoriesNames .= $row['category_name'].', ';
                                }                                
                              } 
                            ?>
                            <div>
                              <div class="form-floating form-floating-outline">
                                <input
                                  id="ecommerce-product-tags"
                                  class="form-control h-auto"
                                  name="primaryCategories[]"
                                  value="<?php echo $primarycategoriesNames; ?>"
                                  aria-label="Brand Categories" />
                                <label for="ecommerce-product-tags">Categories</label>
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
                        <!-- /Brand Information -->
                        <!-- Media -->
                        <div class="card mb-6">
                          <div class="card-header d-flex justify-content-between align-items-center">
                            <h5 class="mb-0 card-title">Brand Logo</h5>
                            <!-- <a href="javascript:void(0);" class="fw-medium">Add media from URL</a> -->
                          </div>
                          <div class="card-body">
                            <!-- <form action="/upload" class="dropzone needsclick" id="dropzone-basic"> -->
                              <div class="dz-message needsclick my-12">
                                <div class="d-flex justify-content-center">
                                  <div class="avatar">
                                    <span class="avatar-initial rounded-3 bg-label-secondary">
                                      <i class="ri-upload-2-line ri-24px"></i>
                                    </span>
                                  </div>
                                </div>
                                <p class="h4 needsclick my-2">Drag and drop your image here</p>
                                <small class="note text-muted d-block fs-6 my-2">or</small>
                                <span class="needsclick btn btn-sm btn-outline-primary" id="btnBrowse">Browse image</span>
                              </div>
                              <div class="fallback">
                                <input name="file" type="file" />
                              </div>
                            <!-- </form> -->
                          </div>
                        </div>
                        <!-- /Media -->
                        <!-- Variants -->
                        <div class="card mb-6">
                          <div class="card-header">
                            <h5 class="card-title mb-0">Documents</h5>
                          </div>
                          <div class="card-body">
                            <!-- <form class="form-repeater"> -->
                              <div data-repeater-list="group-a">
                                <div data-repeater-item>
                                  <div class="row gx-5">
                                    <div class="mb-6 col-sm-4">
                                      <div class="form-floating form-floating-outline">
                                        <select
                                          id="select2Basic"
                                          class="select2 form-select"
                                          data-placeholder="Option"
                                          data-allow-clear="true">
                                          <option value="doc_1" selected>Document 1</option>
                                          <option value="doc_2">Document 2</option>
                                          <option value="doc_3">Document 3</option>
                                          <option value="doc_4">Document 4</option>
                                        </select>
                                        <label for="select2Basic">Option</label>
                                      </div>
                                    </div>
                                    <div class="mb-6 col-sm-8">
                                      <div class="form-floating form-floating-outline">
                                        <input
                                          type="text"
                                          id="form-repeater-1-2"
                                          class="form-control"
                                          placeholder="Enter size" />
                                        <label for="form-repeater-1-2">Value</label>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                              <div>
                                <button class="btn btn-primary" data-repeater-create>
                                  <i class="ri-add-line ri-16px me-2"></i>
                                  Add another option
                                </button>
                              </div>
                            <!-- </form> -->
                          </div>
                        </div>
                        <!-- /Variants -->
                        <!-- Inventory -->
                        <!-- <div class="card mb-6">
                          <div class="card-header">
                            <h5 class="card-title mb-0">Inventory</h5>
                          </div>
                          <div class="card-body">
                            <div class="row"> -->
                              <!-- Navigation -->
                              <!-- <div class="col-12 col-md-4 mx-auto card-separator">
                                <div class="nav-align-left d-flex justify-content-between flex-column mb-4 mb-md-0 pe-md-3">
                                  <ul class="nav nav-pills flex-column">
                                    <li class="nav-item">
                                      <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#restock">
                                        <i class="ri-add-line me-2"></i>
                                        <span class="align-middle">Restock</span>
                                      </button>
                                    </li>
                                    <li class="nav-item">
                                      <button class="nav-link" data-bs-toggle="tab" data-bs-target="#shipping">
                                        <i class="ri-car-line me-2"></i>
                                        <span class="align-middle">Shipping</span>
                                      </button>
                                    </li>
                                    <li class="nav-item">
                                      <button class="nav-link" data-bs-toggle="tab" data-bs-target="#global-delivery">
                                        <i class="ri-global-line me-2"></i>
                                        <span class="align-middle">Global Delivery</span>
                                      </button>
                                    </li>
                                    <li class="nav-item">
                                      <button class="nav-link" data-bs-toggle="tab" data-bs-target="#attributes">
                                        <i class="ri-link-m me-2"></i>
                                        <span class="align-middle">Attributes</span>
                                      </button>
                                    </li>
                                    <li class="nav-item">
                                      <button class="nav-link" data-bs-toggle="tab" data-bs-target="#advanced">
                                        <i class="ri-lock-unlock-line me-2"></i>
                                        <span class="align-middle">Advanced</span>
                                      </button>
                                    </li>
                                  </ul>
                                </div>
                              </div> -->
                              <!-- /Navigation -->
                              <!-- Options -->
                              <!-- <div class="col-12 col-md-8 pt-6 pt-md-0">
                                <div class="tab-content p-0 pe-xl-0 ps-md-4"> -->
                                  <!-- Restock Tab -->
                                  <!-- <div class="tab-pane fade show active" id="restock" role="tabpanel">
                                    <h6 class="text-body">Options</h6>
                                    <div class="row mb-4 g-4">
                                      <div class="col-12 col-sm-8 col-lg-12 col-xxl-8">
                                        <div class="form-floating form-floating-outline">
                                          <input
                                            type="number"
                                            class="form-control"
                                            id="ecommerce-product-stock"
                                            placeholder="Quantity"
                                            name="quantity"
                                            aria-label="Quantity" />
                                          <label for="ecommerce-product-stock">Add to Stock</label>
                                        </div>
                                      </div>
                                      <div class="col-6 col-sm-4 d-grid col-lg-6 col-xxl-4">
                                        <button class="btn btn-primary btn-lg">
                                          <i class="ri-check-line ri-16px me-2"></i>Confirm
                                        </button>
                                      </div>
                                    </div>
                                    <div>
                                      <h6 class="mb-2 fw-normal">
                                        Brand in stock now: <span class="fw-medium">54</span>
                                      </h6>
                                      <h6 class="mb-2 fw-normal">Brand in transit: <span class="fw-medium">390</span></h6>
                                      <h6 class="mb-2 fw-normal">
                                        Last time restocked: <span class="fw-medium">24th June, 2023</span>
                                      </h6>
                                      <h6 class="mb-0 fw-normal">
                                        Total stock over lifetime: <span class="fw-medium">2430</span>
                                      </h6>
                                    </div>
                                  </div> -->
                                  <!-- Shipping Tab -->
                                  <!-- <div class="tab-pane fade" id="shipping" role="tabpanel">
                                    <h6 class="mb-3 text-body">Shipping Type</h6>
                                    <div>
                                      <div class="form-check mb-4">
                                        <input class="form-check-input" type="radio" name="shippingType" id="seller" />
                                        <label class="form-check-label d-flex flex-column gap-1" for="seller">
                                          <span class="h6 mb-0">Fulfilled by Seller</span>
                                          <small
                                            >You'll be responsible for product delivery. Any damage or delay during shipping
                                            may cost you a Damage fee.</small
                                          >
                                        </label>
                                      </div>
                                      <div class="form-check mb-6">
                                        <input
                                          class="form-check-input"
                                          type="radio"
                                          name="shippingType"
                                          id="companyName"
                                          checked />
                                        <label class="form-check-label d-flex flex-column gap-1" for="companyName">
                                          <span class="h6 mb-0"
                                            >Fulfilled by Company name &nbsp;<span
                                              class="badge rounded-pill rounded-2 badge-warning bg-label-warning fs-tiny py-1"
                                              >RECOMMENDED</span
                                            ></span
                                          >
                                          <small
                                            >Your product, Our responsibility. For a measly fee, we will handle the delivery
                                            process for you.</small
                                          >
                                        </label>
                                      </div>
                                      <p class="mb-0">
                                        See our <a href="javascript:void(0);">Delivery terms and conditions</a> for details
                                      </p>
                                    </div>
                                  </div> -->
                                  <!-- Global Delivery Tab -->
                                  <!-- <div class="tab-pane fade" id="global-delivery" role="tabpanel">
                                    <h6 class="mb-3 text-body">Global Delivery</h6> -->
                                    <!-- Worldwide delivery -->
                                    <!-- <div class="form-check mb-4">
                                      <input class="form-check-input" type="radio" name="globalDel" id="worldwide" />
                                      <label class="form-check-label d-flex flex-column gap-1" for="worldwide">
                                        <span class="h6 mb-0">Worldwide delivery</span>
                                        <small
                                          >Only available with Shipping method:
                                          <a href="javascript:void(0);">Fulfilled by Company name</a></small
                                        >
                                      </label>
                                    </div> -->
                                    <!-- Global delivery -->
                                    <!-- <div class="form-check mb-4">
                                      <input class="form-check-input" type="radio" name="globalDel" checked />
                                      <label class="form-check-label w-75 pe-12 mb-3" for="country-selected">
                                        <span class="h6">Selected Countries</span>
                                      </label>
                                      <div class="form-floating form-floating-outline">
                                        <input
                                          type="text"
                                          class="form-control"
                                          placeholder="Type Country name"
                                          id="country-selected" />
                                        <label for="ecommerce-product-name">Countries</label>
                                      </div>
                                    </div> -->
                                    <!-- Local delivery -->
                                    <!-- <div class="form-check">
                                      <input class="form-check-input" type="radio" name="globalDel" id="local" />
                                      <label class="form-check-label d-flex flex-column gap-1" for="local">
                                        <span class="h6 mb-0">Local delivery</span>
                                        <small
                                          >Deliver to your country of residence :
                                          <a href="javascript:void(0);">Change profile address</a></small
                                        >
                                      </label>
                                    </div>
                                  </div> -->
                                  <!-- Attributes Tab -->
                                  <!-- <div class="tab-pane fade" id="attributes" role="tabpanel">
                                    <h6 class="mb-2 text-body">Attributes</h6>
                                    <div> -->
                                      <!-- Fragile Brand -->
                                      <!-- <div class="form-check mb-4">
                                        <input class="form-check-input" type="checkbox" value="fragile" id="fragile" />
                                        <label class="form-check-label" for="fragile">
                                          <span>Fragile Brand</span>
                                        </label>
                                      </div> -->
                                      <!-- Biodegradable -->
                                      <!-- <div class="form-check mb-4">
                                        <input
                                          class="form-check-input"
                                          type="checkbox"
                                          value="biodegradable"
                                          id="biodegradable" />
                                        <label class="form-check-label" for="biodegradable">
                                          <span>Biodegradable</span>
                                        </label>
                                      </div> -->
                                      <!-- Frozen Brand -->
                                      <!-- <div class="form-check mb-4">
                                        <input
                                          class="form-check-input"
                                          type="checkbox"
                                          id="frozen"
                                          value="frozen"
                                          checked />
                                        <label class="form-check-label w-75 pe-12 mb-3" for="frozen">
                                          <span class="mb-1">Frozen Brand</span>
                                        </label>
                                        <div class="form-floating form-floating-outline">
                                          <input type="number" class="form-control" placeholder="In Celsius" id="temp" />
                                          <label for="temp">Max. allowed Temperature</label>
                                        </div>
                                      </div> -->
                                      <!-- Exp Date -->
                                      <!-- <div class="form-check">
                                        <input
                                          class="form-check-input"
                                          type="checkbox"
                                          value="expDate"
                                          id="expDate"
                                          checked />
                                        <label class="form-check-label w-75 pe-12 mb-3" for="expDate">
                                          <span class="mb-1">Expiry Date of Brand</span>
                                        </label>
                                        <div class="form-floating form-floating-outline">
                                          <input type="date" class="product-date form-control" id="flatpickr-date" />
                                        </div>
                                      </div>
                                    </div>
                                  </div> -->
                                  <!-- /Attributes Tab -->
                                  <!-- Advanced Tab -->
                                  <!-- <div class="tab-pane fade" id="advanced" role="tabpanel">
                                    <h6 class="mb-3 text-body">Advanced</h6>
                                    <div class="row"> -->
                                      <!-- Brand Id Type -->
                                      <!-- <div class="col">
                                        <h6 class="mb-2">Brand ID Type</h6>
                                        <div class="form-floating form-floating-outline">
                                          <select
                                            id="product-id"
                                            class="select2 form-select"
                                            data-placeholder="ISBN"
                                            data-allow-clear="true">
                                            <option value="">ISBN</option>
                                            <option value="ISBN">ISBN</option>
                                            <option value="UPC">UPC</option>
                                            <option value="EAN">EAN</option>
                                            <option value="JAN">JAN</option>
                                          </select>
                                          <label for="product-id">Id</label>
                                        </div>
                                      </div> -->
                                      <!-- Brand Id -->
                                      <!-- <div class="col">
                                        <h6 class="mb-2">Brand ID</h6>
                                        <div class="form-floating form-floating-outline">
                                          <input
                                            type="number"
                                            id="product-id-1"
                                            class="form-control"
                                            placeholder="ISBN Number" />
                                          <label for="product-id-1">Id Number</label>
                                        </div>
                                      </div>
                                    </div>
                                  </div> -->
                                  <!-- /Advanced Tab -->
                                <!-- </div>
                              </div> -->
                              <!-- /Options-->
                            <!-- </div>
                          </div>
                        </div> -->
                        <!-- /Inventory -->
                      </div>
                      <!-- /Second column -->

                      <!-- Second column -->
                      <div class="col-12 col-lg-4">
                        <!-- Pricing Card -->
                        <div class="card mb-6">
                          <div class="card-header">
                            <h5 class="card-title mb-0">Business Information</h5>
                          </div>
                          <div class="card-body">
                            <!-- Base Price -->
                            <div class="form-floating form-floating-outline mb-5">
                              <input
                                type="text"
                                class="form-control"
                                id="ecommerce-product-price"
                                placeholder="Price"
                                name="businessname"
                                value="<?php echo $business_name; ?>"
                                aria-label="Brand price" />
                              <label for="ecommerce-product-price">Business Name</label>
                            </div>

                            <!-- Discounted Price -->
                            <div class="form-floating form-floating-outline mb-5">
                              <input
                                type="text"
                                class="form-control"
                                id="ecommerce-product-discount-price"
                                placeholder="Discounted Price"
                                name="registerAddress"
                                value="<?php echo $registerAddress; ?>"
                                aria-label="Brand discounted price" />
                              <label for="ecommerce-product-discount-price">Registered Address</label>
                            </div>
                            <!-- Discounted Price -->
                            <div class="form-floating form-floating-outline mb-5">
                              <input
                                type="number"
                                class="form-control"
                                id="ecommerce-product-discount-price"
                                placeholder="Discounted Price"
                                name="registration_year"
                                value="<?php echo $registration_year; ?>"
                                aria-label="Brand discounted price" />
                              <label for="ecommerce-product-discount-price">Year of Registration In Industry</label>
                            </div>
                            <!-- Discounted Price -->
                            <div class="form-floating form-floating-outline mb-5">
                              <input
                                type="text"
                                class="form-control"
                                id="ecommerce-product-discount-price"
                                placeholder="Discounted Price"
                                name="delieveryAddress"
                                value="<?php echo $delieveryAddress; ?>"
                                aria-label="Brand discounted price" />
                              <label for="ecommerce-product-discount-price">Delivery Pick-up Address </label>
                            </div>
                            <!-- Discounted Price -->
                            <div class="form-floating form-floating-outline mb-5">
                              <input
                                type="text"
                                class="form-control"
                                id="ecommerce-product-discount-price"
                                placeholder="Discounted Price"
                                name="gst_number"
                                value="<?php echo $gst_number; ?>"
                                aria-label="Brand discounted price" />
                              <label for="ecommerce-product-discount-price">GST Number</label>
                            </div>
                            <!-- Discounted Price -->
                            <div class="form-floating form-floating-outline mb-5">
                              <input
                                type="text"
                                class="form-control"
                                id="ecommerce-product-discount-price"
                                placeholder="Discounted Price"
                                name="food_licence_number"
                                value="<?php echo $food_licence_number; ?>"
                                aria-label="Brand discounted price" />
                              <label for="ecommerce-product-discount-price">Food Licence</label>
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
                        <!-- /Pricing Card -->
                        <!-- Organize Card -->
                        <div class="card mb-6">
                          <div class="card-header">
                            <h5 class="card-title mb-0">Product Categories</h5>
                          </div>
                          <div class="card-body">
                            <!-- Vendor -->
                            <!-- <div class="mb-5 col ecommerce-select2-dropdown">
                              <div class="form-floating form-floating-outline">
                                <select id="vendor" class="select2 form-select" data-placeholder="Select Vendor">
                                  <option value="">Select Vendor</option>
                                  <option value="men-clothing">Men's Clothing</option>
                                  <option value="women-clothing">Women's-clothing</option>
                                  <option value="kid-clothing">Kid's-clothing</option>
                                </select>
                                <label for="vendor">Vendor</label>
                              </div>
                            </div> -->
                            <!-- Category -->
                            <!-- <div
                              class="mb-5 col ecommerce-select2-dropdown d-flex justify-content-between align-items-center">
                              <div class="form-floating form-floating-outline w-100 me-4">
                                <select id="category-org" class="select2 form-select" data-placeholder="Select Category">
                                  <option value="">Select Category</option>
                                  <option value="Household">Household</option>
                                  <option value="Management">Management</option>
                                  <option value="Electronics">Electronics</option>
                                  <option value="Office">Office</option>
                                  <option value="Automotive">Automotive</option>
                                </select>
                                <label for="category-org">Category</label>
                              </div>
                              <div>
                                <button class="btn btn-outline-primary btn-icon btn-lg"><i class="ri-add-line"></i></button>
                              </div>
                            </div> -->
                            <!-- Collection -->
                            <!-- <div class="mb-5 col ecommerce-select2-dropdown">
                              <div class="form-floating form-floating-outline">
                                <select id="collection" class="select2 form-select" data-placeholder="Collection">
                                  <option value="">Collection</option>
                                  <option value="men-clothing">Men's Clothing</option>
                                  <option value="women-clothing">Women's-clothing</option>
                                  <option value="kid-clothing">Kid's-clothing</option>
                                </select>
                                <label for="collection">Collection</label>
                              </div>
                            </div> -->
                            <!-- Status -->
                            <!-- <div class="mb-5 col ecommerce-select2-dropdown">
                              <div class="form-floating form-floating-outline">
                                <select id="status-org" class="select2 form-select" data-placeholder="Select Status">
                                  <option value="">Select Status</option>
                                  <option value="Published">Published</option>
                                  <option value="Scheduled">Scheduled</option>
                                  <option value="Inactive">Inactive</option>
                                </select>
                                <label for="status-org">Status</label>
                              </div>
                            </div> -->
                            <!-- Tags -->
                            <div>
                              <div class="form-floating form-floating-outline">
                                <!-- <input
                                  id="ecommerce-product-tags"
                                  class="form-control h-auto"
                                  name="providedCategories[]"
                                  value="<?php echo implode(", ", $categories); ?>"
                                  aria-label="Brand Categories" />
                                <label for="ecommerce-product-tags">Categories</label> -->
                                <select class="form-control" style="height: 100%" multiple name="providedCategories[]" id="providedCategories">
                                    <!-- <option value="" selected hidden disabled></option> -->
                                    <?php 
                                        var_dump($categories);
                                        $sql = "SELECT * FROM category";
                                        // $sql = "SELECT * FROM admin where login_role = 'ASSISTANT' OR login_role = 'RECEPTIONIST' OR login_role = 'TECHNICIAN' ";
                                        $q = $pdo->query($sql);
                                        foreach ($pdo->query($sql) as $row) {
                                          echo "<option "; 
                                          
                                              if(in_array($row['category_id'], $categories)) {
                                                echo "selected ";
                                              }
                                            
                                              if($row['is_active'] == 0) {
                                                echo " class='text-danger' ";
                                              }
                                            
                                          echo "value='".$row['category_id']."'>".$row['category_name']."</option>";
                                          
                                        } 
                                    ?>
                                </select>

                              </div>
                            </div>
                          </div>
                        </div>
                        <!-- /Organize Card -->
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

    <!-- Vendors JS -->
    <script src="assets/vendor/libs/dropzone/dropzone.js"></script>
    <script src="assets/vendor/libs/jquery-repeater/jquery-repeater.js"></script>
    <script src="assets/vendor/libs/flatpickr/flatpickr.js"></script>
    <script src="assets/vendor/libs/tagify/tagify.js"></script>

  </body>
</html>
a