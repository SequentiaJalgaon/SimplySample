/**
 * App eCommerce Category List
 */

'use strict';

// Comment editor

const commentEditor = document.querySelector('.comment-editor');

if (commentEditor) {
  new Quill(commentEditor, {
    modules: {
      toolbar: '.comment-toolbar'
    },
    placeholder: 'Write a Comment...',
    theme: 'snow'
  });
}

// Datatable (jquery)

$(function () {
  let borderColor, bodyBg, headingColor;

  if (isDarkStyle) {
    borderColor = config.colors_dark.borderColor;
    bodyBg = config.colors_dark.bodyBg;
    headingColor = config.colors_dark.headingColor;
  } else {
    borderColor = config.colors.borderColor;
    bodyBg = config.colors.bodyBg;
    headingColor = config.colors.headingColor;
  }

  // Variable declaration for category list table
  var dt_sub_category_list_table = $('.datatables-sub-category-list');

  //select2 for dropdowns in offcanvas

  var select2 = $('.select2');
  if (select2.length) {
    select2.each(function () {
      var $this = $(this);
      select2Focus($this);
      $this.wrap('<div class="position-relative"></div>').select2({
        dropdownParent: $this.parent(),
        placeholder: $this.data('placeholder') //for dynamic placeholder
      });
    });
  }

  // Customers List Datatable
  $.ajax({
    url: subcategoryApi,
    type: 'GET',
    dataType: 'json', // added data type
    success: function(data) 
    {
      if (dt_sub_category_list_table.length) {
        var dt_category = dt_sub_category_list_table.DataTable({
          // ajax: assetsPath + 'json/ecommerce-sub-category-list.json', // JSON file to add data
          data: data.data,
          columns: [
            // columns according to JSON
            // { data: '' },
            { data: 'id' },
            // { data: 'sub_categoryID' },
            { data: 'sub_categoryName' },
            // { data: 'categoryID' },
            { data: 'categoryName' },
            { data: 'mapping_active' },
            { data: 'total_products' }
          ],
          columnDefs: [
            {
              // For Responsive
              className: 'control',
              searchable: false,
              orderable: false,
              targets: 0,
              render: function (data, type, full, meta) {
                return '';
              }
            },
            // {
            //   // For Checkboxes
            //   targets: 1,
            //   orderable: false,
            //   searchable: false,
            //   responsivePriority: 4,
            //   checkboxes: true,
            //   render: function () {
            //     return '<input type="checkbox" class="dt-checkboxes form-check-input">';
            //   },
            //   checkboxes: {
            //     selectAllRender: '<input type="checkbox" class="form-check-input">'
            //   }
            // },
            // {
            //   // Categories and Category Detail
            //   targets: 2,
            //   responsivePriority: 2,
            //   render: function (data, type, full, meta) {
            //     var $name = full['categories'],
            //       $category_detail = full['category_detail'],
            //       $image = full['cat_image'],
            //       $id = full['id'];
            //     if ($image) {
            //       // For Product image
            //       var $output =
            //         '<img src="' +
            //         assetsPath +
            //         'img/ecommerce-images/' +
            //         $image +
            //         '" alt="Product-' +
            //         $id +
            //         '" class="rounded">';
            //     } else {
            //       // For Product badge
            //       var stateNum = Math.floor(Math.random() * 6);
            //       var states = ['success', 'danger', 'warning', 'info', 'dark', 'primary', 'secondary'];
            //       var $state = states[stateNum],
            //         $name = full['category_detail'],
            //         $initials = $name.match(/\b\w/g) || [];
            //       $initials = (($initials.shift() || '') + ($initials.pop() || '')).toUpperCase();
            //       $output = '<span class="avatar-initial rounded-2 bg-label-' + $state + '">' + $initials + '</span>';
            //     }
            //     // Creates full output for Categories and Category Detail
            //     var $row_output =
            //       '<div class="d-flex align-items-center">' +
            //       // '<div class="avatar-wrapper me-3 rounded bg-label-secondary user-name">' +
            //       // '<div class="avatar">' +
            //       // $output +
            //       // '</div>' +
            //       // '</div>' +
            //       '<div class="d-flex flex-column justify-content-center">' +
            //       '<span class="text-heading fw-medium text-wrap">' +
            //       $name +
            //       '</span>' +
            //       // '<small class="text-truncate mb-0 d-none d-sm-block">' +
            //       // $category_detail +
            //       // '</small>' +
            //       '</div>' +
            //       '</div>';
            //     return $row_output;
            //   }
            // },
            // {              
            //   targets: 2,
            //   orderable: false,
            //   render: function (data, type, full, meta) {
            //     var $sub_categoryID = full['sub_categoryID'];
            //     return "<div class='text-sm-end hidden'>" + $sub_categoryID + '</div>';
            //   }
            // },
            {              
              targets: 1,
              responsivePriority: 2,
              render: function (data, type, full, meta) {
                var $sub_categoryName = full['sub_categoryName'];
                return '<div class="text-sm-start">' + $sub_categoryName + '</div>';
              }
            },
            // {              
            //   targets: 4,
            //   render: function (data, type, full, meta) {
            //     var $categoryID = full['categoryID'];
            //     return '<div class="text-sm-end hidden">' + $categoryID + '</div>';
            //   }
            // },
            {              
              targets: 2,
              responsivePriority: 3,
              render: function (data, type, full, meta) {
                var $categoryName = full['categoryName'];
                var $class = full['cat_active'] == 1 ? "text-danger" : "";
                return '<div class="text-sm-end '+$class+'">' + $categoryName + '</div>';
              }
            },
            {
              targets: 4,
              responsivePriority: 1,
              render: function (data, type, full, meta) {
                var $Active = full['sub_active'];
                  if($Active == 1)
                  return '<div class="text-sm-end me-4 text-success">Active</div>';
                  if($Active == 0)
                  return '<div class="text-sm-end me-4 text-danger">Suspended</div>';
              }
            },
            {
              targets: 3,
              responsivePriority: 1,
              render: function (data, type, full, meta) {
                var $total_products = full['total_products'];
                return '<div class="text-sm-end">' + $total_products + '</div>';
              }
            },
            {
              // Actions
              targets: 5,
              title: 'Actions',
              searchable: false,
              orderable: false,
              render: function (data, type, full, meta) {
                var $id =  full["id"];
                var $categoryID =  full["categoryID"];
                var $sub_categoryName =  full["sub_categoryName"];
                var $categoryName =  full["categoryName"];
                var $sub_active =  full["sub_active"];
                var $cat_subcat_id =  full["cat_subcat_id"];
                var $is_active = full["mapping_active"];
                //   '<a href="javascript:0;" class="dropdown-item">View</a>' +
                var $return =
                  '<div class="d-flex align-items-sm-center justify-content-sm-center">' +
                    '<button class="btn btn-sm btn-icon btn-text-secondary waves-effect waves-light rounded-pill" type="button" data-bs-toggle="offcanvas" data-bs-target ="#offcanvasEcommerceCategoryListedit" onclick="editSubCategory(\''+$sub_categoryName+'\',\''+$categoryName+'\','+$id+','+$cat_subcat_id+','+$sub_active+')"><i class="ri-edit-box-line ri-20px"></i></button>';
                
                $return += '<button class="btn btn-sm btn-icon btn-text-secondary waves-effect waves-light rounded-pill dropdown-toggle hide-arrow" data-bs-toggle="dropdown"><i class="ri-more-2-line ri-20px"></i></button>';
                if($is_active == 1) {
                    $return += 
                    '<div class="dropdown-menu dropdown-menu-end m-0">' +
                    '<a href="javascript:SubmitForm(\'delete\',\''+$id+'\',\''+$categoryID+'\',\''+$cat_subcat_id+'\');" class="dropdown-item">Suspend</a>' +
                    '</div>' +
                    '</div>';
                }
                
                if($is_active == 0) {
                    $return += 
                    '<div class="dropdown-menu dropdown-menu-end m-0">' +
                    '<a href="javascript:SubmitForm(\'active\',\''+$id+'\',\''+$categoryID+'\',\''+$cat_subcat_id+'\');" class="dropdown-item">Active</a>' +
                    '</div>' +
                    '</div>';
                }   
                // $return +=
                //   '<button class="btn btn-sm btn-icon btn-text-secondary waves-effect waves-light rounded-pill dropdown-toggle hide-arrow" data-bs-toggle="dropdown"><i class="ri-more-2-line ri-20px"></i></button>' +
                //   '<div class="dropdown-menu dropdown-menu-end m-0">' +
                //   '<a href="javascript:0;" class="dropdown-item">Suspend</a>' +
                //   '</div>' +
                //   '</div>';
                
                return $return;
              }
            }
          ],
          order: [2, 'desc'], //set any columns order asc/desc
          dom:
              '<"card-header d-flex rounded-0 flex-wrap pb-md-0 pt-0"' +
              '<"me-5 ms-n2"f>' +
              '<"d-flex justify-content-start justify-content-md-end align-items-baseline"<"dt-action-buttons d-flex align-items-start align-items-md-center justify-content-sm-center mb-0 gap-4"lB>>' +
              '>t' +
              '<"row mx-1"' +
              '<"col-sm-12 col-md-6"i>' +
              '<"col-sm-12 col-md-6"p>' +
              '>',
          lengthMenu: [7, 10, 20, 50, 70, 100], //for length of menu
          language: {
            sLengthMenu: '_MENU_',
            search: '',
            searchPlaceholder: 'Search Sub Category',
            paginate: {
              next: '<i class="ri-arrow-right-s-line"></i>',
              previous: '<i class="ri-arrow-left-s-line"></i>'
            }
          },
          // Button for offcanvas
          buttons: [
            {
              extend: 'collection',
              className: 'btn btn-outline-secondary dropdown-toggle me-4 waves-effect waves-light',
              text: '<i class="ri-upload-2-line me-1"></i> <span class="d-none d-sm-inline-block">Export</span>',
              buttons: [
                {
                  extend: 'print',
                  text: '<i class="ri-printer-line me-1"></i>Print',
                  className: 'dropdown-item',
                  exportOptions: {
                    columns: [1, 2, 3, 4, 5],
                    // prevent avatar to be print
                    format: {
                      body: function (inner, coldex, rowdex) {
                        if (inner.length <= 0) return inner;
                        var el = $.parseHTML(inner);
                        var result = '';
                        $.each(el, function (index, item) {
                          if (item.classList !== undefined && item.classList.contains('user-name')) {
                            result = result + item.lastChild.firstChild.textContent;
                          } else if (item.innerText === undefined) {
                            result = result + item.textContent;
                          } else result = result + item.innerText;
                        });
                        return result;
                      }
                    }
                  },
                  customize: function (win) {
                    //customize print view for dark
                    $(win.document.body)
                      .css('color', headingColor)
                      .css('border-color', borderColor)
                      .css('background-color', bodyBg);
                    $(win.document.body)
                      .find('table')
                      .addClass('compact')
                      .css('color', 'inherit')
                      .css('border-color', 'inherit')
                      .css('background-color', 'inherit');
                  }
                },
                {
                  extend: 'csv',
                  text: '<i class="ri-file-text-line me-1" ></i>Csv',
                  className: 'dropdown-item',
                  exportOptions: {
                    columns: [1, 2, 3, 4, 5],
                    // prevent avatar to be display
                    format: {
                      body: function (inner, coldex, rowdex) {
                        if (inner.length <= 0) return inner;
                        var el = $.parseHTML(inner);
                        var result = '';
                        $.each(el, function (index, item) {
                          if (item.classList !== undefined && item.classList.contains('user-name')) {
                            result = result + item.lastChild.firstChild.textContent;
                          } else if (item.innerText === undefined) {
                            result = result + item.textContent;
                          } else result = result + item.innerText;
                        });
                        return result;
                      }
                    }
                  }
                },
                {
                  extend: 'excel',
                  text: '<i class="ri-file-excel-line me-1"></i>Excel',
                  className: 'dropdown-item',
                  exportOptions: {
                    columns: [1, 2, 3, 4, 5],
                    // prevent avatar to be display
                    format: {
                      body: function (inner, coldex, rowdex) {
                        if (inner.length <= 0) return inner;
                        var el = $.parseHTML(inner);
                        var result = '';
                        $.each(el, function (index, item) {
                          if (item.classList !== undefined && item.classList.contains('user-name')) {
                            result = result + item.lastChild.firstChild.textContent;
                          } else if (item.innerText === undefined) {
                            result = result + item.textContent;
                          } else result = result + item.innerText;
                        });
                        return result;
                      }
                    }
                  }
                },
                {
                  extend: 'pdf',
                  text: '<i class="ri-file-pdf-line me-1"></i>Pdf',
                  className: 'dropdown-item',
                  exportOptions: {
                    columns: [1, 2, 3, 4, 5],
                    // prevent avatar to be display
                    format: {
                      body: function (inner, coldex, rowdex) {
                        if (inner.length <= 0) return inner;
                        var el = $.parseHTML(inner);
                        var result = '';
                        $.each(el, function (index, item) {
                          if (item.classList !== undefined && item.classList.contains('user-name')) {
                            result = result + item.lastChild.firstChild.textContent;
                          } else if (item.innerText === undefined) {
                            result = result + item.textContent;
                          } else result = result + item.innerText;
                        });
                        return result;
                      }
                    }
                  }
                },
                {
                  extend: 'copy',
                  text: '<i class="ri-file-copy-line me-1"></i>Copy',
                  className: 'dropdown-item',
                  exportOptions: {
                    columns: [1, 2, 3, 4, 5],
                    // prevent avatar to be display
                    format: {
                      body: function (inner, coldex, rowdex) {
                        if (inner.length <= 0) return inner;
                        var el = $.parseHTML(inner);
                        var result = '';
                        $.each(el, function (index, item) {
                          if (item.classList !== undefined && item.classList.contains('user-name')) {
                            result = result + item.lastChild.firstChild.textContent;
                          } else if (item.innerText === undefined) {
                            result = result + item.textContent;
                          } else result = result + item.innerText;
                        });
                        return result;
                      }
                    }
                  }
                }
              ]
            },
            {
              text: '<i class="ri-add-line ri-16px me-0 me-sm-1 align-baseline"></i><span class="d-none d-sm-inline-block" >Add Sub Category</span>',
              className: 'add-new btn btn-primary waves-effect waves-light',
              attr: {
                'data-bs-toggle': 'offcanvas',
                'data-bs-target': '#offcanvasEcommerceCategoryList'
              },
              action: function getCategories () {
                var xmlhttpr = ""; 
                if(window.XMLHttpRequest) {
                    xmlhttpr = new XMLHttpRequest();
                } else {
                    xmlhttpr = new ActiveXObject("Microsoft.xmlhttpr");
                }
              
                xmlhttpr.onreadystatechange = function () {
                    if(xmlhttpr.readyState == 4 && xmlhttpr.status == 200) {
                        var categoryDropdown = document.getElementById("ecommerce-category-parent-category");
                        var result = JSON.parse(xmlhttpr.responseText);
                        var categories = result.data;
                        categories.forEach((obj) => {
                          var CategoryID = obj.CategoryID ;
                          var CategoryName = obj.CategoryName ;
                          var option = document.createElement("option");
                          option.text = CategoryName;
                            categoryDropdown.add(option);
                      });
                    }
                }
              
                xmlhttpr.open("GET", "api_category.php", true);
                xmlhttpr.send();
              }
            }
          ],
          // For responsive popup
          responsive: {
            details: {
              display: $.fn.dataTable.Responsive.display.modal({
                header: function (row) {
                  var data = row.data();
                  return 'Details of ' + data['categories'];
                }
              }),
              type: 'column',
              renderer: function (api, rowIdx, columns) {
                var data = $.map(columns, function (col, i) {
                  return col.title !== '' // ? Do not show row in modal popup if title is blank (for check box)
                    ? '<tr data-dt-row="' +
                        col.rowIndex +
                        '" data-dt-column="' +
                        col.columnIndex +
                        '">' +
                        '<td> ' +
                        col.title +
                        ':' +
                        '</td> ' +
                        '<td class="ps-0">' +
                        col.data +
                        '</td>' +
                        '</tr>'
                    : '';
                }).join('');

                return data ? $('<table class="table"/><tbody />').append(data) : false;
              }
            }
          }
        });
        $('.dataTables_length').addClass('my-0');
        $('.dt-action-buttons').addClass('pt-0');
      }
    }
  });
});

