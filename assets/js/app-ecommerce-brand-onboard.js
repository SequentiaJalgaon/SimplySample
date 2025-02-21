/**
 * Tagify
 */

'use strict';

(function () {

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

  
})();

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
    
     async function myFunction(event, $brand_id) {
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
                + currentdate.getSeconds()
                + "_" + index.toString() + ".png";

                uploadedImagesbase64.push(
                  {  name : imageName , base64Data: base64image }
                );

                imagesSaved.push(imageName);

              }
            })
          }

        var brandLogo = {
            images: uploadedImagesbase64,
            brand_id : $brand_id
          };
        const promise = fetch(ImgaeUploadBrandAPI, {
            method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({ brandLogo }),
            });

        promise
        .then(response => response.json())
        .then(data => {
            
            let uploadResult = true;
            if (typeof data.status !== 'undefined' && data.status == 'success' && data.responses.length > 0) 
            {
                data.responses.forEach((p) => { if(p.status != "success") uploadResult = uploadResult == true ? false : uploadResult;  });

                if(uploadResult == true) {
                    
                    //   document.querySelector('form button[type="submit"]').click();

                    // return true;
                    
                 } else {
                    //   return false;
                    
                 }
            }
        })

     }
  
  