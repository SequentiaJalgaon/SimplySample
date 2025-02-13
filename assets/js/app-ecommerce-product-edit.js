/**
 * App eCommerce Add Product Script
 */
'use strict';

//Javascript to handle the e-commerce product add page
/**
 * Tagify
 */
const $maxProductImageUpload = 5;
const $productImageAcceptanceType = ["image/jpeg","image/jpg","image/png","image/webp"];

(function () {
  // Comment editor

    const tagifyReadonlyEl = document.querySelector('#TagifyReadonly');
    const TagifyReadonly = new Tagify(tagifyReadonlyEl);
    let $exisitingImages = 0; 
    
    // Start: Get List of categories
    $.ajax({
      url: categoryApi,
      type: 'GET',
      dataType: 'json', // added data type
      success: function(data) { 

          const categories = [];

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
                closeOnSelect: false
              }
            });
                
        }
    });
    // End: Get List of categories
    
    const params = new URLSearchParams(window.location.search);

    // Start: Get Product Information
    const productId = params.get('id');

    if(productId > 0) {
        $.ajax({
            url: productsApi,
            type: 'GET',
            data: { 
                productId: productId
            },
            dataType: 'json', // added data type
            success: function(data) { 
                
                if(data.statusCode == 200) {
                    if(data.productInfo != null ) {
                        if(parseInt(data.productInfo.product_id) > 0) {

                            var $product_id = data.productInfo.product_id;
                            var $product_name = data.productInfo.product_name;
                            var $product_description = data.productInfo.product_description;
                            var $price = data.productInfo.price;
                            var $weight = data.productInfo.weight;
                            var $is_active = data.productInfo.is_active;
                            var $product_images = data.productInfo.product_images;
                            var $brand_name = data.productInfo.brand_name;
                            var $brand_id = data.productInfo.brand_id;
                            var $category_name = data.productInfo.category_name;
                            var $category_image = data.productInfo.category_image;
                            var $category_id = data.productInfo.category_id;
                            var $sub_category_name = data.productInfo.sub_category_name;
                            var $sub_category_id = data.productInfo.sub_category_id;
                            var $quantity = data.productInfo.quantity;

                            if($product_images != "" && $product_images != null) {
                              const $productImages = $product_images.split(",");
                              if($productImages.length > 0) {
                                $exisitingImages = $productImages.length;
                                // var productImagesDiv = document.querySelectorAll('[data-dz-thumbnail]');
                                var productImagesDiv = document.querySelector('#dropzone-multi-productImages');
                                productImagesDiv.classList.add('dz-started');

                                $productImages.forEach(function(element, index, array) {
                                  // var $producImagePath = "uploads/productIamges/";
                                  // var $imageUrl = $producImagePath + element;
                                  var $imageUrl = element;
                                  var $imageName = element.substring(element.lastIndexOf('/') + 1);
                                  let $base64String = "";
                                  async function convertImageToBase64(imageUrl) {
                                    try {
                                      // Fetch the image from the server
                                      const response = await fetch(imageUrl);
                                      const blob = await response.blob(); // Convert the response to a Blob
                              
                                      // Convert the Blob to a Base64 string using FileReader
                                      const reader = new FileReader();
                                      reader.onloadend = function () {
                                        $base64String = reader.result; // Base64 encoded image
                                  
                                        var $newElement = '<div class="dz-preview dz-processing dz-image-preview dz-success dz-complete"> <div class="dz-details"> <div class="dz-thumbnail"> <img data-dz-thumbnail="" alt="'+element+'" src="'+$base64String+'"> <span class="dz-nopreview">No preview</span> <div class="dz-success-mark"></div> <div class="dz-error-mark"></div> <div class="dz-error-message"><span data-dz-errormessage=""></span></div> <div class="progress"> <div class="progress-bar progress-bar-primary" role="progressbar" aria-valuemin="0" aria-valuemax="100" data-dz-uploadprogress="" style="width: 100%;"></div> </div> </div> <div class="dz-filename" data-dz-name="">'+$imageName+'</div> <div class="dz-size" data-dz-size=""><strong>'+'100kb'+'</strong></div> </div> <a class="dz-remove" onclick="removeProductImage('+index+')" data-dz-remove="">Remove file</a> </div>';

                                        // productImagesDiv.appendChild($newElement);
                                        productImagesDiv.innerHTML += $newElement;
                                          
                                        // Output the Base64 string to the textarea
                                        // document.getElementById('base64Output').value = $base64String;
                                        
                                        // Optionally, display the image using the Base64 string
                                        // document.getElementById('outputImage').src = $base64String;
                                      };
                              
                                      // Start reading the Blob as a Data URL (Base64)
                                      reader.readAsDataURL(blob);
                                    } catch (error) {
                                      console.error('Error fetching or converting image:', error);
                                    }
                                  }
                                  
                                    convertImageToBase64($imageUrl);
                                  
                                    
                                  // <div class="dz-preview dz-processing dz-image-preview dz-success dz-complete">
                                  //     <div class="dz-details">
                                  //       <div class="dz-thumbnail">
                                  //           <img data-dz-thumbnail="" alt="1.png" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAHgAAAB4CAYAAAA5ZDbSAAAAAXNSR0IArs4c6QAAAa1JREFUeF7t1QEJADAQw8DOv+gNJuPIO0hC+bPtrmMNnAKzbT9Yge2+Bcb7FrjAugGcrx9cYNwAjteCC4wbwPFacIFxAzheCy4wbgDHa8EFxg3geC24wLgBHK8FFxg3gOO14ALjBnC8Flxg3ACO14ILjBvA8VpwgXEDOF4LLjBuAMdrwQXGDeB4LbjAuAEcrwUXGDeA47XgAuMGcLwWXGDcAI7XgguMG8DxWnCBcQM4XgsuMG4Ax2vBBcYN4HgtuMC4ARyvBRcYN4DjteAC4wZwvBZcYNwAjteCC4wbwPFacIFxAzheCy4wbgDHa8EFxg3geC24wLgBHK8FFxg3gOO14ALjBnC8Flxg3ACO14ILjBvA8VpwgXEDOF4LLjBuAMdrwQXGDeB4LbjAuAEcrwUXGDeA47XgAuMGcLwWXGDcAI7XgguMG8DxWnCBcQM4XgsuMG4Ax2vBBcYN4HgtuMC4ARyvBRcYN4DjteAC4wZwvBZcYNwAjteCC4wbwPFacIFxAzheCy4wbgDHa8EFxg3geC24wLgBHK8FFxg3gOO14ALjBnC8Flxg3ACO9wD+rngBsD+0ywAAAABJRU5ErkJggg==">                                      <span class="dz-nopreview">No preview</span>                                      
                                  //           <div class="dz-success-mark"></div>
                                  //           <div class="dz-error-mark"></div>
                                  //           <div class="dz-error-message"><span data-dz-errormessage=""></span></div>
                                  //           <div class="progress">
                                  //             <div class="progress-bar progress-bar-primary" role="progressbar" aria-valuemin="0" aria-valuemax="100" data-dz-uploadprogress="" style="width: 100%;"></div>
                                  //           </div>
                                  //       </div>
                                  //       <div class="dz-filename" data-dz-name="">1.png</div>
                                  //       <div class="dz-size" data-dz-size=""><strong>2.1</strong> KB</div>
                                  //     </div>
                                  //     <a class="dz-remove" href="javascript:undefined;" data-dz-remove="">Remove file</a>
                                  // </div>
                                });
                              }
                            }

                            document.getElementById("productID").value = $product_id;
                            document.getElementById("ecommerce-product-name").value = $product_name;
                            document.getElementById("editProductNameShow").innerHTML = $product_name;
                            document.getElementsByClassName("ql-editor")[0].innerHTML = $product_description;
                            document.getElementById("productdescription").value = $product_description;
                            document.getElementById("ecommerce-category-description").value = $product_description;
                            document.getElementById("ecommerce-product-price").value = $price;
                            document.getElementById("ecommerce-product-weight").value = $weight;
                            document.getElementById("select2Basic").value = $brand_id;
                            document.getElementById("select3Basic").value = $category_id;
                            document.getElementById("select4Basic").value = $sub_category_id;
                            document.getElementById("checkStock").checked = false;
                            if($quantity > 0) 
                                document.getElementById("checkStock").checked = true;
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
            
            if ( $productImageAcceptanceType.includes(file.type) )  {
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
      
      var texteditor = document.getElementsByClassName("ql-editor")[0];
      texteditor.oninput  = function() { 
        if(texteditor.innerHTML != "")
        { 
          document.getElementById("productdescription").value = texteditor.innerHTML; 
          document.getElementById("ecommerce-category-description").style.setProperty('border', 'none', 'important');
        } else {
          document.getElementById("productdescription").value = ""; 
          document.getElementById("ecommerce-category-description").style.setProperty('border', '2px solid red', 'important');
        }
      };

      
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
          
          // event.preventDefault();
          // event.stopPropagation();

          // const uploadedImagesbase64 = [];
          // const imagesSaved = [];
          // var uploadedImages = document.querySelectorAll('[data-dz-thumbnail]');
          // if(uploadedImages.length == 0 ) {
          //   event.target.classList.add('was-validated');
          // } else {
          //   uploadedImages.forEach((item, index, arr) => {
          //     var base64image = uploadedImages[index].src;
          //     if(base64image != "") {
                
          //       var currentdate = new Date();
          //       var imageName = 
          //       currentdate.getFullYear() + ""  
          //       + (currentdate.getMonth()+1)  + "" 
          //       + currentdate.getDate() + ""
          //       + currentdate.getHours() + ""  
          //       + currentdate.getMinutes() + "" 
          //       + currentdate.getSeconds() +
          //       +"_" + index + ".png";

          //       uploadedImagesbase64.push(
          //         {  name : imageName , base64Data: base64image }
          //       );
                
          //       imagesSaved.push(imageName);

          //     }
          //   })
          // }

          // async function saveImageProductInfo() {
          //   const savedImages = await Promise.all(
          //     // saveImages(uploadedImages)
          //       fetch(ImgaeUploadAPI, {
          //       method: 'POST',
          //           headers: {
          //               'Content-Type': 'application/json',
          //           },
          //           body: JSON.stringify({ images: uploadedImagesbase64 }),
          //       })
          //   );          
          //   const imagesSaved = await savedImages.json();          
          //   return imagesSaved;
          // }
          
          // saveImageProductInfo().then((imagesSaved) => {

          //   var productID = document.getElementById("productID").value;
          //   var productname = document.getElementById("ecommerce-product-name").value;
          //   var productDescription = document.getElementsByClassName("ql-editor")[0].innerHTML;
          //   var productprice = document.getElementById("ecommerce-product-price").value;
          //   var productweight = document.getElementById("ecommerce-product-weight").value;
          //   var checkStock = document.getElementById("checkStock").value;
          //   var brand = document.getElementById("select2Basic").value;
          //   var category = document.getElementById("select3Basic").value;
          //   var subcategory = document.getElementById("select4Basic").value;

          //   var productData = [
          //     { productID : productID },
          //     { productname : productname },
          //     { productDescription : productDescription },
          //     { productprice : productprice },
          //     { productweight : productweight },
          //     { checkStock : checkStock },
          //     { brand : brand },
          //     { category : category },
          //     { subcategory : subcategory },
          //     { image : imagesSaved }
          //   ];
  
          //   async function saveProductInformation() {
          //     const saveProduct = await Promise.all(
          //       fetch(productsApi, {
          //         method: 'PUT',
          //             headers: {
          //                 'Content-Type': 'application/json',
          //             },
          //             body: JSON.stringify({ productData }),
          //         })
          //     );
          //     const productsaved = await saveProduct.json();            
          //     return productsaved;
          //   }
            
          //   saveProductInformation().then((productsaved) => {
          //     if (productsaved.ok) {
          //       const result = productsaved.json();
          //       // console.log(result);
          //   }
          //   }).catch(error => {
          //     // /movies or /categories request failed
          //   });

          // }).catch(error => {
          //   // /movies or /categories request failed
          // });


      }