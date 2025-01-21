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

    <title>File Upload</title>

    <meta name="description" content="" />
   
    <!-- *********** header******************  -->
    <?php include ('layout/header_css.php');  ?>
    <!-- *********** /header******************  -->


    <!-- <link rel="stylesheet" href="assets/vendor/libs/select2/select2.css" /> -->
    <!-- <link rel="stylesheet" href="assets/vendor/libs/bootstrap-select/bootstrap-select.css" /> -->

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
                <div class="row">
                    <!-- Basic  -->
                    <div class="col-12">
                        <div class="card mb-6">
                            <h5 class="card-header">Basic</h5>
                            <div class="card-body">
                            <form action="/upload" class="dropzone needsclick" id="dropzone-basic">
                                <div class="dz-message needsclick">
                                Drop files here or click to upload
                                <span class="note needsclick"
                                    >(This is just a demo dropzone. Selected files are
                                    <span class="fw-medium">not</span> actually uploaded.)</span
                                >
                                </div>
                                <div class="fallback">
                                <input name="file" type="file" />
                                </div>
                            </form>
                            </div>
                        </div>
                    </div>
                    <!-- /Basic  -->
                    <!-- Multi  -->
                    <div class="col-12">
                        <div class="card">
                            <h5 class="card-header">Multiple</h5>
                            <div class="card-body">
                            <form action="/upload" class="dropzone needsclick" id="dropzone-multi">
                                <div class="dz-message needsclick">
                                Drop files here or click to upload
                                <span class="note needsclick"
                                    >(This is just a demo dropzone. Selected files are
                                    <span class="fw-medium">not</span> actually uploaded.)</span
                                >
                                </div>
                                <div class="fallback">
                                <input name="file" type="file" />
                                </div>
                            </form>
                            </div>
                        </div>
                    </div>
                    <!-- Multi  -->
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

    <script src="assets\js\add-ecommerce-onboardBrand.js"></script>

  </body>
</html>
a