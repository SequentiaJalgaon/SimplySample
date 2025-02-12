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

    <title>Dashboard - Simply Sample</title>

    <meta name="description" content="" />

    <?php include ('layout/header_css.php');  ?>

  </head>

  <body>
    <!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">
      <div class="layout-container">
        <!-- Menu -->

        <?php include ('layout/sidebar.php');  ?>
        <!-- / Menu -->

        <!-- Layout container -->
        <div class="layout-page">
          <!-- Navbar -->

          <?php include ('layout/header.php');  ?>

          <!-- / Navbar -->

          <!-- Content wrapper -->
          <div class="content-wrapper">
            <!-- Content -->

            <div class="container-xxl flex-grow-1 container-p-y">
              <div class="row g-6">
                <!-- Gamification Card -->
                <!-- <div class="col-md-12 col-xxl-8">
                  <div class="card">
                    <div class="d-flex align-items-end row">
                      <div class="col-md-6 order-2 order-md-1">
                        <div class="card-body">
                          <h4 class="card-title mb-4">Congratulations <span class="fw-bold">John!</span> 🎉</h4>
                          <p class="mb-0">You have done 68% more sales today.</p>
                          <p>Check your new badge in your profile.</p>
                          <a href="javascript:;" class="btn btn-primary">View Profile</a>
                        </div>
                      </div>
                      <div class="col-md-6 text-center text-md-end order-1 order-md-2">
                        <div class="card-body pb-0 px-0 pt-2">
                          <img
                            src="../../assets/img/illustrations/illustration-john-light.png"
                            height="186"
                            class="scaleX-n1-rtl"
                            alt="View Profile"
                            data-app-light-img="illustrations/illustration-john-light.png"
                            data-app-dark-img="illustrations/illustration-john-dark.png" />
                        </div>
                      </div>
                    </div>
                  </div>
                </div> -->
                <!--/ Gamification Card -->

                <!-- Statistics Total Order -->
                <div class="col-xxl-2 col-sm-6">
                  <div class="card h-100">
                    <div class="card-body">
                      <div class="d-flex justify-content-between align-items-start flex-wrap gap-2">
                        <div class="avatar">
                          <div class="avatar-initial bg-label-primary rounded-3">
                            <i class="ri-shopping-cart-2-line ri-24px"></i>
                          </div>
                        </div>
                        <div class="d-flex align-items-center">
                          <p class="mb-0 text-success me-1">+22%</p>
                          <i class="ri-arrow-up-s-line text-success"></i>
                        </div>
                      </div>
                      <div class="card-info mt-5">
                        <h5 class="mb-1">155k</h5>
                        <p>Total Orders</p>
                        <div class="badge bg-label-secondary rounded-pill">Last 4 Month</div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--/ Statistics Total Order -->

                <!-- Sessions line chart -->
                <div class="col-xxl-2 col-sm-6">
                  <div class="card h-100">
                    <div class="card-header pb-0">
                      <div class="d-flex align-items-center mb-1 flex-wrap">
                        <h5 class="mb-0 me-1">$38.5k</h5>
                        <p class="mb-0 text-success">+62%</p>
                      </div>
                      <span class="d-block card-subtitle">Sessions</span>
                    </div>
                    <div class="card-body">
                      <div id="sessions"></div>
                    </div>
                  </div>
                </div>
                <!--/ Sessions line chart -->

                <!-- ********************************************************************* -->
               
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
  </body>
</html>
