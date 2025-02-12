<?php
  include("dist/conf/db.php");
  $pdo = Database::connect();

  if(isset($_POST["submit"])) {
    var_dump($_POST); exit();
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

    <title>Edit Product</title>

    <meta name="description" content="" />
   
    <!-- *********** header******************  -->
    <?php include ('layout/header_css.php');  ?>
    <!-- *********** /header******************  -->
    <style>
      /* .form-select + .select2 {
        border:2px solid #ff4d49;
      } */
      /* #ecommerce-product-price::placeholder { */
      /* .select2 + label {
        color: #ff4d49 !important;
      } */

      .was-validated .form-select:invalid + .select2, 
      .form-select.is-invalid + .select2 {
          border:2px solid #ff4d49;
      }

      .was-validated .form-floating:has(.form-select:invalid) > label {
        color: #ff4d49 !important;
      }

      .was-validated #ecommerce-category-description {
        border:2px solid #ff4d49 !important;
      }
      .was-validated #dropzone-multi {
        border:2px solid #ff4d49 !important;
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
            
            <form class="needs-validation" novalidate method="POST" enctype="multipart/form-data">
                <div class="container-xxl flex-grow-1 container-p-y">
                  <div class="app-ecommerce">
                    <!-- Edit Product -->
                    <div
                      class="d-flex flex-column flex-md-row justify-content-between align-items-start align-items-md-center mb-6 row-gap-4">
                      <div class="d-flex flex-column justify-content-center">
                        <h4 class="mb-1">Update Product - <span class="text-danger" id="editProductNameShow"></span></h4>
                        <p class="mb-0">Orders placed across your store</p>
                      </div>
                      <div class="d-flex align-content-center flex-wrap gap-4">
                        <button type="button" onclick="window.location.href='products'" class="btn btn-outline-secondary">Discard</button>
                        <!-- <button class="btn btn-outline-primary">Save draft</button> -->
                        <button name="submit" type="submit" class="btn btn-primary">Update product</button>
                      </div>
                    </div>

                    <div class="row">

                      <!-- First column-->
                      <div class="col-12 col-lg-8">
                        <!-- Product Information -->
                        <div class="card mb-6">
                          <div class="card-header">
                            <h5 class="card-tile mb-0">Product information</h5>
                          </div>
                          <input type="hidden" id="productID" name="productID">
                          <div class="card-body">
                            <div class="form-floating form-floating-outline mb-5">
                              <input
                                type="text"
                                class="form-control"
                                id="ecommerce-product-name"
                                placeholder="Product title"
                                name="productTitle"
                                aria-label="Product title" 
                                required />
                              <label for="ecommerce-product-name">Product Title*</label>
                            </div>
                            
                            <!-- Comment -->
                            <div>
                              <textarea style="display: none" name="productdescription" id="productdescription" required></textarea>
                              <!-- <p class="mb-1">Description*</p> -->
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
                                <div class="comment-editor border-0 pb-1" id="ecommerce-category-description" required></div>
                              </div>
                            </div>
                          </div>
                        </div>
                        <!-- /Product Information -->
                        <!-- Media -->
                        <div class="card mb-6">
                          <div class="card-header d-flex justify-content-between align-items-center">
                            <h5 class="mb-0 card-title">Product Image*</h5>
                            <!-- <a href="javascript:void(0);" class="fw-medium">Edit media from URL</a> -->
                          </div>

                          <div class="card-body">
                            <div action="/upload" class="dropzone needsclick" id="dropzone-multi-productImages">
                              <div class="dz-message needsclick">
                                Drop files here or click to upload
                                <span class="note needsclick"
                                  >(This is just a demo dropzone. Selected files are
                                  <span class="fw-medium">not</span> actually uploaded.)</span
                                >
                              </div>
                              <div class="fallback">
                                <input name="file" type="file"/>
                              </div>
                            </div>
                          </div>
                          
                        </div>
                      </div>
                      <!-- /Second column -->

                      <!-- Second column -->
                      <div class="col-12 col-lg-4">
                        <!-- Pricing Card -->
                        <div class="card mb-6">
                          <div class="card-header">
                            <h5 class="card-title mb-0">Pricing</h5>
                          </div>
                          <div class="card-body">
                            <!-- Base Price -->
                            <div class="form-floating form-floating-outline mb-5">
                              <input
                                type="number"
                                class="form-control"
                                id="ecommerce-product-price"
                                placeholder="Price"
                                name="productPrice"
                                aria-label="Product price" required />
                              <label for="ecommerce-product-price">Best Price*</label>
                            </div>

                            <!-- Discounted Price -->
                            
                                <div class="form-floating form-floating-outline">
                                  <input
                                    type="number"
                                    class="form-control"
                                    id="ecommerce-product-weight"
                                    placeholder="00000"
                                    name="productweight"
                                    aria-label="Product weight" required />
                                  <label for="ecommerce-product-weight">Weight*</label>
                                </div>
                                
                            <div class="d-flex justify-content-between align-items-center border-top pt-4">
                              <p class="mb-0">In stock*</p>
                              <div class="w-25 d-flex justify-content-end">
                                <div class="form-check form-switch me-n3 mb-0">
                                  <input type="checkbox" id="checkStock" name="checkStock" class="form-check-input" checked />
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                        <!-- /Pricing Card -->
                        <!-- Organize Card -->
                        <div class="card mb-6">
                          <div class="card-header">
                            <h5 class="card-title mb-0">Organize</h5>
                          </div>
                          <div class="card-body">
                            <div
                              class="mb-5 col ecommerce-select2-dropdown d-flex justify-content-between align-items-center">
                              <div class="form-floating form-floating-outline w-100 me-4">
                                <select
                                  id="select2Basic"
                                  class="select2 form-select form-select-lg"
                                  name="brand"
                                  data-allow-clear="true" 
                                  placeholder="Select Brands"
                                  required>
                                  <option selected disabled value="">Select Brands*</option>
                                  <?php 
                                      $sql = "SELECT * FROM brands WHERE is_active = '1'";
                                      $q = $pdo->query($sql);
                                      foreach ($pdo->query($sql) as $row) {
                                          if($row['brand_name'] != "") {
                                            echo "<option value =".$row['brand_id'].">".$row['brand_name']."</option>";
                                          }
                                      } 
                                  ?>
                                </select>
                                <label for="select2Basic">Brand*</label>
                                <div class="invalid-feedback">
                                  Please select a valid Brand.
                                </div>
                              </div>
                            </div>
                            <div
                              class="mb-5 col ecommerce-select2-dropdown d-flex justify-content-between align-items-center">
                              <div class="form-floating form-floating-outline w-100 me-4">
                                <select
                                  id="select3Basic"
                                  class="select2 form-select form-select-lg"
                                  name="category"
                                  data-allow-clear="true" required>
                                  <option selected disabled value="">Select Category*</option>
                                  <?php 
                                      $sql = "SELECT * FROM category WHERE is_active = '1'";
                                      $q = $pdo->query($sql);
                                      foreach ($pdo->query($sql) as $row) {
                                          if($row['category_name'] != "") {
                                            echo "<option value =".$row['category_id'].">".$row['category_name']."</option>";
                                          }
                                      } 
                                  ?>
                                </select>
                                <label for="select3Basic">Category*</label>
                                <div class="invalid-feedback">
                                  Please select a valid Category.
                                </div>
                              </div>
                            </div>
                            <div
                              class="mb-5 col ecommerce-select2-dropdown d-flex justify-content-between align-items-center">
                                <div class="form-floating form-floating-outline w-100 me-4">
                                  <select
                                    id="select4Basic"
                                    class="select2 form-select form-select-lg"
                                    name="subcategory"
                                    data-allow-clear="true" required>
                                    <option selected disabled value="">Select Sub Category*</option>
                                    <?php 
                                        $sql = "SELECT * FROM sub_category WHERE is_active = '1'";
                                        $q = $pdo->query($sql);
                                        foreach ($pdo->query($sql) as $row) {
                                            if($row['sub_category_name'] != "") {
                                              echo "<option value =".$row['sub_category_id'].">".$row['sub_category_name']."</option>";
                                            }
                                        } 
                                    ?>
                                  </select>
                                  <label for="select4Basic" class="form-label">Sub Category*</label>
                                  <div class="invalid-feedback">
                                    Please select a valid Sub Category.
                                  </div>
                                </div>
                            </div>
                            
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
                            <!-- <div>
                              <div class="form-floating form-floating-outline">
                                <input
                                  id="ecommerce-product-tags"
                                  class="form-control h-auto"
                                  name="ecommerce-product-tags"
                                  value="Normal,Standard,Premium"
                                  aria-label="Product Tags" />
                                <label for="ecommerce-product-tags">Tags</label>
                              </div>
                            </div> -->
                            
                          </div>
                        </div>
                        <!-- /Organize Card -->
                      </div>
                      <!-- /Second column -->

                    </div>
                        
                  </div>
                </div>
            </form>
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
    <script src="assets/js/app-ecommerce-product-edit.js"></script>
    
    <script>
      function removeProductImage(index) {
        var productImagesDiv = document.querySelectorAll('#dropzone-multi-productImages .dz-preview');
        if(index >= 0 ) {
          productImagesDiv[index].remove();
        }
        if(productImagesDiv.length == 1) {
          document.querySelector('#dropzone-multi-productImages').classList.remove('dz-started');
        }
        
      }
    </script>

    <script>

      // var texteditor = document.getElementsByClassName("ql-editor")[0];
      // texteditor.oninput  = function(){ 
      //   if(texteditor.innerHTML != "")
      //   { 
      //     document.getElementById("productdescription").value = texteditor.innerHTML; 
      //     document.getElementById("ecommerce-category-description").style.setProperty('border', 'none', 'important');
      //   } else {
      //     document.getElementById("productdescription").value = ""; 
      //     document.getElementById("ecommerce-category-description").style.setProperty('border', '2px solid red', 'important');
      //   }
      // };
      
      // function myFunction() {
      //     var productname = document.getElementById("ecommerce-product-name").value;
      //     var productDescription = document.getElementsByClassName("ql-editor")[0].innerHTML;
      //     var productprice = document.getElementById("ecommerce-product-price").value;
      //     var productweight = document.getElementById("ecommerce-product-weight").value;
      //     var checkStock = document.getElementById("checkStock").value;
      //     var brand = document.getElementById("select2Basic").value;
      //     var category = document.getElementById("select3Basic").value;
      //     var subcategory = document.getElementById("select4Basic").value;

      //     var uploadedImages = document.querySelectorAll('[data-dz-thumbnail]');
      //     uploadedImageCount = document.querySelectorAll('[data-dz-thumbnail]').length;
          
      //     uploadedImageCount.forEach(myFunction);
      //     function myFunction(item, index, arr) {
      //       var base64image = uploadedImages[index].src;
      //       base64ToPng(base64image);  
      //     }

      //     // console.log(document.querySelectorAll('[data-dz-thumbnail]')[0].src);
          
      //     // Example usage with a base64 string (without the "data:image/png;base64," prefix)
      //     // const base64String = "iVBORw0KGgoAAAANSUhEUgAAAAUA...";  // Your base64 string
      //     // base64ToPng(base64String);

      //     console.log(productname +"\n");
      //     console.log(productDescription +"\n");
      //     console.log(productprice +"\n");
      //     console.log(productweight +"\n");
      //     console.log(checkStock +"\n");
      //     console.log(brand +"\n");
      //     console.log(category +"\n");
      //     console.log(subcategory +"\n");
      // }

      // function base64ToPng(base64String) {
      //     // Create a Blob from the base64 string
      //     const byteCharacters = atob(base64String.split(',')[1]);
      //     const byteArrays = [];

      //     for (let offset = 0; offset < byteCharacters.length; offset++) {
      //         const byteArray = byteCharacters.charCodeAt(offset);
      //         byteArrays.push(byteArray);
      //     }

      //     const blob = new Blob([new Uint8Array(byteArrays)], { type: 'image/png' });

      //     // Create a URL for the Blob object
      //     const imageUrl = URL.createObjectURL(blob);

      //     // Create an <a> element to trigger the download
      //     const a = document.createElement('a');
      //     a.href = imageUrl;
      //     a.download = 'image.png';
      //     document.body.appendChild(a);
      //     a.click();

      //     // Cleanup
      //     document.body.removeChild(a);
      //     URL.revokeObjectURL(imageUrl);
      // }

    </script>
    // To submit the text editor data in the db
    <!-- document.getElementsByClassName("ql-editor")[2].innerHTML -->
  </body>
</html>
a