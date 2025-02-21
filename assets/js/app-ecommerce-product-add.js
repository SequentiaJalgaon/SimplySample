/**
 * App eCommerce Add Product Script
 */
'use strict';

//Javascript to handle the e-commerce product add page
/**
 * Tagify
 */

      (function () {
        // Comment editor

        const tagifyReadonlyEl = document.querySelector('#TagifyReadonly');
        const TagifyReadonly = new Tagify(tagifyReadonlyEl);
        
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

        // Basic Dropzone
        const dropzoneBasic = document.querySelector('#dropzone-basic');
        if (dropzoneBasic) {
          const myDropzone = new Dropzone(dropzoneBasic, {
            previewTemplate: previewTemplate,
            parallelUploads: 1,
            maxFilesize: 5,
            acceptedFiles: '.jpg,.jpeg,.png,.gif',
            addRemoveLinks: true,
            maxFiles: 1
          });
        }

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

      (function () {
        'use strict'

        // Fetch all the forms we want to apply custom Bootstrap validation styles to
        var forms = document.querySelectorAll('.needs-validation')

        // Loop over them and prevent submission
        Array.prototype.slice.call(forms)
          .forEach(function (form) {
            form.addEventListener('submit', function (event) {
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
      
      // Function to fetch brands from the API
        async function fetchBrands() {
          try {
            
            const brandDropdown = document.getElementById('select2Basic');
            const categoryDropdown = document.getElementById('select3Basic');
            const subcategoryDropdown = document.getElementById('select4Basic');
            
            // Clear category and subcategory and brands dropdowns
            brandDropdown.innerHTML = '<option value="">Select Brand</option>';
            categoryDropdown.innerHTML = '<option value="">Select Category</option>';
            subcategoryDropdown.innerHTML = '<option value="">Select Subcategory</option>';
            brandDropdown.disabled = true;
            subcategoryDropdown.disabled = true;
            categoryDropdown.disabled = true;
                
            $.ajax({
              url: brandsApi,
              type: 'GET',
              dataType: 'json', // added data type
              success: function(data) { 
                    brandDropdown.disabled = false;
                    categoryDropdown.disabled = false;
                    data.data.forEach(brand => {
                        const option = document.createElement('option');
                        option.value = brand.id;
                        option.textContent = brand.brand_name;
                        brandDropdown.appendChild(option);
                    });
                  
                }
              });
            
          } catch (error) {
            console.error('Error fetching brands:', error);
          }
        }
        
        // Function to fetch categories based on selected brand
        async function fetchCategories(brandId) {
          try {
              
                const categoryDropdown = document.getElementById('select3Basic');
                const subcategoryDropdown = document.getElementById('select4Basic');
            
                // Clear category and subcategory dropdowns
                categoryDropdown.innerHTML = '<option value="">Select Category</option>';
                subcategoryDropdown.innerHTML = '<option value="">Select Subcategory</option>';
                subcategoryDropdown.disabled = true;
                categoryDropdown.disabled = true;
            
                $.ajax({
                  url: categoryApi+`?brand_id=${brandId}`,
                  type: 'GET',
                  dataType: 'json', // added data type
                  success: function(data) { 
                        
                        categoryDropdown.disabled = false;              
                        subcategoryDropdown.disabled = false;              
                      
                        data.data.forEach(categories => {
                            const option = document.createElement('option');
                            if(categories.Active == "1") {
                                option.value = categories.CategoryID;
                                option.textContent = categories.CategoryName;
                                categoryDropdown.appendChild(option);
                            }
                        });
                      
                            
                    }
                });
            
          } catch (error) {
            console.error('Error fetching categories:', error);
          }
        }
        
        // Function to fetch subcategories based on selected category
        async function fetchSubcategories(categoryId) {
          try {
            
            // Clear subcategory dropdown
            const subcategoryDropdown = document.getElementById('select4Basic');
            subcategoryDropdown.innerHTML = '<option value="">Select Subcategory</option>';
            subcategoryDropdown.disabled = true;
            
            $.ajax({
              url: subcategoryApi+`?category_id=${categoryId}`,
              type: 'GET',
              dataType: 'json', // added data type
              success: function(data) { 
                  subcategoryDropdown.disabled = false;          
                  
                    data.data.forEach(subcategories => {
                        const option = document.createElement('option');
                        if(subcategories.mapping_active == "1" && subcategories.sub_active == "1") {
                            option.value = subcategories.id;
                            option.textContent = subcategories.sub_categoryName;
                            subcategoryDropdown.appendChild(option);
                        }
                    });
                  
                        
                }
              });
              
              
          } catch (error) {
            console.error('Error fetching subcategories:', error);
          }
        }
        
        // Event listener to fetch categories when a brand is selected
        document.getElementById('select2Basic').addEventListener('change', function () {
          const brandId = this.value;
          const categoryDropdown = document.getElementById('select3Basic');
          const subcategoryDropdown = document.getElementById('select4Basic');
        
          // Clear category and subcategory dropdowns
          categoryDropdown.innerHTML = '<option value="">Select Category</option>';
          subcategoryDropdown.innerHTML = '<option value="">Select Subcategory</option>';
          subcategoryDropdown.disabled = true;
        
          if (brandId) {
            fetchCategories(brandId);
          } else {
            categoryDropdown.disabled = true;
          }
        });
        
        // Event listener to fetch subcategories when a category is selected
        document.getElementById('select3Basic').addEventListener('change', function () {
          const categoryId = this.value;
          const subcategoryDropdown = document.getElementById('select4Basic');
        
          // Clear subcategory dropdown
          subcategoryDropdown.innerHTML = '<option value="">Select Subcategory</option>';
        
          if (categoryId) {
            fetchSubcategories(categoryId);
          } else {
            subcategoryDropdown.disabled = true;
          }
        });
        
        // Load brands when the page loads
        window.onload = fetchBrands;


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
              if (typeof data.status !== 'undefined' && data.status == 'success' && data.responses.length > 0) {
                data.responses.forEach((p) => { if(p.status != "success") uploadResult = uploadResult == true ? false : uploadResult;  });

                if(uploadResult == true) {

                  var productname = document.getElementById("ecommerce-product-name").value;
                  var productDescription = document.getElementsByClassName("ql-editor")[0].innerHTML;
                  var productprice = document.getElementById("ecommerce-product-price").value;
                  var productweight = document.getElementById("ecommerce-product-weight").value;
                  var checkStock = document.getElementById("checkStock").value;
                  var brand = document.getElementById("select2Basic").value;
                  var category = document.getElementById("select3Basic").value;
                  var subcategory = document.getElementById("select4Basic").value;
                  var expiryDate = document.getElementById("flatpickr-date").value;
      
                  var productData = {
                    productname : productname ,
                    productDescription : productDescription ,
                    productprice : productprice ,
                    productweight : productweight ,
                    checkStock : checkStock ,
                    brand : brand ,
                    category : category ,
                    subcategory : subcategory ,
                    image : imagesSaved,
                    expiryDate : expiryDate
                  };


                  const promise1 = fetch(productsApi, {
                    method: 'POST',
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
                    .catch(error => console.error('Error:', error));
                }
              }
              
            })
            .catch(error => console.error('Error:', error));

            return;


          // Action - 3
          // fetch(ImgaeUploadAPI, 
          //   {
          //     method: 'POST',
          //     headers: {
          //         'Content-Type': 'application/json',
          //     },
          //     body: JSON.stringify({ images: uploadedImagesbase64 }),
          //   }
          // )
          // .then(response => 
          //   {
          //     if (!response.ok) {
          //       throw new Error('Network response was not ok');
          //       console.log(response);
          //     }
          //     console.log(response.json());
          // })
          // .then(data => {
          //     console.log(data);
          // })
          // .catch(error => {
          //     console.error('There was a problem with the fetch operation:', error);
          // });

          // Action - 2
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
          
          //   const imagesSavedResult = await savedImages.json();
          
          //   return imagesSavedResult;
          // }
          
          // saveImageProductInfo().then((imagesSavedResult) => {
            
          //   var productname = document.getElementById("ecommerce-product-name").value;
          //   var productDescription = document.getElementsByClassName("ql-editor")[0].innerHTML;
          //   var productprice = document.getElementById("ecommerce-product-price").value;
          //   var productweight = document.getElementById("ecommerce-product-weight").value;
          //   var checkStock = document.getElementById("checkStock").value;
          //   var brand = document.getElementById("select2Basic").value;
          //   var category = document.getElementById("select3Basic").value;
          //   var subcategory = document.getElementById("select4Basic").value;

          //   var productData = [
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
          //         method: 'POST',
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
          //       console.log(result);
          //   }
          //   }).catch(error => {
          //     // /movies or /categories request failed
          //   });

          // }).catch(error => {
          //   // /movies or /categories request failed
          // });

          
          // Action -1
          // var productname = document.getElementById("ecommerce-product-name").value;
          // var productDescription = document.getElementsByClassName("ql-editor")[0].innerHTML;
          // var productprice = document.getElementById("ecommerce-product-price").value;
          // var productweight = document.getElementById("ecommerce-product-weight").value;
          // var checkStock = document.getElementById("checkStock").value;
          // var brand = document.getElementById("select2Basic").value;
          // var category = document.getElementById("select3Basic").value;
          // var subcategory = document.getElementById("select4Basic").value;

          // var productData = {
          //    productname : productname ,
          //    productDescription : productDescription ,
          //    productprice : productprice ,
          //    productweight : productweight ,
          //    checkStock : checkStock ,
          //    brand : brand ,
          //    category : category ,
          //    subcategory : subcategory ,
          //    image : imagesSaved.toString()
          // };
          

          // async function fetchMoviesAndCategories() {
          //   const [moviesResponse, categoriesResponse] = await Promise.all([
          //     fetch(ImgaeUploadAPI, {
          //       method: 'POST',
          //           headers: {
          //               'Content-Type': 'application/json',
          //           },
          //           body: JSON.stringify({ images: uploadedImagesbase64 }),
          //       }
          //     ),
          //     fetch(productsApi, {
          //       method: 'POST',
          //           headers: {
          //               'Content-Type': 'application/json',
          //           },
          //           body: JSON.stringify({ productData }),
          //       })
          //   ]);
          
          //   const movies = await moviesResponse.json();
          //   const categories = await categoriesResponse.json();
          
          //   return [movies, categories];
          // }
          
          // fetchMoviesAndCategories().then(([movies, categories]) => {
          //   movies;     // fetched movies
          //   categories; // fetched categories
          // }).catch(error => {
          //   // /movies or /categories request failed
          // });

          // // Image Upload Action - 3
          // uploadedImageCount = document.querySelectorAll('[data-dz-thumbnail]').length;
          
          // uploadedImages.forEach(uploadImage);
          // async function uploadImage(item, index, arr) {
          //   var base64image = uploadedImages[index].src;
          //     // saveFileOnServer(base64image);  
              
          //     //Save File Code
          //     const response = await fetch(ImgaeUploadAPI, {
          //     method: 'POST',
          //         headers: {
          //             'Content-Type': 'application/json',
          //         },
          //         body: JSON.stringify({ image: base64image }),  // Sending the URL to the server
          //     });
      
          //     if (response.ok) {
          //         const result = await response.json();
          //         if(typeof result.filePath !== 'undefined') {
          //           imageArray.push(fileName); 
          //         }
          //     }
          //     //Save File Code
          // }

            // let myPromise1 = new Promise(function() { saveImages(uploadedImages).then (
            //   saveProduct()
            // ) });
            // let myPromise2 = await myPromise1;

            
          // saveImages(uploadedImages);
          
          // // Add Product Action - 1
          // async function saveProduct() {
          //   var productData = [
          //     { productname : productname },
          //     { productDescription : productDescription },
          //     { productprice : productprice },
          //     { productweight : productweight },
          //     { checkStock : checkStock },
          //     { brand : brand },
          //     { category : category },
          //     { subcategory : subcategory },
          //     { image : imageArray }
          //   ];
  
          //   //Save Product
          //   const saveProduct = await fetch(productsApi, {
          //     method: 'POST',
          //         headers: {
          //             'Content-Type': 'application/json',
          //         },
          //         body: JSON.stringify({ productData }),
          //     });
  
          //     if (saveProduct.ok) {
          //         const result = await saveProduct.json();
          //         if(typeof result.filePath !== 'undefined') {
          //           imageArray.push(fileName); 
          //         }
          //     }
          //     //Save Product
          //     return true;
          // }
          
          // console.log(document.querySelectorAll('[data-dz-thumbnail]')[0].src);
          
          // Example usage with a base64 string (without the "data:image/png;base64," prefix)
          // const base64String = "iVBORw0KGgoAAAANSUhEUgAAAAUA...";  // Your base64 string
          // base64ToPng(base64String);

          // console.log(productname +"\n");
          // console.log(productDescription +"\n");
          // console.log(productprice +"\n");
          // console.log(productweight +"\n");
          // console.log(checkStock +"\n");
          // console.log(brand +"\n");
          // console.log(category +"\n");
          // console.log(subcategory +"\n");
      }
      
      // Image Upload Action - 1
      // async function saveImages(uploadedImages) {
      //   const imageArray = [];
      //   uploadedImages.forEach(uploadImage);
      //   async function uploadImage(item, index, arr) {
      //     var base64image = uploadedImages[index].src;
      //       // saveFileOnServer(base64image);  
            
      //       //Save File Code
      //       // const response = await fetch(ImgaeUploadAPI, {
      //       await fetch(ImgaeUploadAPI, {
      //           method: 'POST',
      //           headers: {
      //               'Content-Type': 'application/json',
      //           },
      //           body: JSON.stringify({ image: base64image }),  // Sending the URL to the server
      //       }).then(
      //         response => response.json()
      //       ).then (
      //         data => function (data) { 
      //           if(typeof result.fileName !== 'undefined') {
      //             imageArray.push(result.fileName); 
      //           }
      //         }              
      //       )
    
      //       // if (response.ok) {
      //       //     const result = await response.json();
      //       //     if(typeof result.fileName !== 'undefined') {
      //       //       imageArray.push(result.fileName); 
      //       //     }
      //       // }
      //       //Save File Code
      //   }
      //   return imageArray;
      // }

      // Image Upload Action - 2
      // function base64ToPng(base64String) {
      //     // Create a Blob from the base64 string
      //     const byteCharacters = atob(base64String.split(',')[1]);
      //     const byteArrays = [];

      //     for (let offset = 0; offset < byteCharacters.length; offset++) {
      //         const byteArray = byteCharacters.charCodeAt(offset);
      //         byteArrays.push(byteArray);
      //     }

      //     const blob = new Blob([new Uint8Array(byteArrays)], { type: 'image/png' });

      //     // Create a URL for the Blob object
      //     const imageUrl = URL.createObjectURL(blob);

      //     // Create an <a> element to trigger the download
      //     const a = document.createElement('a');
      //     saveFileOnServer(base64String);
      //     // a.href = imageUrl;
      //     // a.download = 'image.png';
      //     // document.body.appendChild(a);
      //     // a.click();

      //     // Cleanup
      //     // document.body.removeChild(a);
      //     URL.revokeObjectURL(imageUrl);
      // }

      //   async function saveFileOnServer(base64Data) {
      //     try {
      //         const response = await fetch(ImgaeUploadAPI, {
      //             method: 'POST',
      //             headers: {
      //                 'Content-Type': 'application/json',
      //             },
      //             body: JSON.stringify({ image: base64Data }),  // Sending the URL to the server
      //         });
      
      //         if (response.ok) {
      //             const result = await response.json();
      //             if(typeof result.filePath !== 'undefined') {

      //             }
      //             // console.log('File saved successfully:', result.filePath);
      //         } else {
      //             console.log('Error saving file:', response.statusText);
      //         }
      //     } catch (error) {
      //         console.error('Error during fetch:', error);
      //     }
      // }
     