//For form validation
// (function () {
//   const eCommerceCategoryListForm = document.getElementById('eCommerceCategoryListForm');

//   //Add New customer Form Validation
//   const fv = FormValidation.formValidation(eCommerceCategoryListForm, {
//     fields: {
//       categoryTitle: {
//         validators: {
//           notEmpty: {
//             message: 'Please enter category title'
//           }
//         }
//       },
//       plugins: {
//         trigger: new FormValidation.plugins.Trigger(),
//         bootstrap5: new FormValidation.plugins.Bootstrap5({
//           // Use this for enabling/changing valid/invalid class
//           eleValidClass: 'is-valid',
//           rowSelector: function (field, ele) {
//             // field is the field name & ele is the field element
//             return '.mb-5';
//           }
//         }),
//         // submitButton: new FormValidation.plugins.SubmitButton(),
//         // Submit the form when all fields are valid
//         // defaultSubmit: new FormValidation.plugins.DefaultSubmit(),
//         autoFocus: new FormValidation.plugins.AutoFocus()
//       }
//     }
//   });
// })();


//Edit Popup Values

function editSubCategory(sub_categoryName, categoryNameA, subcategoryid_edit, cat_subcat_id, isActive) {
      
      getCategories(categoryNameA);
      
      // document.getElementById("ecommerce-category-parent-category").value = sub_category_id;
      document.getElementById("subcategoryid_edit").value = subcategoryid_edit;
      document.getElementById("cat_subcat_id").value = cat_subcat_id;
      document.getElementById("ecommerce-category-title-edit").value = sub_categoryName;
      document.getElementById("isActiveSubCatEdit").checked = false;
      if(isActive == 1) {
        document.getElementById("isActiveSubCatEdit").checked = true;
      }
      return(0);
    }

