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

    <title>User Order History Details</title>

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
                class="d-flex flex-column flex-md-row justify-content-between align-items-start align-items-md-center mb-6 gap-6">
                <div class="d-flex flex-column justify-content-center">
                  <div class="d-flex align-items-center mb-1">
                    <h5 class="mb-0">Order #32543</h5>
                    <!-- <span class="badge bg-label-success me-2 ms-2 rounded-pill">Paid</span>
                    <span class="badge bg-label-info rounded-pill">Ready to Pickup</span> -->
                  </div>
                  <p class="mb-0">Aug 17, <span id="orderYear"></span>, 5:48</p>
                </div>
                <div class="d-flex align-content-center flex-wrap gap-2">
                  <!-- <button class="btn btn-outline-danger delete-order">Delete Order</button> -->
                </div>
              </div>

              <!-- Order Details Table -->

              <div class="row">
                <div class="col-12 col-lg-8">
                  <div class="card mb-6">
                    <div class="card-header d-flex justify-content-between align-items-center">
                      <h5 class="card-title m-0">Order details</h5>
                      <!-- <h6 class="m-0"><a href=" javascript:void(0)">Edit</a></h6> -->
                    </div>
                    <div class="card-datatable table-responsive pb-5">
                      <table class="datatables-order-details table">
                        <thead>
                          <tr>
                            <th></th>
                            <th style="white-space: nowrap;">SR NO.</th>
                            <th class="w-50">products</th>
                            <th>Weight</th>
                            <th>price</th>
                            <th>qty</th>
                            <th>total</th>
                          </tr>
                        </thead>
                      </table>
                      <div class="d-flex justify-content-end align-items-center m-4 p-1 mb-0 pb-0">
                        <div class="order-calculations">
                          <div class="d-flex justify-content-start gap-4 mb-3">
                            <span class="w-px-100 text-heading">Subtotal:</span>
                            <h6 class="mb-0">5000.25</h6>
                          </div>
                          <!-- <div class="d-flex justify-content-start gap-4 mb-3">
                            <span class="w-px-100 text-heading">Discount:</span>
                            <h6 class="mb-0">00.00</h6>
                          </div> -->
                          <div class="d-flex justify-content-start gap-4 mb-3">
                            <span class="w-px-100 text-heading">Tax:</span>
                            <h6 class="mb-0">100.00</h6>
                          </div>
                          <div class="d-flex justify-content-start gap-4 mb-3">
                            <h6 class="w-px-100 mb-0">Total:</h6>
                            <h6 class="mb-0">5100.25</h6>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <!-- <div class="card mb-6">
                    <div class="card-header">
                      <h5 class="card-title m-0">Shipping activity</h5>
                    </div>
                    <div class="card-body mt-3">
                      <ul class="timeline pb-0 mb-0">
                        <li class="timeline-item timeline-item-transparent border-primary">
                          <span class="timeline-point timeline-point-primary"></span>
                          <div class="timeline-event">
                            <div class="timeline-header mb-2">
                              <h6 class="mb-0">Order was placed (Order ID: #32543)</h6>
                              <small class="text-muted">Tuesday 11:29 AM</small>
                            </div>
                            <p class="mt-1 mb-2">Your order has been placed successfully</p>
                          </div>
                        </li>
                        <li class="timeline-item timeline-item-transparent border-primary">
                          <span class="timeline-point timeline-point-primary"></span>
                          <div class="timeline-event">
                            <div class="timeline-header mb-2">
                              <h6 class="mb-0">Pick-up</h6>
                              <small class="text-muted">Wednesday 11:29 AM</small>
                            </div>
                            <p class="mt-1 mb-2">Pick-up scheduled with courier</p>
                          </div>
                        </li>
                        <li class="timeline-item timeline-item-transparent border-primary">
                          <span class="timeline-point timeline-point-primary"></span>
                          <div class="timeline-event">
                            <div class="timeline-header mb-2">
                              <h6 class="mb-0">Dispatched</h6>
                              <small class="text-muted">Thursday 11:29 AM</small>
                            </div>
                            <p class="mt-1 mb-2">Item has been picked up by courier</p>
                          </div>
                        </li>
                        <li class="timeline-item timeline-item-transparent border-primary">
                          <span class="timeline-point timeline-point-primary"></span>
                          <div class="timeline-event">
                            <div class="timeline-header mb-2">
                              <h6 class="mb-0">Package arrived</h6>
                              <small class="text-muted">Saturday 15:20 AM</small>
                            </div>
                            <p class="mt-1 mb-2">Package arrived at an Amazon facility, NY</p>
                          </div>
                        </li>
                        <li class="timeline-item timeline-item-transparent border-left-dashed">
                          <span class="timeline-point timeline-point-primary"></span>
                          <div class="timeline-event">
                            <div class="timeline-header mb-2">
                              <h6 class="mb-0">Dispatched for delivery</h6>
                              <small class="text-muted">Today 14:12 PM</small>
                            </div>
                            <p class="mt-1 mb-2">Package has left an Amazon facility, NY</p>
                          </div>
                        </li>
                        <li class="timeline-item timeline-item-transparent border-transparent pb-0">
                          <span class="timeline-point timeline-point-primary"></span>
                          <div class="timeline-event pb-0">
                            <div class="timeline-header mb-2">
                              <h6 class="mb-0">Delivery</h6>
                            </div>
                            <p class="mt-1 mb-2">Package will be delivered by tomorrow</p>
                          </div>
                        </li>
                      </ul>
                    </div>
                  </div> -->
                </div>
                <div class="col-12 col-lg-4">
                  <div class="card mb-6">
                    <div class="card-body">
                      <h5 class="card-title mb-6">Customer details</h5>
                      <div class="d-flex justify-content-start align-items-center mb-6">
                        <div class="avatar me-3">
                          <img src="assets/img/avatars/1.png" alt="Avatar" class="rounded-circle" />
                        </div>
                        <div class="d-flex flex-column">
                          <a href="app-user-view-account.html">
                            <h6 class="mb-0 first_name" id="">Loading..</h6>
                          </a>
                          <span>Customer ID: <span class="customer_id">Loading..</span> </span>
                        </div>
                      </div>
                      <div class="d-flex justify-content-start align-items-center mb-6">
                        <span
                          class="avatar rounded-circle bg-label-primary me-3 d-flex align-items-center justify-content-center"
                          ><i class="ri-shopping-cart-line ri-24px"></i
                        ></span>
                        <h6 class="text-nowrap mb-0">12 Orders</h6>
                      </div>
                      <div class="d-flex justify-content-between">
                        <h6 class="mb-1">Contact info</h6>
                        <!-- <h6 class="mb-1">
                          <a href=" javascript:;" data-bs-toggle="modal" data-bs-target="#editUser">Edit</a>
                        </h6> -->
                      </div>
                      <p class="mb-1">Email: <span class="email"> Loading..</span></p>
                      <p class="mb-0">Mobile: <span class="contact"> Loading.. </span></p>
                    </div>
                  </div>

                  <div class="card mb-6">
                    <div class="card-header d-flex justify-content-between pb-0">
                      <h5 class="card-title mb-1">Shipping address</h5>
                      <!-- <h6 class="m-0">
                        <a href=" javascript:void(0)" data-bs-toggle="modal" data-bs-target="#addNewAddress">Edit</a>
                      </h6> -->
                    </div>
                    <div class="card-body">
                      <p class="mb-0">
                        <span id="">45 Roker Terrace</span> <br />
                        <span id="">Latheronwheel</span><br />
                        <span id="">KW5 8NW,London</span> <br />
                        <span id="">UK</span>
                      </p>
                    </div>
                  </div>
                  <div class="card mb-6">
                    <div class="card-header d-flex justify-content-between pb-0">
                      <h5 class="card-title mb-1">Billing address</h5>
                      <!-- <h6 class="m-0">
                        <a href=" javascript:void(0)" data-bs-toggle="modal" data-bs-target="#addNewAddress">Edit</a>
                      </h6> -->
                    </div>
                    <div class="card-body">
                      <p class="mb-0">45 Roker Terrace <br />Latheronwheel <br />KW5 8NW,London <br />UK</p>
                      <!-- <h5 class="mb-1">Mastercard</h5>
                      <p class="mb-0">Card Number: ******4291</p> -->
                    </div>
                  </div>
                </div>
              </div>

              
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
    <!-- <script src="assets/js/app-ecommerce-customer-detail-overview.js"></script> -->
    <script src="assets/js/app-ecommerce-order-details.js"></script>

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


<script>
      document.addEventListener('DOMContentLoaded', function () {
      // Fetch user data from the API
      fetch('customer_address_data')
        .then(response => response.json())
        .then(data => {
          if (data.status && data.message.length > 0) {
            const addr = data.message[0]; // Assuming you're displaying the first user's details

            // Update the HTML elements with the fetched data
            document.getElementById('address_id').textContent = addr.address_id;
            document.getElementById('user_id').textContent = addr.user_id;
            document.getElementById('line_1').textContent = addr.line_1;
            document.getElementById('line_2').textContent = addr.line_2;
            document.getElementById('city').textContent = addr.city;
            document.getElementById('state').textContent = addr.state;
            document.getElementById('zipcode').textContent = addr.zipcode;

          } else {
            console.error('No user data found');
          }
        })
        .catch(error => console.error('Error fetching user data:', error));
    });
    </script>

   

  </body>
</html>
