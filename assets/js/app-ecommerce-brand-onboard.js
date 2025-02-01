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