function getCategories(categoryNameA = "") {
  var xmlhttpr = ""; 
  if(window.XMLHttpRequest) {
      xmlhttpr = new XMLHttpRequest();
  } else {
      xmlhttpr = new ActiveXObject("Microsoft.xmlhttpr");
  }

  xmlhttpr.onreadystatechange = function () {
      if(xmlhttpr.readyState == 4 && xmlhttpr.status == 200) {
          // var categoryDropdown = document.getElementById("ecommerce-category-parent-category");
          var categoryDropdownEdit = document.getElementById("ecommerce-category-parent-category-edit");
          var result = JSON.parse(xmlhttpr.responseText);
          var categories = result.data;
          categories.forEach((obj) => {
            var CategoryID = obj.CategoryID ;
            var CategoryName = obj.CategoryName ;
            var option = document.createElement("option");
            option.text = CategoryName;
            if(CategoryName == categoryNameA){
              option.selected = true;
              // categoryDropdown.add(option);
              categoryDropdownEdit.add(option);
            } else {
              // categoryDropdown.add(option);
              categoryDropdownEdit.add(option);
            }
        });
      }
  }

  xmlhttpr.open("GET", "api_category.php", true);
  xmlhttpr.send();
}

function myFunction() {
    
  event.preventDefault(); // Prevent default form submission
  let formData = new FormData();
  // let fileInput = document.getElementById("fileInput");
  // let subcategoryid_edit = document.getElementById("subcategoryid_edit").value;
  let subcategoryTitle = document.getElementById("ecommerce-category-title").value;
  let parentCategoryName = document.getElementById("ecommerce-category-parent-category").value;
  let isActive = document.getElementById("isActiveSubCat").checked;
  if(subcategoryTitle != "") {
    
    formData.append("subcategoryTitle", subcategoryTitle);
    formData.append("parentCategoryName", parentCategoryName);
    formData.append("isActive", isActive);

    // if(subcategoryid_edit == "" || subcategoryid_edit != undefined ) {
            // formData.append("subcategoryid_edit", subcategoryid_edit);
            fetch("api_subcategory.php", {
                method: "POST",
                body: formData,
            })
            .then(response => response.json())
            .then(data => {
              
              let selectedType = "";
              let selectedAnimation = "";
              if(data.status == "success"){
                
                document.querySelector('#messageText').innerHTML = data.data;
                document.querySelector('#entityTitle').innerHTML = data.sub_categoryTitle;
                
                const toastAnimationExample = document.querySelector('.toast-ex');
                document.querySelector('#offcanvasEcommerceCategoryList').classList.remove("show");
                document.querySelector('body').setAttribute('style', "");
                document.querySelector('.offcanvas-backdrop').classList.remove("show");
                selectedType = "bg-success";
                selectedAnimation = "swing";

                toastAnimationExample.querySelectorAll('i[class^="ri-"]').forEach(function (element) {
                  element.classList.add(selectedType);
                });
                toastAnimationExample.classList.remove(selectedAnimation, "bg-danger");
                toastAnimationExample.classList.add(selectedAnimation, "bg-success");
                let toastAnimation = new bootstrap.Toast(toastAnimationExample);
                toastAnimation.show();
              }
              if(data.status == "fail"){
                
                document.querySelector('#messageText').innerHTML = data.data;
                document.querySelector('#entityTitle').innerHTML = data.sub_categoryTitle;
                
                const toastAnimationExample = document.querySelector('.toast-ex');
                selectedType = "bg-danger";
                selectedAnimation = "swing";

                toastAnimationExample.querySelectorAll('i[class^="ri-"]').forEach(function (element) {
                  element.classList.add(selectedType);
                });
                toastAnimationExample.classList.remove(selectedAnimation, "bg-success");
                toastAnimationExample.classList.add(selectedAnimation, "bg-danger");
                let toastAnimation = new bootstrap.Toast(toastAnimationExample);
                toastAnimation.show();
              } 
            })
            // .catch(error => {
            //     console.log("Error occurred while adding category:", error);
            //     // alert("Error occurred while adding category.");
            // });
    // }
  } else {
        // alert("Please enter a sub category title.");
  }
}

