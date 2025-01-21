<?php
include('dist/conf/db.php');
$pdo = Database::connect();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $action = $_POST['action'] ?? '';

    if ($action === 'delete' && !empty($_POST['id'])) {
        // DELETE Logic

        // echo "<pre>";
        // print_r($_POST);
        // exit();

        $id = $_POST['id'];
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        try {
                // First, delete the associations in category_vs_subcategory
                $sql1 = "DELETE FROM `category_vs_subcategory` WHERE `sub_category_id` = ?";
                $q1 = $pdo->prepare($sql1);
                $q1->execute([$id]);

                // Now delete the sub_category itself
                $sql2 = "DELETE FROM `sub_category` WHERE `sub_category_id` = ?";
                $q2 = $pdo->prepare($sql2);
                $q2->execute([$id]);

            header("Location: view-subcategories.php");
            exit();
        } catch (PDOException $e) {
            echo "Error deleting sub category: " . $e->getMessage();
        }
    } elseif ($action === 'edit' && !empty($_POST['id']) && !empty($_POST['name'])) {
        // EDIT Logic

        $id = $_POST['id'];
        $name = $_POST['name'];
        $categoryId = $_POST['category_name_id'];
        $updatedOn = date('Y-m-d H:i:s');
    
        try {
            // Update the sub_category table
            $sql1 = "UPDATE sub_category SET sub_category_name = ? WHERE sub_category_id = ?";
            $stmt1 = $pdo->prepare($sql1);
            $stmt1->execute([$name, $id]);
    
            // Update the category_vs_subcategory table
            $sql2 = "UPDATE category_vs_subcategory SET category_id = ? WHERE sub_category_id = ?";
            $stmt2 = $pdo->prepare($sql2);
            $stmt2->execute([$categoryId, $id]);

            header("Location: view-subcategories.php?success=1");
            exit();
        } catch (PDOException $e) {
            echo "Error updating sub-category: " . $e->getMessage();
        }
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

    <title>View Sub-Category | Simply Sample </title>

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
            
                <div class="app-ecommerce-category">
                <!-- Category List Table -->
                <div class="card">

                    <div class="row" style="display: flex; align-items: center;">
                        <div class="col-md-8">
                            <h5 class="card-header">All product sub-categories are listed below</h5>
                        </div>
                        <div class="col-md-4 text-md-end text-center">
                            <a href="add_subcategory.php" class="btn btn-secondary add-new btn-primary waves-effect waves-light me-3">
                                <span>
                                    <i class="ri-add-line ri-16px me-0 me-sm-1 align-baseline"></i> Add Sub-Category
                                </span>
                            </a>
                        </div>
                    </div>
                   
                    <div class="table-responsive text-nowrap">
                        <table class="table">
                        <caption class="ms-6">List of product sub-categories</caption>
                        <thead>
                            <tr>
                            <th>#</th>
                            <th> Name OF Sub-Categories</th>
                            <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php 
                                $i = 1;
                                $sql = "SELECT * FROM sub_category ";
                                // $sql = "SELECT * FROM admin where login_role = 'ASSISTANT' OR login_role = 'RECEPTIONIST' OR login_role = 'TECHNICIAN' ";
                                $q = $pdo->query($sql);
                                foreach ($pdo->query($sql) as $row) 
                                { 
                                    $sub_category_id = $row['sub_category_id'];
                                    $cvs_sql = "SELECT * FROM category_vs_subcategory where sub_category_id = '$sub_category_id' ";
                                    $q = $pdo->prepare($cvs_sql);
                                    $q->execute(array());
                                    $categoryArray = $q->fetch(PDO::FETCH_ASSOC);
                                    // $categoryName = $categoryArray['name'];
                            ?>
                            <tr>
                                <td><span class="fw-medium"><?php echo $i; ?></span></td>
                                    <!-- <td><?php echo $i; ?></td> -->
                                    <td><?php echo $row["sub_category_name"]; ?></td>
                                    <td>
                                        <!-- <div class="dropdown"> -->
                                            <!-- <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown"><i class="ri-more-2-line"></i></button>
                                            <div class="dropdown-menu"> -->
                                                <!-- <a class="dropdown-item waves-effect" href="edit_location?id=<?php echo $row["id"]; ?>"><i class="ri-pencil-line me-1"></i> Edit</a> -->
                                                <a class="dropdown-item open-myModal text-danger" data-bs-toggle="modal" data-bs-target="#enableOTP" data-id="<?php echo $row["sub_category_id"]; ?>"><i class="ri-delete-bin-7-line me-1"></i> </a>
                                            <!-- </div> -->

                                                <!--  -->
                                                <a class="dropdown-item open-editModal text-primary" 
                                                    data-bs-toggle="modal" 
                                                    data-bs-target="#editCategoryModal" 
                                                    data-id="<?php echo $row['sub_category_id']; ?>" 
                                                    data-name="<?php echo $row['sub_category_name']; ?>" 
                                                    data-categoryid="<?php echo $categoryArray['category_id']; ?>">
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

                <!-- Enable delete Modal -->
              <div class="modal fade" id="enableOTP" tabindex="-1" aria-hidden="true">
                <div class="modal-dialog modal-simple modal-enable-otp modal-dialog-centered">
                  <div class="modal-content">
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    <div class="modal-body p-0">
                      <div class="text-center mb-6">
                        <h4 class="mb-2">Delete!..</h4>
                        <p>Do you really want Delete this Sub-Category?</p>
                      </div>
                      <!-- <p class="mb-5">
                        Enter your mobile phone number with country code and we will send you a verification code.
                      </p> -->
                        <form id="enableOTPForm" class="row g-5" action="#" method="POST">
                            <input type="hidden" name="action" value="delete" />
                            <input type="hidden" name="id" id="id" value="" />
                            <div class="row d-flex" style="margin-top:20px;">
                                <div class="col-md-12" style="display:flex; justify-content: space-between;">
                                    <button type="submit" id="submit1" class="btn btn-danger" name="suspend">Delete</button>
                                    <button type="reset" class="btn btn-outline-secondary" data-bs-dismiss="modal">Cancel</button>
                                </div>
                            </div>
                        </form>
                    </div>
                  </div>
                </div>
              </div>
              <!--/ Enable delete Modal -->

              <!-- edit model -->
                <div class="modal fade" id="editCategoryModal" tabindex="-1" aria-hidden="true">
                    <div class="modal-dialog modal-simple modal-dialog-centered">
                        <div class="modal-content">
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            <div class="modal-body">
                                <div class="text-center mb-4">
                                    <h4 class="mb-2">Edit Sub-Category</h4>
                                    <p>Modify the details of the selected sub-category below.</p>
                                </div>
                                <form id="editCategoryForm" action="#" method="POST">
                                    <input type="hidden" name="action" value="edit" />
                                    <input type="hidden" name="id" id="edit-category-id" />
                                    
                                    <!-- Category Dropdown -->
                                    <div class="mb-3">
                                        <label for="edit-category-dropdown" class="form-label">Category</label>
                                        <select id="edit-category-dropdown" name="category_name_id" class="form-control" required>
                                            <option value="">Select Category</option>
                                            <?php
                                                $sql = "SELECT * FROM category";
                                                foreach ($pdo->query($sql) as $row) { 
                                                    echo "<option value='{$row['category_id']}'>{$row['category_name']}</option>";
                                                }
                                            ?>
                                        </select>
                                    </div>

                                    <!-- Sub-Category Text Box -->
                                    <div class="mb-3">
                                        <label for="edit-category-name" class="form-label">Sub-Category Name</label>
                                        <input 
                                            type="text" 
                                            name="name" 
                                            id="edit-category-name" 
                                            class="form-control" 
                                            placeholder="Enter sub-category name" 
                                            required />
                                    </div>

                                    <div class="d-flex justify-content-between">
                                        <button type="submit" class="btn btn-primary">Save Changes</button>
                                        <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Cancel</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

               <!-- /edit model -->
                
                </div>

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
                $("#lead_addmore_div").append('<div class="row"><div class="mb-6 col-lg-12 col-xl-12 col-12 mb-0"><div class="form-floating form-floating-outline"><input type="text" name="location[]" id="form-repeater-3-5" class="form-control" placeholder="Product Category"  required><label for="form-repeater-1-1">Product Category</label></div></div></div><hr class="mt-0">');
            // }); 
          }

        //   


        document.addEventListener('DOMContentLoaded', function() {
            const deleteButtons = document.querySelectorAll('.open-myModal');
            const modalInput = document.getElementById('id');

            deleteButtons.forEach(button => {
                button.addEventListener('click', function() {
                    const categoryId = this.getAttribute('data-id');
                    modalInput.value = categoryId;
                });
            });
        });

// for edit popup code
document.addEventListener('DOMContentLoaded', function() {
    const editButtons = document.querySelectorAll('.open-editModal');
    const modalIdInput = document.getElementById('edit-category-id');
    const modalNameInput = document.getElementById('edit-category-name');
    const modalCategoryInput = document.getElementById('edit-category-dropdown');

    editButtons.forEach(button => {
        button.addEventListener('click', function() {
            const subCategoryId = this.getAttribute('data-id');
            const subCategoryName = this.getAttribute('data-name');
            const categoryId = this.getAttribute('data-categoryid');

            // alert(categoryId);
            modalIdInput.value = subCategoryId;
            modalNameInput.value = subCategoryName;
            modalCategoryInput.value = categoryId;

            // Set the dropdown to the correct category
            Array.from(modalCategoryInput.options).forEach(option => {
                option.selected = option.value === categoryId;
            });
        });
    });
});




      </script>
   
    
  </body>
</html>
