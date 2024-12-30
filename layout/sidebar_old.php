<!-- Menu -->

<?php 
// echo "<pre>";
// print_r($_SESSION);
// exit();

?>
        <aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
          <div class="app-brand demo">
            <a href="index.html" class="app-brand-link">
                <span class="app-brand-logo demo">
                  <span style="color: var(--bs-primary)">
                    <img src="logo/favicon.png" alt class="rounded-circle" style="height: 40px;width: 40px;"/>
                  </span>
                </span>
                <div>
                  <span class="app-brand-text demo menu-text fw-semibold ms-2"><?php //echo $_SESSION['login_name']; ?> Administrator</span>
                  <br>
                  <span class="app-brand-text demo menu-text fw-semibold ms-2" style="font-size: 14px;font-weight: 300 !important;"><?php //echo $_SESSION['login_type']; ?>Admin</span>
                </div>
              </a>
          </div>

          <div class="menu-inner-shadow"></div>

          <ul class="menu-inner py-1">
            <!-- Dashboards -->
            <li class="menu-item active open">
              <a href="javascript:void(0);" class="menu-link menu-toggle">
                <i class="menu-icon tf-icons ri-home-smile-line"></i>
                <div data-i18n="Dashboards">Dashboards</div>
                <!-- <div class="badge bg-danger rounded-pill ms-auto">5</div> -->
              </a>
             
            </li>

            <!--  -->

            <li class="menu-item">
              <a href="javascript:void(0);" class="menu-link menu-toggle">
                <i class="menu-icon tf-icons ri-home-smile-line"></i>
                <div data-i18n="Category">Category</div>
              </a>
              <ul class="menu-sub">
                <li class="menu-item">
                  <a href="add_category.php" class="menu-link">
                    <div data-i18n="Add Category">Add Category</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="view-categories.php" class="menu-link">
                    <div data-i18n="View Category">View Category</div>
                  </a>
                </li>
                
              </ul>
            </li>

            <li class="menu-item">
              <a href="javascript:void(0);" class="menu-link menu-toggle">
                <i class="menu-icon tf-icons ri-home-smile-line"></i>
                <div data-i18n="Sub-Category">Sub-Category</div>
              </a>
              <ul class="menu-sub">
                <li class="menu-item">
                  <a href="add_subcategory.php" class="menu-link">
                    <div data-i18n="Add Sub-Category ">Add Sub-Category</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="view-subcategories.php" class="menu-link">
                    <div data-i18n="View Sub-Category">View Sub-Category</div>
                  </a>
                </li>
                
              </ul>
            </li>

            <li class="menu-item">
              <a href="javascript:void(0);" class="menu-link menu-toggle">
                <i class="menu-icon tf-icons ri-home-smile-line"></i>
                <div data-i18n="User">User</div>
              </a>
              <ul class="menu-sub">
                <li class="menu-item">
                  <a href="add_employee.php" class="menu-link">
                    <div data-i18n="Add User">Add User</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="view-employee.php" class="menu-link">
                    <div data-i18n="View User">View User</div>
                  </a>
                </li>
                
              </ul>
            </li>

            <li class="menu-item">
              <a href="javascript:void(0);" class="menu-link menu-toggle">
                <i class="menu-icon tf-icons ri-home-smile-line"></i>
                <div data-i18n="Brand">Brand</div>
              </a>
              <ul class="menu-sub">
                <li class="menu-item">
                  <a href="app-ecommerce-dashboard.html" class="menu-link">
                    <div data-i18n="Add Brand">Add Brand</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="dashboards-crm.html" class="menu-link">
                    <div data-i18n="View Brand">View Brand</div>
                  </a>
                </li>
                
              </ul>
            </li>

            <li class="menu-item">
              <a href="javascript:void(0);" class="menu-link menu-toggle">
                <i class="menu-icon tf-icons ri-home-smile-line"></i>
                <div data-i18n="Product">Product</div>
              </a>
              <ul class="menu-sub">
                <li class="menu-item">
                  <a href="app-ecommerce-dashboard.html" class="menu-link">
                    <div data-i18n="Add Product">Add Product</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="dashboards-crm.html" class="menu-link">
                    <div data-i18n="View Product">View Product</div>
                  </a>
                </li>
                
              </ul>
            </li>

            <!-- ************* -->

        
          </ul>
        </aside>
        <!-- / Menu -->