function myFunctionUpdate() {

  event.preventDefault(); // Prevent default form submission
  let formData = new FormData();
  // let fileInput = document.getElementById("fileInput");
  let subcategoryID = document.getElementById("subcategoryid_edit").value;
  let subcategoryTitle = document.getElementById("ecommerce-category-title-edit").value;
  let parentCategoryName = document.getElementById("ecommerce-category-parent-category-edit").value;
  let cat_subcat_id = document.getElementById("cat_subcat_id").value;
  let isActive = document.getElementById("isActiveSubCatEdit").checked;
  if(subcategoryTitle != "") {
    
    var subCategoryData = {
       cat_subcat_id : cat_subcat_id,
       subCategoryID : subcategoryID ,
       subcategoryTitle : subcategoryTitle ,
       parentCategoryName : parentCategoryName ,
       isActive : isActive
    };

    if(subcategoryid_edit != "" || subcategoryid_edit != undefined ){
          fetch("api_subcategory.php", {
              method: "PUT",
              headers: {
                'Content-Type': 'application/json',
              },
              body: JSON.stringify( {subCategoryData} )
          })
          .then(response => response.json())
          .then(data => {

            let selectedType = "";
            let selectedAnimation = "";

            if(data.status == "success"){
              
              document.querySelector('#messageText').innerHTML = data.data;
              document.querySelector('#entityTitle').innerHTML = data.sub_categoryTitle;
              
              const toastAnimationExample = document.querySelector('.toast-ex');
              document.querySelector('#offcanvasEcommerceCategoryListedit').classList.remove("show");
              document.querySelector('body').setAttribute('style', "");
              document.querySelector('.offcanvas-backdrop').classList.remove("show");
              selectedType = "bg-success";
              selectedAnimation = "swing";

              toastAnimationExample.querySelectorAll('i[class^="ri-"]').forEach(function (element) {
                element.classList.add(selectedType);
              });
              toastAnimationExample.classList.remove(selectedAnimation, "bg-danger");
              toastAnimationExample.classList.add(selectedAnimation, "bg-success");
              let toastAnimation = new bootstrap.Toast(toastAnimationExample);
              toastAnimation.show();
            }
            if(data.status == "fail"){
              
              document.querySelector('#messageText').innerHTML = data.data;
              document.querySelector('#entityTitle').innerHTML = data.sub_categoryTitle;
              
              const toastAnimationExample = document.querySelector('.toast-ex');
              selectedType = "bg-danger";
              selectedAnimation = "swing";

              toastAnimationExample.querySelectorAll('i[class^="ri-"]').forEach(function (element) {
                element.classList.add(selectedType);
              });
              toastAnimationExample.classList.remove(selectedAnimation, "bg-success");
              toastAnimationExample.classList.add(selectedAnimation, "bg-danger");
              let toastAnimation = new bootstrap.Toast(toastAnimationExample);
              toastAnimation.show();
            } 
          })
          // .catch(error => {
          //     console.error("Error occurred while adding category:", error);
          //     // alert("Error occurred while adding category.");
          // });
      
    }
  } else {
        alert("Please enter a sub category title.");
  }
}


