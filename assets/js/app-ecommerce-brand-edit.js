/**
 * Tagify
 */

'use strict';

const categories = [];

(function () {

  const tagifyReadonlyEl = document.querySelector('#RequestedCategories');
  const TagifyReadonly = new Tagify(tagifyReadonlyEl);
  

  $.ajax({
    url: categoryApi,
    type: 'GET',
    dataType: 'json', // added data type
    success: function(data) { 


        data.data.forEach(addCategories);
        
        function addCategories(item, index) {
            categories.push(item.CategoryName);
        }
       
             
                            
        const ProvidedCategoriesSuggestionEl = document.querySelector('#ProvidedCategoriesSuggestion');
                            

        let ProvidedCategoriesSuggestion = new Tagify(ProvidedCategoriesSuggestionEl, {
                whitelist: categories,
                maxTags: 10,
                dropdown: {
                maxItems: 20,
                classname: 'tags-inline',
                enabled: 0,
                closeOnSelect: false,
                originalInputValue: 'Computer Accessories, Laptops & Accessories'
            }
        }); 
        
      }
    });

  
})();

/**
 * App eCommerce Add Product Script
 */
'use strict';

//Javascript to handle the e-commerce product add page
/**
 * Tagify
 */
// const $maxProductImageUpload = 5;
const $logoImageAcceptanceType = ["image/jpeg","image/jpg","image/png","image/webp"];

