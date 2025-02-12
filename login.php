<?php
include ('dist/conf/db.php');
$pdo = Database::connect();

// start session
session_start();

// if login id in session is set either admin or super admin
if(isset($_SESSION['login_id']))
{
  header("Location: dashboard" );
}

// on login form submit 
if(isset($_POST["submit"]))
  { 
    
    $login_id = $_POST['login_id'];
    $password = $_POST['password'];
    $valid = true;

    if($valid)
    {
      $sql = "select * from admin where status = 'Active' AND login_id=?";
      $q = $pdo->prepare($sql);
      $q->execute(array($login_id));      
      $data = $q->fetch(PDO::FETCH_ASSOC);
      if ($data)
      {
       $valid = true;
      }
      else 
      {
        $sql = "select * from employee where status = 'Active' AND cell_no=?";
        $q = $pdo->prepare($sql);
        $q->execute(array($login_id));      
        $data = $q->fetch(PDO::FETCH_ASSOC);
        if ($data)
        {
          $valid = true;
        }
        else 
        {
          $sql = "select * from manager where status = 'Active' AND login_id=?";
          $q = $pdo->prepare($sql);
          $q->execute(array($login_id));      
          $data = $q->fetch(PDO::FETCH_ASSOC);
          if ($data)
          {
            $valid = true;
          }
          else 
          {
            $loginError = "Please enter correct login_id !";
          }
        }
      }
      if ($valid)
      { 
        $sql = "select * from admin where status = 'Active' AND login_id=?";
        $q = $pdo->prepare($sql);
        $q->execute(array($login_id));      
        $data = $q->fetch(PDO::FETCH_ASSOC);
        if ($data)
        {
          if (password_verify($_POST['password'], $data['login_password']))
          {
            $_SESSION['employee_id'] = $data['admin_id'];
            $_SESSION['admin_id'] = $data['admin_id'];
            $_SESSION['login_photo'] = $data['login_photo'];
            $_SESSION['login_name'] = $data['login_name'];
            $_SESSION['login_id'] = $data['login_id'];
            $_SESSION['login_role'] = $data['login_role'];
            $_SESSION['login_time'] = time();
            $_SESSION['department'] = 'Admin';
            
            header("Location:dashboard"); 
            //header("Location:view_patients_new");                    
            //echo "Admin Loged In";
          }
          else
          {
            $loginError = "Please enter correct password !";
          }
        }
        else 
        {
          $sql = "select * from employee where status = 'Active' AND cell_no=?";
          $q = $pdo->prepare($sql);
          $q->execute(array($login_id));      
          $data = $q->fetch(PDO::FETCH_ASSOC);
          if ($data)
          {
            if (password_verify($_POST['password'], $data['password']))
            {
              $_SESSION['employee_id'] = $data['employee_id'];
              $_SESSION['login_photo'] = $data['login_photo'];
              $_SESSION['login_name'] = $data['employee_name'];
              $_SESSION['login_id'] = $data['cell_no'];
              $_SESSION['login_role'] = $data['login_role'];
              $_SESSION['department'] = $data['department'];
              $_SESSION['login_time'] = time();
              header("Location:dashboard.php");                      
              //echo "User Loged In";
            }
            else
            {
              $loginError = "Please enter correct password !";
            }
          }
          else
          {
            $sql = "select * from manager where status = 'Active' AND login_id=?";
            $q = $pdo->prepare($sql);
            $q->execute(array($login_id));      
            $data = $q->fetch(PDO::FETCH_ASSOC);
            if ($data)
            {
              if (password_verify($_POST['password'], $data['login_password']))
              {
                $_SESSION['login_photo'] = $data['login_photo'];
                $_SESSION['login_name'] = $data['login_name'];
                $_SESSION['login_id'] = $data['login_id'];
                $_SESSION['login_role'] = $data['login_role'];
                $_SESSION['login_time'] = time();
                header("Location:dashboard");                    
                //echo "Admin Loged In";
              }
              else
              {
                $loginError = "Please enter correct password !";
              }
            }
          }
        }
      }
    }
  }
?>

<!doctype html>

