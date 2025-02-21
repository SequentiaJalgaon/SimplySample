
<style>
  .btn-success {
      color: #fff;
      /* background-color: #72e128;
      border-color: #72e128; */
      background: #640062;
      border: 1px solid #640062;
  }
  .btn-success:hover {
    color: #fa1c5a !important;
    /* color: #640062 !important; */
    /* background-color: #5c61e6 !important; */
    /* border-color: #5c61e6 !important; */
    background: transparent !important;
    /* border: 1px solid #640062 !important; */
    border: 1px solid #fa1c5a !important;
}

  .addmore-btn {
    color: #640062 !important;
    background: transparent !important;
    border: 1px solid #640062 !important;
}
.addmore-btn:hover {
      color: #fff;
      /* background-color: #72e128;
      border-color: #72e128; */
      background: #640062 !important;
      border: 1px solid #640062 !important;
  }
  td,
  th {
      text-transform: capitalize !important;
  }
</style>
        <nav
            class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme"
            id="layout-navbar">
            <div class="layout-menu-toggle navbar-nav align-items-xl-center me-4 me-xl-0 d-xl-none">
              <a class="nav-item nav-link px-0 me-xl-6" href="javascript:void(0)">
                <i class="ri-menu-fill ri-22px"></i>
              </a>
            </div>

            <div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">
            
              <ul class="navbar-nav flex-row align-items-center ms-auto">
               
                <!-- User -->
                <li class="nav-item navbar-dropdown dropdown-user dropdown">
                  <a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);" data-bs-toggle="dropdown">
                    <div class="avatar avatar-online">
                      <img src="logo/favicon.png" alt class="rounded-circle" />
                    </div>
                  </a>
                  <ul class="dropdown-menu dropdown-menu-end">
                    <li>
                      <a class="dropdown-item" href="pages-account-settings-account.html">
                        <div class="d-flex">
                          <div class="flex-shrink-0 me-2">
                            <div class="avatar avatar-online">
                              <img src="logo/favicon.png" alt class="rounded-circle" />
                            </div>
                          </div>
                          <div class="flex-grow-1">
                            <span class="fw-medium d-block small">Administrator</span>
                            <small class="text-muted">Admin</small>
                          </div>
                        </div>
                      </a>
                    </li>
                    <li>
                      <div class="dropdown-divider"></div>
                    </li>
                    <!-- <li>
                      <a class="dropdown-item" href="pages-profile-user.html">
                        <i class="ri-user-3-line ri-22px me-3"></i><span class="align-middle">My Profile</span>
                      </a>
                    </li>
                     -->
                    <li>
                      <div class="d-grid px-4 pt-2 pb-1">
                        <a class="btn btn-sm btn-danger d-flex" href="dist/conf/signout.php" >
                          <small class="align-middle">Logout</small>
                          <i class="ri-logout-box-r-line ms-2 ri-16px"></i>
                        </a>
                      </div>
                    </li>

                    <li>
                      <div class="d-grid px-4 pt-2 pb-1">
                        <a class="btn btn-sm btn-warning d-flex" href="reset_password.php" >
                          <small class="align-middle">Change Password</small>
                          <i class="ri-user-settings-line ms-2 ri-16px"></i>
                        </a>
                      </div>
                    </li>

                  </ul>
                </li>
                <!--/ User -->
              </ul>
            </div>

            <!-- Search Small Screens -->
            <div class="navbar-search-wrapper search-input-wrapper d-none">
              <input
                type="text"
                class="form-control search-input container-xxl border-0"
                placeholder="Search..."
                aria-label="Search..." />
              <i class="ri-close-fill search-toggler cursor-pointer"></i>
            </div>
          </nav>