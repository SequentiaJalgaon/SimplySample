<!-- Footer -->
            <footer class="content-footer footer bg-footer-theme">
              <div class="container-xxl">
                <div
                  class="footer-container d-flex align-items-center justify-content-between py-4 flex-md-row flex-column">
                  <div class="text-body mb-2 mb-md-0">
                    Simply Sample ©
                    <script>
                      document.write(new Date().getFullYear());
                    </script>
                    <!--,  by-->
                    <!--<a href="https://www.sequentia.in/" target="_blank" class="footer-link">Sequentia</a>-->
                  </div>
                  <div class="d-none d-lg-inline-block">
                    <!-- <a href="https://themeforest.net/licenses/standard" class="footer-link me-4" target="_blank"
                      >License</a
                    >
                    <a href="https://1.envato.market/pixinvent_portfolio" target="_blank" class="footer-link me-4"
                      >More Themes</a
                    > -->

<!-- 
                    <a href="https://pixinvent.ticksy.com/" target="_blank" class="footer-link d-none d-sm-inline-block"
                      >Support</a
                    > -->
                  </div>
                </div>
              </div>
            </footer>
            <!-- / Footer -->

            <script>
                function resetForm() {
                    document.getElementById("myForm").reset();
                }
            </script>
            
            <script>
            
                    var pathname = window.location.pathname;
                    var pageName = pathname.split('/').pop();
                    pageName = pageName.split('?')[0];
                    
                    var anchors = document.querySelectorAll('a');
                    
                    // Select all anchor tags on the page
                    var anchors = document.querySelectorAll('a');
                    
                    // Loop through the NodeList directly
                    for (var i = 0; i < anchors.length; i++) {
                      // Check if the href is empty
                      if (anchors[i].getAttribute('href') == pageName) {
                        // Add a class to the anchor with an empty href
                        anchors[i].parentElement.classList.add("active");
                        if(anchors[i].parentElement.parentElement.parentElement.classList.contains("menu-item")) {
                            anchors[i].parentElement.parentElement.parentElement.classList.add("active");
                            anchors[i].parentElement.parentElement.parentElement.classList.add("open");
                        }
                      }
                    }

                    // // Filter anchors that have href="" or an empty href
                    // var emptyHrefAnchors = Array.from(anchors).filter(function(anchor) {
                        
                    //   anchor.getAttribute('href') == pageName;
                    // });
                    
                    // // Add a class to each anchor with an empty href
                    // emptyHrefAnchors.forEach(function(anchor) {
                    //     console.log("insideClass");
                    //   anchor.classList.add('active'); // Add the class "empty-href"
                    // });
            </script>