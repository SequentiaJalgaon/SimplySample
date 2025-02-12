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

            var productname = document.getElementById("ecommerce-product-name").value;
            var productDescription = document.getElementsByClassName("ql-editor")[0].innerHTML;
            var productprice = document.getElementById("ecommerce-product-price").value;
            var productweight = document.getElementById("ecommerce-product-weight").value;
            var checkStock = document.getElementById("checkStock").value;
            var brand = document.getElementById("select2Basic").value;
            var category = document.getElementById("select3Basic").value;
            var subcategory = document.getElementById("select4Basic").value;

            var productData = {
                productname : productname ,
                productDescription : productDescription ,
                productprice : productprice ,
                productweight : productweight ,
                checkStock : checkStock ,
                brand : brand ,
                category : category ,
                subcategory : subcategory ,
                image : imagesSaved.toString()
            };
            

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

            async function saveImageProductInfo() {
                const savedImages = await Promise.all(
                // saveImages(uploadedImages)
                    fetch(ImgaeUploadAPI, {
                    method: 'POST',
                        headers: {
                            'Content-Type': 'application/json',
                        },
                        body: JSON.stringify({ images: uploadedImagesbase64 }),
                    })
                );
            
                const imagesSaved = await savedImages.json();
            
                return imagesSaved;
            }
            
            saveImageProductInfo().then((imagesSaved) => {
                
                var productname = document.getElementById("ecommerce-product-name").value;
                var productDescription = document.getElementsByClassName("ql-editor")[0].innerHTML;
                var productprice = document.getElementById("ecommerce-product-price").value;
                var productweight = document.getElementById("ecommerce-product-weight").value;
                var checkStock = document.getElementById("checkStock").value;
                var brand = document.getElementById("select2Basic").value;
                var category = document.getElementById("select3Basic").value;
                var subcategory = document.getElementById("select4Basic").value;

                var productData = [
                { productname : productname },
                { productDescription : productDescription },
                { productprice : productprice },
                { productweight : productweight },
                { checkStock : checkStock },
                { brand : brand },
                { category : category },
                { subcategory : subcategory },
                { image : imagesSaved }
                ];
    
                async function saveProductInformation() {
                const saveProduct = await Promise.all(
                    fetch(productsApi, {
                    method: 'POST',
                        headers: {
                            'Content-Type': 'application/json',
                        },
                        body: JSON.stringify({ productData }),
                    })
                );
                
                const productsaved = await saveProduct.json();
                
                return productsaved;
                }
                
                saveProductInformation().then((productsaved) => {
                if (productsaved.ok) {
                    const result = productsaved.json();
                    console.log(result);
                }
                }).catch(error => {
                // /movies or /categories request failed
                });

            }).catch(error => {
                // /movies or /categories request failed
            });

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