(function () {
  // Comment editor

    // const tagifyReadonlyEl = document.querySelector('#RequestedCategories');
    // const TagifyReadonly = new Tagify(tagifyReadonlyEl);
    // let $exisitingImages = 0; 
    
    // // Start: Get List of categories
    // $.ajax({
    //   url: categoryApi,
    //   type: 'GET',
    //   dataType: 'json', // added data type
    //   success: function(data) { 

    //       const categories = [];

    //       data.data.forEach(addCategories);
          
    //       function addCategories(item, index) {
    //           categories.push(item.CategoryName);
    //       }
        
    //     const ProvidedCategoriesSuggestionEl = document.querySelector('#ProvidedCategoriesSuggestion');

    //         let ProvidedCategoriesSuggestion = new Tagify(ProvidedCategoriesSuggestionEl, {
    //           whitelist: categories,
    //           maxTags: 10,
    //           dropdown: {
    //             maxItems: 20,
    //             classname: 'tags-inline',
    //             enabled: 0,
    //             closeOnSelect: false
    //           }
    //         });
                
    //     }
    // });
    // End: Get List of categories
    
    const params = new URLSearchParams(window.location.search);

    // Start: Get Product Information
    const brand_id = params.get('id');

    if(brand_id > 0) {
        $.ajax({
            url: brandsApi,
            type: 'GET',
            data: { 
                brand_id: brand_id
            },
            dataType: 'json', // added data type
            success: function(data) { 
                
                if(data.statusCode == 200) {
                    if(data.data != null ) {
                        if(parseInt(data.data.id) > 0) {

                            var brandInfo = data.data;
                            var $brand_id = brandInfo.id;
                            var $ecommercebrandfirstName = brandInfo.firstname;
                            var $ecommercebrandlastname = brandInfo.lastname;
                            var $ecommercebrandemail = brandInfo.email;
                            var $ecommercebrandcontact = brandInfo.contact;
                            var $ecommercebrandbusinessname = brandInfo.business_name;
                            var $ecommercebrandregistrationyear = brandInfo.registration_year;
                            var $foodlicense = "";
                            var $gst_cert = "";
                            
                            brandInfo.documents.forEach(function(currentValue, index, array) {
                                
                                if(typeof brandInfo.documents[index]["Food License"]  !== 'undefined' && brandInfo.documents[index]["Food License"] !== null) {
                                    $foodlicense = brandInfo.documents[index]["Food License"];
                                }

                                if(typeof brandInfo.documents[index]["GST Certificate"]  !== 'undefined' && brandInfo.documents[index]["GST Certificate"] !== null) {
                                    $gst_cert = brandInfo.documents[index]["GST Certificate"];
                                }

                            });

                            var $brandLogo = brandInfo.brand_logo;
                            var $RequestedCategories = brandInfo.requestedCategories;
                            var $ProvidedCategories = brandInfo.categories;
                            var $reg_address_line_1 = brandInfo.registered_address.address_line_1;
                            var $reg_address_line_2 = brandInfo.registered_address.address_line_2;
                            var $reg_taluka = brandInfo.registered_address.taluka;
                            var $reg_loc_city = brandInfo.registered_address.city;
                            var $reg_loc_state = brandInfo.registered_address.state;
                            var $reg_loc_pincode = brandInfo.registered_address.pincode;
                            var $del_address_line_1 = brandInfo.delievery_address.address_line_1;
                            var $del_address_line_2 = brandInfo.delievery_address.address_line_2;
                            var $del_taluka = brandInfo.delievery_address.taluka;
                            var $del_loc_city = brandInfo.delievery_address.city;
                            var $del_loc_state = brandInfo.delievery_address.state;
                            var $del_loc_pincode = brandInfo.delievery_address.pincode;


                            document.getElementById("ecommerce-brand-firstName").value = $ecommercebrandfirstName;
                            document.getElementById("ecommerce-brand-lastname").value = $ecommercebrandlastname;
                            document.getElementById("ecommerce-brand-email").value = $ecommercebrandemail;
                            document.getElementById("ecommerce-brand-contact").value = $ecommercebrandcontact;
                            document.getElementById("ecommerce-brand-business-name").value = $ecommercebrandbusinessname;
                            document.getElementById("ecommerce-brand-registration-year").value = $ecommercebrandregistrationyear;
                            // document.getElementById("foodlicense").value = $foodlicense;
                            // document.getElementById("gst_cert").value = $gst_cert;
                            document.getElementById("brandLogo").src = "uploads/logos/"+$brandLogo;
                            // document.getElementById("ProvidedCategoriesSuggestion").value = $ProvidedCategoriesSuggestion;
                            document.getElementById("reg_address_line_1").value = $reg_address_line_1;
                            document.getElementById("reg_address_line_2").value = $reg_address_line_2;
                            document.getElementById("reg_taluka").value = $reg_taluka;
                            document.getElementById("reg_loc_city").value = $reg_loc_city;
                            document.getElementById("reg_loc_state").value = $reg_loc_state;
                            document.getElementById("reg_loc_pincode").value = $reg_loc_pincode;
                            document.getElementById("del_address_line_1").value = $del_address_line_1;
                            document.getElementById("del_address_line_2").value = $del_address_line_2;
                            document.getElementById("del_taluka").value = $del_taluka;
                            document.getElementById("del_loc_city").value = $del_loc_city;
                            document.getElementById("del_loc_state").value = $del_loc_state;
                            document.getElementById("del_loc_pincode").value = $del_loc_pincode;
                            
                            let $requesteCategoriesValues = "";
                            // let $requesteCategoriesValues = "[";
                            $RequestedCategories.forEach(function(element, index, array) {
                                // $requesteCategoriesValues += '{"value" : "'+ element.category_id +'","readonly" : true, "title" : "'+ element.category_name +'"}';
                                $requesteCategoriesValues +=  element.category_name +',';
                            });
                            // $requesteCategoriesValues += "]";
                            

                            let $providedCategoriesValues = "";
                            
                            $ProvidedCategories.forEach(function(element, index, array) {
                                if(index < $ProvidedCategories.length)
                                    $providedCategoriesValues += element.category_name +', ';
                                else
                                    $providedCategoriesValues += element.category_name;
                            });

                            setTimeout(myGreeting, 3000);

                            
                            function myGreeting() {
                                document.getElementById("ProvidedCategoriesSuggestion").value = $providedCategoriesValues;
                                
                                document.getElementById("RequestedCategories").value = $requesteCategoriesValues;
                            }

                            

                            // console.log($providedCategoriesValues);

                            // if($product_images != "" && $product_images != null) {
                            //   const $productImages = $product_images.split(",");
                            //   if($productImages.length > 0) {
                            //     $exisitingImages = $productImages.length;
                            //     // var productImagesDiv = document.querySelectorAll('[datadz-thumbnail]');
                            //     var productImagesDiv = document.querySelector('#dropzone-multi-productImages');
                            //     productImagesDiv.classList.add('dz-started');

                            //     $productImages.forEach(function(element, index, array) {
                            //       var $producImagePath = "uploads/productIamges/";
                            //       var $imageUrl = $producImagePath + element;
                                  
                            //       let $base64String = "";
                            //       async function convertImageToBase64(imageUrl) {
                            //         try {
                            //           // Fetch the image from the server
                            //           const response = await fetch(imageUrl);
                            //           const blob = await response.blob(); // Convert the response to a Blob
                              
                            //           // Convert the Blob to a Base64 string using FileReader
                            //           const reader = new FileReader();
                            //           reader.onloadend = function () {
                            //             $base64String = reader.result; // Base64 encoded image
                                  
                            //             var $newElement = '<div class="dz-preview dz-processing dz-image-preview dz-success dz-complete"> <div class="dz-details"> <div class="dz-thumbnail"> <img data-dz-thumbnail="" alt="'+element+'" src="'+$base64String+'"> <span class="dz-nopreview">No preview</span> <div class="dz-success-mark"></div> <div class="dz-error-mark"></div> <div class="dz-error-message"><span data-dz-errormessage=""></span></div> <div class="progress"> <div class="progress-bar progress-bar-primary" role="progressbar" aria-valuemin="0" aria-valuemax="100" data-dz-uploadprogress="" style="width: 100%;"></div> </div> </div> <div class="dz-filename" data-dz-name="">'+element+'</div> <div class="dz-size" data-dz-size=""><strong>'+'100kb'+'</strong></div> </div> <a class="dz-remove" onclick="removeProductImage('+index+')" data-dz-remove="">Remove file</a> </div>';

                            //             // productImagesDiv.appendChild($newElement);
                            //             productImagesDiv.innerHTML += $newElement;
                            //           }  
                            //           // Start reading the Blob as a Data URL (Base64)
                            //           reader.readAsDataURL(blob);
                            //         } catch (error) {
                            //           console.error('Error fetching or converting image:', error);
                            //         }
                            //       }
                                  
                            //         convertImageToBase64($imageUrl);
                                  
                            //     });
                            //   }
                            // }

                        }
                    }
                }
                
                      
              }
            });
        
    }
    // end: Get Product Information
  

    const commentEditor = document.querySelector('.comment-editor');

    if (commentEditor) {
      new Quill(commentEditor, {
        modules: {
          toolbar: '.comment-toolbar'
        },
        placeholder: 'Product Description',
        theme: 'snow'
      });
    }
    // quilleditor123.insertText(5, 'Quill', {
    //   color: '#ffff00',
    //   italic: true,
    // });



    // Start: Image Uplaod 
    // previewTemplate: Updated Dropzone default previewTemplate
    // ! Don't change it unless you really know what you are doing
    const previewTemplate = `<div class="dz-preview dz-file-preview">
                                  <div class="dz-details">
                                    <div class="dz-thumbnail">
                                      <img data-dz-thumbnail>
                                      <span class="dz-nopreview">No preview</span>
                                      <div class="dz-success-mark"></div>
                                      <div class="dz-error-mark"></div>
                                      <div class="dz-error-message"><span data-dz-errormessage></span></div>
                                      <div class="progress">
                                        <div class="progress-bar progress-bar-primary" role="progressbar" aria-valuemin="0" aria-valuemax="100" data-dz-uploadprogress></div>
                                      </div>
                                    </div>
                                    <div class="dz-filename" data-dz-name></div>
                                    <div class="dz-size" data-dz-size></div>
                                  </div>
                                  </div>`;

      // ? Start your code from here

      // Multiple Dropzone
      // --------------------------------------------------------------------
      const dropzoneMultip = document.querySelector('#dropzone-multi-productImages');
      if (dropzoneMultip) {
        const myDropzoneMulti = new Dropzone(dropzoneMultip, {
          previewTemplate: previewTemplate,
          parallelUploads: 1,
          maxFilesize: $maxProductImageUpload,
          addRemoveLinks: true,
          accept: function(file, done) {
            
            if ( $logoImageAcceptanceType.includes(file.type) )  {
              done();
            } else {
              done("File Type is not supported!");
            }
          },
          init: function() {
            this.on("addedfile", function() {
              if (this.files[$maxProductImageUpload-$exisitingImages]!=null){
                this.removeFile(this.files[$maxProductImageUpload-$exisitingImages]);
              }
            });
          }
        });
      };
      // End: Image Uplaod 


      // Basic Tags

      const tagifyBasicEl = document.querySelector('#ecommerce-product-tags');
      const TagifyBasic = new Tagify(tagifyBasicEl);

      // Flatpickr

      // Datepicker
      const date = new Date();

      const productDate = document.querySelector('.product-date');

      if (productDate) {
          productDate.flatpickr({
            monthSelectorType: 'static',
            defaultDate: date
          });
        }
      })();

      //Jquery to handle the e-commerce product add page

      $(function () {
        // Select2
        var select2 = $('.select2');
        if (select2.length) {
          select2.each(function () {
            var $this = $(this);
            select2Focus($this);
            $this.wrap('<div class="position-relative"></div>').select2({
              dropdownParent: $this.parent(),
              placeholder: $this.data('placeholder') // for dynamic placeholder
            });
          });
        }

        var formRepeater = $('.form-repeater');

        // Form Repeater
        // ! Using jQuery each loop to add dynamic id and class for inputs. You may need to improve it based on form fields.
        // -----------------------------------------------------------------------------------------------------------------

        if (formRepeater.length) {
          var row = 2;
          var col = 1;
          formRepeater.on('submit', function (e) {
            e.preventDefault();
          });
          formRepeater.repeater({
            show: function () {
              var fromControl = $(this).find('.form-control, .form-select');
              var formLabel = $(this).find('.form-label');

              fromControl.each(function (i) {
                var id = 'form-repeater-' + row + '-' + col;
                $(fromControl[i]).attr('id', id);
                $(formLabel[i]).attr('for', id);
                col++;
              });

              row++;
              $(this).slideDown();
              $('.select2-container').remove();
              $('.select2.form-select').select2({
                placeholder: 'Placeholder text'
              });
              $('.select2-container').css('width', '100%');
              var $this = $(this);
              select2Focus($this);
              $('.form-repeater:first .form-select').select2({
                dropdownParent: $(this).parent(),
                placeholder: 'Placeholder text'
              });
              $('.position-relative .select2').each(function () {
                $(this).select2({
                  dropdownParent: $(this).closest('.position-relative')
                });
              });
            }
          });
        }
      });

      // Start: Form Submit Validation
      (function () {
        'use strict'

        // Fetch all the forms we want to apply custom Bootstrap validation styles to
        var forms = document.querySelectorAll('.needs-validation')

        // Loop over them and prevent submission
        Array.prototype.slice.call(forms)
          .forEach(function (form) {
            form.addEventListener('submit', function (event) {
              // console.log(form.checkValidity());
              if (!form.checkValidity()) {
                event.preventDefault()
                event.stopPropagation()
              } else {
                myFunction(event);
              }
              
              form.classList.add('was-validated')
            }, true)
          })
      })()
      // End: Form Submit Validation
      
    //   var texteditor = document.getElementsByClassName("ql-editor")[0];
    //   texteditor.oninput  = function() { 
    //     if(texteditor.innerHTML != "")
    //     { 
    //       document.getElementById("productdescription").value = texteditor.innerHTML; 
    //       document.getElementById("ecommerce-category-description").style.setProperty('border', 'none', 'important');
    //     } else {
    //       document.getElementById("productdescription").value = ""; 
    //       document.getElementById("ecommerce-category-description").style.setProperty('border', '2px solid red', 'important');
    //     }
    //   };

      
      // Start: Form Submit Function
      async function myFunction(event) {

        
          event.preventDefault();
          event.stopPropagation();

          const uploadedImagesbase64 = [];
          const imagesSaved = [];
          var uploadedImages = document.querySelectorAll('[data-dz-thumbnail]');
          if(uploadedImages.length == 0 ) {
            event.target.classList.add('was-validated');
          } else {
            uploadedImages.forEach((item, index, arr) => {
              var base64image = uploadedImages[index].src;
              if(base64image != "") {
                
                var currentdate = new Date();
                var imageName = 
                currentdate.getFullYear() + ""  
                + (currentdate.getMonth()+1)  + "" 
                + currentdate.getDate() + ""
                + currentdate.getHours() + ""  
                + currentdate.getMinutes() + "" 
                + currentdate.getSeconds() +
                +"_" + index + ".png";

                uploadedImagesbase64.push(
                  {  name : imageName , base64Data: base64image }
                );

                imagesSaved.push(imageName);

              }
            })
          }


        
          const promise = fetch(ImgaeUploadAPI, {
            method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({ images: uploadedImagesbase64 }),
            });

          promise
            .then(response => response.json())
            .then(data => {

              let uploadResult = true;
              if (typeof data.status !== 'undefined' && data.status == 'success' && data.responses.length > 0) 
              {
                data.responses.forEach((p) => { if(p.status != "success") uploadResult = uploadResult == true ? false : uploadResult;  });

                if(uploadResult == true) {

                  var productID = document.getElementById("productID").value;
                  var productname = document.getElementById("ecommerce-product-name").value;
                  var productDescription = document.getElementsByClassName("ql-editor")[0].innerHTML;
                  var productprice = document.getElementById("ecommerce-product-price").value;
                  var productweight = document.getElementById("ecommerce-product-weight").value;
                  var checkStock = document.getElementById("checkStock").value;
                  var brand = document.getElementById("select2Basic").value;
                  var category = document.getElementById("select3Basic").value;
                  var subcategory = document.getElementById("select4Basic").value;
      
                  var productData = {
                    productID : productID,
                    productname : productname ,
                    productDescription : productDescription ,
                    productprice : productprice ,
                    productweight : productweight ,
                    checkStock : checkStock ,
                    brand : brand ,
                    category : category ,
                    subcategory : subcategory ,
                    image : imagesSaved
                  };


                  const promise1 = fetch(productsApi, {
                    method: 'PUT',
                        headers: {
                            'Content-Type': 'application/json',
                        },
                        body: JSON.stringify({ productData:  productData }),
                    });
          
                  promise1
                    .then(response => response.json())
                    .then(data => {

                      let selectedType = "";
                      let selectedAnimation = "";

                      if (typeof data.status !== 'undefined' && data.status == 'success' && data.ProductTitle != "") {

                          document.querySelector('#messageText').innerHTML = data.data;
                          document.querySelector('#entityTitle').innerHTML = data.ProductTitle;
                          
                          const toastAnimationExample = document.querySelector('.toast-ex');
                          document.querySelector('body').setAttribute('style', "");
                          selectedType = "bg-success";
                          selectedAnimation = "swing";

                          // toastAnimationExample.querySelectorAll('i[class^="ri-"]').forEach(function (element) {
                          //   element.classList.add(selectedType);
                          // });
                          toastAnimationExample.classList.remove(selectedAnimation, "bg-danger");
                          toastAnimationExample.classList.add(selectedAnimation, "bg-success");
                          let toastAnimation = new bootstrap.Toast(toastAnimationExample);
                          toastAnimation.show();

                          setTimeout(function() {
                            // Redirect to another URL, replacing the current page in history
                            window.location.replace('products');
                          }, 3000);

                      } else {
                        document.querySelector('#messageText').innerHTML = data.data;
                        document.querySelector('#entityTitle').innerHTML = data.ProductTitle;
                        
                        const toastAnimationExample = document.querySelector('.toast-ex');
                        selectedType = "bg-danger";
                        selectedAnimation = "swing";

                        // toastAnimationExample.querySelectorAll('i[class^="ri-"]').forEach(function (element) {
                        // element.classList.add(selectedType);
                        // });
                        toastAnimationExample.classList.remove(selectedAnimation, "bg-success");
                        toastAnimationExample.classList.add(selectedAnimation, "bg-danger");
                        let toastAnimation = new bootstrap.Toast(toastAnimationExample);
                        toastAnimation.show();
                      }
                      
                    })
                    // .catch(error => console.error('Error:', error));
                }
              }
              
            })
            // .catch(error => console.error('Error:', error));

          return;
    
      }