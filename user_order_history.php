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

    <title>User Order History</title>

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

    <link rel="stylesheet" href="assets/vendor/libs/rateyo/rateyo.css" />
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
              <div
                class="d-flex flex-column flex-sm-row align-items-center justify-content-sm-between mb-6 text-center text-sm-start gap-2">
                <div class="mb-2 mb-sm-0">
                  <h4 class="mb-1">Customer ID #634759</h4>
                  <p class="mb-0">Aug 17, 2020, 5:48 </p>
                </div>
                <!-- <button type="button" class="btn btn-outline-danger delete-customer">Delete Customer</button> -->
              </div>

              <div class="row">
                <!-- Customer-detail Sidebar -->
                <div class="col-xl-4 col-lg-5 col-md-5 order-1 order-md-0">
                  <!-- Customer-detail Card -->
                  <div class="card mb-6">
                    <div class="card-body pt-12">
                      <div class="customer-avatar-section">
                        <div class="d-flex align-items-center flex-column">
                          <img
                            class="img-fluid rounded-3 mb-4"
                            src="assets/img/avatars/1.png"
                            height="120"
                            width="120"
                            alt="User avatar" />
                          <div class="customer-info text-center mb-6">
                            <h5 class="mb-0 first_name" id="" >Loading</h5>
                            Customer ID: <span class="customer_id">Loading..</span>
                          </div>
                        </div>
                      </div>
                      <div class="d-flex justify-content-around flex-wrap mb-6 gap-4 gap-md-3 gap-lg-4">
                        <div class="d-flex align-items-center gap-4 me-5">
                          <div class="avatar">
                            <div class="avatar-initial rounded-3 bg-label-primary">
                              <i class="ri-shopping-cart-line ri-24px"></i>
                            </div>
                          </div>
                          <div>
                            <h5 class="mb-0">184</h5>
                            <span>Orders</span>
                          </div>
                        </div>
                        <div class="d-flex align-items-center gap-4">
                          <div class="avatar">
                            <div class="avatar-initial rounded-3 bg-label-primary">
                              <i class="ri-money-rupee-circle-line ri-24px"></i>
                            </div>
                          </div>
                          <div>
                            <h5 class="mb-0">12,378</h5>
                            <span>Spent</span>
                          </div>
                        </div>
                      </div>

                      <div class="info-container">
                        <h5 class="border-bottom text-capitalize pb-4 mt-6 mb-4">Details</h5>
                        <ul class="list-unstyled mb-6">
                          <li class="mb-2">
                            <span class="h6 me-1">User Name:</span>
                            <span class="first_name"> Loading..</span>
                          </li>
                          <li class="mb-2">
                            <span class="h6 me-1">Email:</span>
                            <span class="email"> Loading..</span>
                          </li>
                          <li class="mb-2">
                            <span class="h6 me-1">Status:</span>
                            <span class="badge bg-label-success rounded-pill status"> Loading..</span>
                          </li>
                          <li class="mb-2">
                            <span class="h6 me-1">Contact:</span>
                            <span class="contact"> Loading..</span>
                          </li>

                        </ul>
                        <!-- <div class="d-flex justify-content-center">
                          <a
                            href="javascript:;"
                            class="btn btn-primary w-100"
                            data-bs-target="#editUser"
                            data-bs-toggle="modal"
                            >Edit Details</a
                          >
                        </div> -->
                      </div>
                    </div>
                  </div>
                  <!-- /Customer-detail Card -->
                  <!-- Plan Card -->

                  

                  <!-- /Plan Card -->
                </div>
                <!--/ Customer Sidebar -->

                <!-- Customer Content -->
                <div class="col-xl-8 col-lg-7 col-md-7 order-0 order-md-1">
                  
                  <!--/ Customer Pills -->

                  <!--  Customer cards -->
                  <div class="row text-nowrap">
                    
                    <div class="col-md-6 mb-6">
                      <div class="card">
                        <div class="card-body">
                          <div class="card-icon mb-2">
                            <div class="avatar">
                              <div class="avatar-initial rounded-3 bg-label-warning">
                                <i class="ri-star-smile-line ri-24px"></i>
                              </div>
                            </div>
                          </div>
                          <div class="card-info">
                            <h5 class="card-title mb-2">Wishlist</h5>
                            <div class="d-flex align-items-baseline gap-1">
                              <h5 class="text-warning mb-0">15</h5>
                              <p class="mb-0">Items in wishlist</p>
                            </div>
                            <p class="mb-0 text-truncate">Lorem Ipsum is simply dummy text industry.</p>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="col-md-6 mb-6">
                      <div class="card">
                        <div class="card-body">
                          <div class="card-icon mb-2">
                            <div class="avatar">
                              <div class="avatar-initial rounded-3 bg-label-info">
                                <i class="ri-vip-crown-line ri-24px"></i>
                              </div>
                            </div>
                          </div>
                          <div class="card-info">
                            <h5 class="card-title mb-2">Rewards</h5>
                            <div class="d-flex align-items-baseline gap-1">
                              <h5 class="text-info mb-0">200gms</h5>
                              <p class="mb-0">Rewards you win</p>
                            </div>

                            <p class="mb-0 text-truncate">Use rewards on next purchase</p>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <!--/ customer cards -->

                  <!-- Invoice table -->
                  <div class="card mb-6">
                    <div class="table-responsive mb-4">
                      <table class="table datatables-customer-order">
                        <thead>
                          <tr>
                            <th></th>
                            <th>Order ID</th>
                            <th>Date</th>
                            <th>Status</th>
                            <th>Amount</th>
                            <th>Action</th>
                          </tr>
                        </thead>
                      </table>
                    </div>
                  </div>
                  <!-- /Invoice table -->
                </div>
                <!--/ Customer Content -->
              </div>

              <!-- Modal -->
             
              <!-- /Modal -->
            </div>
            <!-- / Content -->

           

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

    <script src="assets/vendor/libs/rateyo/rateyo.js"></script>

    <!-- Page JS -->
    <!-- <script src="assets/js/app-ecommerce-sub-category-list.js"></script> -->
    <!-- <script src="assets/js/app-ecommerce-reviews.js"></script>
    <script src="assets/js/extended-ui-star-ratings.js"></script> -->
    <!-- <script src="assets/js/app-ecommerce-customer-all.js"></script> -->
    <!-- <script src="assets/js/app-ecommerce-customer-detail.js"></script> -->
    <script src="assets/js/app-ecommerce-customer-detail-overview.js"></script>

    <!-- <script>
      document.addEventListener('DOMContentLoaded', function () {
      // Fetch user data from the API
      fetch('customer_details_data')
        .then(response => response.json())
        .then(data => {
          if (data.status && data.message.length > 0) {
            const user = data.message[0]; // Assuming you're displaying the first user's details

            // Update the HTML elements with the fetched data
            document.getElementById('first_name').textContent = user.first_name;
            document.getElementById('email').textContent = user.email;
            document.getElementById('status').textContent = 'Active'; // Update as per your data
            document.getElementById('contact').textContent = user.contact;
            document.getElementById('customer_id').textContent = user.customer_id;

          } else {
            console.error('No user data found');
          }
        })
        .catch(error => console.error('Error fetching user data:', error));
    });
    </script> -->

    <!-- show data using class name -->
    <script>
      document.addEventListener('DOMContentLoaded', function () {
        // Fetch user data from the API
        fetch('customer_details_data')
          .then(response => response.json())
          .then(data => {
            if (data.status && data.message.length > 0) {
              const user = data.message[0]; // Assuming you're displaying the first user's details

              // Update all elements with the corresponding class names
              document.querySelectorAll('.first_name').forEach(el => el.textContent = user.first_name);
              document.querySelectorAll('.email').forEach(el => el.textContent = user.email);
              // document.querySelectorAll('.status').forEach(el => el.textContent = 'Active'); // Update as per your data
              document.querySelectorAll('.status').forEach(el => el.textContent = user.status); // Update as per your data
              document.querySelectorAll('.contact').forEach(el => el.textContent = user.contact);
              document.querySelectorAll('.customer_id').forEach(el => el.textContent = user.customer_id);

            } else {
              console.error('No user data found');
            }
          })
          .catch(error => console.error('Error fetching user data:', error));
      });
    </script>




  </body>
</html>