function SubmitForm(action, submittedid = 0, categoryID = 0, cat_subcat_id= 0) {
            
  let formData = new FormData();

  if((action == "delete" || action == "active") && submittedid != 0)
  {
        let subCategoryID = submittedid;
    
        if(subCategoryID != "") {
            
        var subCategoryData = {
            "status": action,
            "subCategoryID": subCategoryID,
            "CategoryID": categoryID,
            "cat_subcat_id": cat_subcat_id
        };
        
        // let jsonObj = JSON.stringify(
        //   {
        //     "status": action,
        //     "subCategoryID": subCategoryID,
        //     "CategoryID": categoryID,
        //     "cat_subcat_id": cat_subcat_id,
        //   }
        // );
        
        //   body: jsonObj,
        
        fetch("api_subcategory.php", {
              method: "PUT",
              body: JSON.stringify( {subCategoryData} ),
          })
        .then(response => response.json())
        .then(data => {
          
          let selectedType = "";
          let selectedAnimation = "";

          if(data.status == "success"){
            
            document.querySelector('#messageText').innerHTML = data.data;
            document.querySelector('#entityTitle').innerHTML = data.categoryTitle;
            
            const toastAnimationExample = document.querySelector('.toast-ex');
            // document.querySelector('#offcanvasEcommerceCategoryListEdit').classList.remove("show");
            // document.querySelector('body').setAttribute('style', "");
            // document.querySelector('.offcanvas-backdrop').classList.remove("show");
            selectedType = "bg-success";
            selectedAnimation = "swing";

            toastAnimationExample.querySelectorAll('i[class^="ri-"]').forEach(function (element) {
              element.classList.add(selectedType);
            });
            toastAnimationExample.classList.remove(selectedAnimation, "bg-danger");
            toastAnimationExample.classList.add(selectedAnimation, "bg-success");
            let toastAnimation = new bootstrap.Toast(toastAnimationExample);
            toastAnimation.show();
            setTimeout(function() {
              // Redirect to another URL, replacing the current page in history
              window.location.replace('sub-category');
            }, 2000);

          }
          if(data.status == "fail"){
            
            document.querySelector('#messageText').innerHTML = data.data;
            document.querySelector('#entityTitle').innerHTML = data.categoryTitle;
            
            const toastAnimationExample = document.querySelector('.toast-ex');
            selectedType = "bg-danger";
            selectedAnimation = "swing";

            toastAnimationExample.querySelectorAll('i[class^="ri-"]').forEach(function (element) {
              element.classList.add(selectedType);
            });
            toastAnimationExample.classList.remove(selectedAnimation, "bg-success");
            toastAnimationExample.classList.add(selectedAnimation, "bg-danger");
            let toastAnimation = new bootstrap.Toast(toastAnimationExample);
            toastAnimation.show();
          } 
        });
        // .catch(error => {
        //     console.error("Error occurred while updating category:", error);
        //     alert("Error occurred while updating category.");
        // });
    } else {
        alert("Please enter a correct information.");
    }
  }
  
}
