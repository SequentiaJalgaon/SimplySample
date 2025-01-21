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

    <title>Category List</title>

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
                <div class="row mb-6">
                    <div class="col-lg-12 col-xl-4 ">
                        <div class="card">
                            <h5 class="card-header">Arrange Category Sequence</h5>
                            <hr class="mt-0">
                            <p class="text-center text-danger">** Move Category Title To Update Sequence</p>
                            <div class="card-body">
                            <div class="row">
                                <div class="col-12 mb-md-0 mb-6 text-center">
                                    <button type="button" class=" btn btn-primary waves-effect waves-light mb-8" onclick="updateSequence()">
                                        <!-- <i class="ri-add-line ri-16px me-0 me-sm-1 align-baseline"></i> -->
                                        <span class="d-sm-inline-block">Update Sequence</span>
                                    </button>
                                    <br>
                                    <ul class="list-group list-group-flush" id="clone-source-1">
                                        <?php
                                            $sql = "SELECT 
                                                    c.category_id,
                                                    c.category_name,
                                                    c.category_image,
                                                    c.is_active
                                                FROM 
                                                    category c
                                                JOIN 
                                                    category_sequence cs
                                                ON 
                                                    c.category_id = cs.category_id
                                                WHERE
                                                    cs.is_active = '1'
                                                GROUP BY 
                                                    c.category_id
                                                ORDER BY 
                                                    sequence_number
                                                ";                                                          
                                            foreach($pdo->query($sql) as $row) {
                                        ?>
                                        <li
                                        class="list-group-item drag-item cursor-move d-flex justify-content-between align-items-center" data-id="<?php echo $row['category_id']; ?>">
                                        <span class="<?php if($row['is_active'] == 0) echo "text-danger"; ?>">
                                        <?php echo $row['category_name']; ?></span>
                                            <?php 
                                                $output = "";

                                                if($row['category_image'] != "") { 

                                                $output = '<img
                                                    class="rounded-circle"
                                                    src="'.$row['category_image'].'"
                                                    alt="avatar"
                                                    height="32"
                                                    width="32" />';
                                                
                                                } else { 
                                                    $stateNum = floor(rand(0, 5));
                                                    $states = ['success', 'danger', 'warning', 'info', 'dark', 'primary', 'secondary'];
                                                    $state = $states[4];
                                                    $name = $row['category_name'];
                                                    preg_match_all('/\b\w/', $name, $matches);
                                                    $result = $matches[0] ?? "";
                                                    $initials = strtoupper((array_shift($result) ?: '') . (array_pop($result) ?: ''));   

                                                    $output = '<span class="avatar-initial rounded-2 bg-label-'. $state.'">'.$initials.'</span>';
                                                }
                                                
                                                echo '<div class="d-flex justify-content-start align-items-center   product-name">' .
                                                    '<div class="avatar-wrapper me-3">' .
                                                    '<div class="avatar rounded-3 bg-label-secondary">' .
                                                    $output .
                                                    '</div>' .
                                                    '</div>' .
                                                    '<div class="d-flex flex-column">' .
                                                    // '<span class="text-nowrap text-heading fw-medium">' .
                                                    // $row['category_name'] .
                                                    // '</span>' .
                                                    '</div>' .
                                                    '</div>';
                                                ?>
                                            </li>
                                        <?php } ?>
                                    </ul>
                                </div>
                                
                            </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-12 col-xl-8">
                        <div class="app-ecommerce-category">
                            <!-- Start: Category List Table -->
                            <div class="card">
                            <div class="card-datatable table-responsive">
                                <table class="datatables-category-list table">
                                <thead>
                                    <tr>
                                    <th style="width: 10%;"></th>
                                    <th style="width: 10%;"></th>
                                    <th style="width: 50%;">Categories</th>
                                    <th style="width: 10%;" class="text-nowrap text-sm-end">Status &nbsp;</th>
                                    <!-- <th class="text-nowrap text-sm-end">Total Earning</th> -->
                                    <th style="width: 20%;" class="text-lg-center">Actions</th>
                                    </tr>
                                </thead>
                                </table>
                            </div>
                            </div>
                            <!-- End: Category List Table -->

                            <!-- Start: Offcanvas to add new category -->
                            <div
                            class="offcanvas offcanvas-end"
                            tabindex="-1"
                            id="offcanvasEcommerceCategoryListAdd"
                            aria-labelledby="offcanvasEcommerceCategoryListLabelAdd">
                            <!-- Offcanvas Header -->
                            <div class="offcanvas-header">
                                <h5 id="offcanvasEcommerceCategoryListLabelAdd" class="offcanvas-title">Add Category</h5>
                                <button
                                type="button"
                                class="btn-close text-reset"
                                data-bs-dismiss="offcanvas"
                                aria-label="Close"></button>
                            </div>
                            <!-- Offcanvas Body -->
                            <div class="offcanvas-body border-top">
                                <form class="pt-0" action="#" id="eCommerceCategoryListFormAdd" enctype="multipart/form-data">
                                <!-- Title -->
                                <input type="hidden" id="categoryid_edit">
                                <div class="form-floating form-floating-outline mb-5">
                                    <input
                                    type="text"
                                    class="form-control"
                                    id="ecommerce-category-title"
                                    placeholder="Enter category title"
                                    name="categoryTitle"
                                    aria-label="category title" />
                                    <label for="ecommerce-category-title">Category Title</label>
                                </div>

                                <div class="form-floating form-floating-outline mb-5">
                                    <input class="form-control" type="file" id="categoryIcon" oninput="checkImage()" />
                                    <label for="formFile" class="form-label">Category Image</label>
                                    
                                    <img class="d-none" id="imagePreview" src="" alt="Image Preview" style="width: 100%;height: 100%;">
                                
                                </div>
                                
                                <div class="form-floating form-floating-outline mb-5">
                                    <div class="form-check form-check-success">
                                    <input class="form-check-input" type="checkbox" value="" id="isActiveCat" checked>
                                    <label class="form-check-label" for="isActiveCat">
                                        Is Active
                                    </label>
                                    </div>
                                </div>

                                <!-- Submit and reset -->
                                <div>
                                    <button type="button" class="btn btn-primary me-3 data-submit" onclick="SubmitForm('add')">Add</button>
                                    <button type="reset" class="btn btn-outline-danger" data-bs-dismiss="offcanvas">Discard</button>
                                </div>

                                </form>
                            </div>
                            <!-- Offcanvas Body -->
                            </div>
                            <!-- End: Offcanvas to add new category -->

                            <!-- Start: Offcanvas to edit category -->
                            <div
                            class="offcanvas offcanvas-end"
                            tabindex="-1"
                            id="offcanvasEcommerceCategoryListEdit"
                            aria-labelledby="offcanvasEcommerceCategoryListLabelEdit">
                            <!-- Offcanvas Header -->
                            <div class="offcanvas-header">
                                <h5 id="offcanvasEcommerceCategoryListLabelEdit" class="offcanvas-title">Update Category</h5>
                                <button
                                type="button"
                                class="btn-close text-reset"
                                data-bs-dismiss="offcanvas"
                                aria-label="Close"></button>
                            </div>
                            <!-- Offcanvas Body -->
                            <div class="offcanvas-body border-top">
                                <form class="pt-0" action="#" id="eCommerceCategoryListFormEdit" enctype="multipart/form-data">
                                <!-- Title -->
                                <input type="hidden" id="categoryid_edit">
                                <div class="form-floating form-floating-outline mb-5">
                                    <input
                                    type="text"
                                    class="form-control"
                                    id="ecommerce-category-title-edit"
                                    placeholder="Enter category title"
                                    name="categoryTitle"
                                    aria-label="category title" />
                                    <label for="ecommerce-category-title">Category Title</label>
                                </div>

                                <div class="form-floating form-floating-outline mb-5">
                                    <div class="form-check form-check-success">
                                    <input class="form-check-input" type="checkbox" value="" id="isActiveCatEdit" checked>
                                    <label class="form-check-label" for="isActiveCatEdit">
                                        Is Active
                                    </label>
                                    </div>
                                </div>

                                <div class="form-floating form-floating-outline mb-5">
                                    <input class="form-control" type="file" id="categoryIconEdit" oninput="checkImage('Edit')" />
                                    <label for="formFile" class="form-label">Category Image</label>
                                    
                                    <img class="d-none" id="imagePreviewEdit" src="" alt="Image Preview" style="width: 100%;height: 100%;">
                                
                                </div>

                                <!-- Submit and reset -->
                                <div>
                                    <button type="button" class="btn btn-primary me-3 data-submit" onclick="SubmitForm('update')">Update</button>
                                    <button type="reset" class="btn btn-outline-danger" data-bs-dismiss="offcanvas">Discard</button>
                                </div>

                                </form>
                            </div>
                            <!-- Offcanvas Body -->
                            </div>
                            <!-- End: Offcanvas to edit category -->

                        </div>
                    </div>
                </div>
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


            </div>
            <!-- / Content -->
            <script>
        // document.getElementById("eCommerceCategoryListForm").addEventListener("submit", function(event) {
        
    </script>
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
    <script src="assets/js/app-ecommerce-category-list.js"></script>
    
    <script src="assets/vendor/libs/sortablejs/sortable.js"></script>
    <script src="assets/js/extended-ui-drag-and-drop.js"></script>
  </body>
</html>