<html
  lang="en"
  class="light-style layout-wide customizer-hide"
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

    <title>Login | Simpy Sample</title>

    <meta name="description" content="" />

    <?php //include ('layout/header_css.php');  ?>
    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="assets/img/favicon/favicon.png" />

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&ampdisplay=swap"
      rel="stylesheet" />

    <!-- Icons -->
    <link rel="stylesheet" href="assets/vendor/fonts/remixicon/remixicon.css" />
    <link rel="stylesheet" href="assets/vendor/fonts/flag-icons.css" />

    <!-- Menu waves for no-customizer fix -->
    <link rel="stylesheet" href="assets/vendor/libs/node-waves/node-waves.css" />

    <!-- Core CSS -->
    <link rel="stylesheet" href="assets/vendor/css/rtl/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="assets/vendor/css/rtl/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="assets/css/demo.css" />

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />
    <link rel="stylesheet" href="assets/vendor/libs/typeahead-js/typeahead.css" />
    <!-- Vendor -->
    <link rel="stylesheet" href="assets/vendor/libs/@form-validation/form-validation.css" />

    <!-- Page CSS -->
    <!-- Page -->
    <link rel="stylesheet" href="assets/vendor/css/pages/page-auth.css" />

    <!-- Helpers -->
    <script src="assets/vendor/js/helpers.js"></script>
    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Template customizer: To hide customizer set displayCustomizer value false in config.js.  -->
    <script src="assets/vendor/js/template-customizer.js"></script>
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="assets/js/config.js"></script>

    <style>
        .login-btn {
          background: #640062;
          border: 1px solid #640062;
        }
        .login-btn:hover {
            color: #fa1c5a !important;
            /* background-color: #5c61e6 !important; */
            /* border-color: #5c61e6 !important; */
            background: transparent !important;
            border: 1px solid #fa1c5a !important;
        }
    </style>
  </head>

  <body>
    <!-- Content -->

    <div class="authentication-wrapper authentication-cover">
      <!-- /Logo -->
      <div class="authentication-inner row m-0">
        <!-- /Left Section -->
        <div class="d-none d-lg-flex col-lg-7 col-xl-8 align-items-center justify-content-center p-12 pb-2" style="background: #f6f7fc;">
          <!-- <img src="building.png" class="auth-cover-illustration w-100" alt="auth-illustration" style="height: 450px;" /> -->
          <img src="logo/SimplySample2.png" class="auth-cover-illustration w-100" alt="auth-illustration" style="height: 450px;" />
          
        </div>
        <!-- /Left Section -->

        <!-- Login -->
        <div
          class="d-flex col-12 col-lg-5 col-xl-4 align-items-center authentication-bg position-relative py-sm-12 px-12 py-6">
          <div class="w-px-400 mx-auto pt-5 pt-lg-0">
            <h4 class="mb-1">Welcome to <br> <span style="color: #f61f56;">Simply Sample!</span></h4>
            <p class="mb-5">Please sign-in to your account</p>

            <form  class="mb-5" action="login.php" method="post">
                 
                
              <div class="form-floating form-floating-outline mb-5">
                <!-- <input type="text" class="form-control" id="email" name="login_id" placeholder="Enter your email or username" autofocus value="<?php if(isset ($_POST['login_id'])){ echo $_POST['login_id'];} ?>" required/> -->
                <input type="text" name="login_id" class="form-control" placeholder="User ID" value="<?php if(isset ($_POST['login_id'])){ echo $_POST['login_id'];} ?>" required style="padding-right: 12px;">
                <label for="email">User ID</label>
              </div>
              <div class="mb-5">
                <div class="form-password-toggle">
                  <div class="input-group input-group-merge">
                    <div class="form-floating form-floating-outline">
                      <!-- <input type="password" id="password" class="form-control" name="password" placeholder="&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;" aria-describedby="password" value="<?php if(isset ($_POST['password'])){ echo $_POST['password'];} ?>" required /> -->
                      <input type="password" name="password" class="form-control" placeholder="Password" value="<?php if(isset ($_POST['password'])){ echo $_POST['password'];} ?>" required style="padding-right: 12px;">
                      <label for="password">Password</label>
                    </div>
                   
                  </div>
                </div>
              </div>
              
              <button class="btn btn-primary d-grid w-100 login-btn" type="submit" id="submit1" name="submit">Sign in</button>
            </form>

            <?php if((isset($loginError)) && $loginError != "") { ?>
            <div class="alert alert-solid-danger" role="alert">
              <?php echo $loginError; ?>
            </div>
            <?php } else if((isset($warning)) && $warning != "") { ?>
              <div class="alert alert-solid-warning" role="alert">
                  <?php echo $warning; ?>
              </div>
              <?php } ?>
          </div>
        </div>
        <!-- /Login -->
      </div>
    </div>

    <!-- / Content -->

    <!-- Core JS -->
    <!-- build:js assets/vendor/js/core.js -->
    <script src="assets/vendor/libs/jquery/jquery.js"></script>
    <script src="assets/vendor/libs/popper/popper.js"></script>
    <script src="assets/vendor/js/bootstrap.js"></script>
    <script src="assets/vendor/libs/node-waves/node-waves.js"></script>
    <script src="assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
    <script src="assets/vendor/libs/hammer/hammer.js"></script>
    <script src="assets/vendor/libs/i18n/i18n.js"></script>
    <script src="assets/vendor/libs/typeahead-js/typeahead.js"></script>
    <script src="assets/vendor/js/menu.js"></script>

    <!-- endbuild -->

    <!-- Vendors JS -->
    <script src="assets/vendor/libs/@form-validation/popular.js"></script>
    <script src="assets/vendor/libs/@form-validation/bootstrap5.js"></script>
    <script src="assets/vendor/libs/@form-validation/auto-focus.js"></script>

    <!-- Main JS -->
    <script src="assets/js/main.js"></script>

    <!-- Page JS -->
    <script src="assets/js/pages-auth.js"></script>
    
  </body>
</html>
