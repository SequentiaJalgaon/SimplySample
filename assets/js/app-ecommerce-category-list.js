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
  var dt_category_list_table = $('.datatables-category-list');

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

  // var dataString = "flag=fetchmediaaudio&id="+id;

  $.ajax({
    url: categoryApi,
    type: 'GET',
    dataType: 'json', // added data type
    success: function(data) {
       
        
        if (dt_category_list_table.length) {
          var dt_category = dt_category_list_table.DataTable({
            // ajax: "assets/json/ecommerce-category-list.json", // JSON file to add data
            // ajax: res, // JSON file to add data
            data: data.data,
            columns: [
              // columns according to JSON
              { data: '' },
              { data: 'CategoryID' },
              { data: 'CategoryName' },
              { data: 'Active' },
              // { data: 'total_earnings' },
              { data: '' }
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
              {
                // For Checkboxes
                targets: 1,
                orderable: false,
                searchable: false,
                responsivePriority: 4,
                checkboxes: true,
                render: function () {
                  return '<input type="checkbox" class="dt-checkboxes form-check-input" title="Formatting">';
                },
                checkboxes: {
                  selectAllRender: '<input type="checkbox" class="form-check-input">'
                }
              },
              {
                // Categories and Category Detail
                targets: 2,
                responsivePriority: 2,
                render: function (data, type, full, meta) {
                  var $CategoryName = full['CategoryName'],
                  $id =     full['CategoryID'],
                  $image = full['CategoryImage'];
                  if ($image) {
                      var $output =
                        '<img src="' +
                        $image +
                        '" alt="Category-' +
                        $id +
                        '" class="rounded-2">';
                  } else {
                    var stateNum = Math.floor(Math.random() * 6);
                    var states = ['success', 'danger', 'warning', 'info', 'dark', 'primary', 'secondary'];
                    var $state = states[stateNum],
                      $name = full['CategoryName'],
                      $initials = $name.match(/\b\w/g) || [];
                    $initials = (($initials.shift() || '') + ($initials.pop() || '')).toUpperCase();
                    $output = '<span class="avatar-initial rounded-2 bg-label-' + $state + '">' + $initials + '</span>';
                  }
                        var $row_output =
                            '<div class="d-flex justify-content-start align-items-center product-name">' +
                            '<div class="avatar-wrapper me-3">' +
                            '<div class="avatar rounded-3 bg-label-secondary">' +
                            $output +
                            '</div>' +
                            '</div>' +
                            '<div class="d-flex flex-column">' +
                            '<span class="text-nowrap text-heading fw-medium">' +
                            $CategoryName +
                            '</span>' +
                            '</div>' +
                            '</div>';
                          return $row_output;
                          
                  // return '<div class="text-sm-start">' + $CategoryName + '</div>';
                }
              },
              {
                // Total products
                targets: 3,
                responsivePriority: 3,
                render: function (data, type, full, meta) {
                  var $Active = full['Active'];
                  if($Active == 1)
                  return '<div class="text-sm-end me-4 text-success">Active</div>';
                  if($Active == 0)
                  return '<div class="text-sm-end me-4 text-danger">Suspended</div>';
                }
              },
              // {
              //   // Total Earnings
              //   targets: 4,
              //   orderable: false,
              //   render: function (data, type, full, meta) {
              //     var $total_earnings = full['total_earnings'];
              //     return "<div class='text-sm-end'>" + $total_earnings + '</div>';
              //   }
              // },
              {
                // Actions
                targets: -1,
                title: 'Actions',
                searchable: false,
                orderable: false,
                render: function (data, type, full, meta) {
                  var $categoryID =  full["CategoryID"];
                  var $categoryName =  full["CategoryName"];
                  var $is_active =  full["Active"];
                  var $base64image =  full["CategoryImage"];
                  return (
                    '<div class="d-flex align-items-sm-center justify-content-sm-center">' +
                    
                    '<button class="btn btn-sm btn-icon btn-text-secondary waves-effect waves-light rounded-pill" type="button" data-bs-toggle="offcanvas" data-bs-target ="#offcanvasEcommerceCategoryListEdit" onclick="editCategory(\''+$categoryName+'\',\''+$categoryID+'\','+$is_active+',\''+$base64image+'\')"><i class="ri-edit-box-line ri-20px"></i></button>' +
                    
                    '<button class="btn btn-sm btn-icon btn-text-secondary waves-effect waves-light rounded-pill dropdown-toggle hide-arrow" data-bs-toggle="dropdown"><i class="ri-more-2-line ri-20px"></i></button>' +
                    '<div class="dropdown-menu dropdown-menu-end m-0">' +
                    '<a href="javascript:SubmitForm(\'delete\',\''+$categoryID+'\');" class="dropdown-item">Delete</a>' +
                    '</div>' +
                    '</div>'
                  );
                  // '<a href="javascript:0;" class="dropdown-item">View</a>' +
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
              searchPlaceholder: 'Search Category',
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
                text: '<i class="ri-add-line ri-16px me-0 me-sm-1 align-baseline"></i><span class="d-none d-sm-inline-block">Add Category</span>',
                className: 'add-new btn btn-primary waves-effect waves-light',
                attr: {
                  'data-bs-toggle': 'offcanvas',
                  'data-bs-target': '#offcanvasEcommerceCategoryListAdd'
                }
              },
              {
                text: '<span class="d-none d-sm-inline-block">Update Category Sequence</span>',
                className: 'btn btn-success waves-effect waves-light',
                attr: {
                  'href': 'category_sequence',
                  'style': 'margin-left: 20px'
                }
              }
            ],
            // bAutoWidth: false, 
            // aoColumns : [
            //   { sWidth: '15%' },
            //   { sWidth: '15%' },
            //   { sWidth: '15%' },
            //   { sWidth: '15%' },
            //   { sWidth: '15%' },
            //   { sWidth: '15%' },
            //   { sWidth: '10%' }
            // ],
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

  // Customers List Datatable
  
  
});

//For form validation
(function () {
  const eCommerceCategoryListForm = document.getElementById('eCommerceCategoryListForm');

  //Add New customer Form Validation
  const fv = FormValidation.formValidation(eCommerceCategoryListForm, {
    fields: {
      categoryTitle: {
        validators: {
          notEmpty: {
            message: 'Please enter category title'
          }
        }
      }
    },
    plugins: {
      trigger: new FormValidation.plugins.Trigger(),
      bootstrap5: new FormValidation.plugins.Bootstrap5({
        // Use this for enabling/changing valid/invalid class
        eleValidClass: 'is-valid',
        rowSelector: function (field, ele) {
          // field is the field name & ele is the field element
          return '.mb-5';
        }
      }),
      // submitButton: new FormValidation.plugins.SubmitButton(),
      // Submit the form when all fields are valid
      // defaultSubmit: new FormValidation.plugins.DefaultSubmit(),
      autoFocus: new FormValidation.plugins.AutoFocus()
    }
  });
})();

function editCategory(categoryName, categoryid_edit, isActive, base64image) {
        
  var category_id = document.getElementById("categoryid_edit");
  var category_title = document.getElementById("ecommerce-category-title-edit");
  var isActiveElement = document.getElementById("isActiveCatEdit");
  var imagePreview = document.getElementById("imagePreviewEdit");

  category_id.value=0;
  category_title.value="";
  isActiveElement.checked = false;

  if(base64image != "") {
    imagePreview.src = base64image;
    imagePreview.classList.remove('d-none');
  } else {
    imagePreview.classList.add('d-none');
  }

  category_id.value = categoryid_edit;
  category_title.value = categoryName;
  if(isActive == 1) isActiveElement.checked = true;

  return 0;
}

function SubmitForm(action, submittedid = 0) {
          
            
  let formData = new FormData();

  if(action == "add")
  {
    event.preventDefault(); // Prevent default form submission
    // let fileInput = document.getElementById("fileInput");
    let categoryTitle = document.getElementById("ecommerce-category-title").value;
    let imageUpload = document.getElementById('imagePreview');
    let categoryImage = "";
    if(imageUpload != "" && imageUpload != "undefined" && imageUpload != null) {
      categoryImage = imageUpload.src;
    }
        
    if(categoryTitle != "") {
        formData.append("categoryTitle", categoryTitle);
        formData.append("categoryImage", categoryImage);
        fetch("api_category.php", {
              method: "POST",
              body: formData,
          })
        .then(response => response.json())
        .then(data => {
          console.log(data);
          if(data.status == "success"){
            
            document.querySelector('#messageText').innerHTML = data.data;
            document.querySelector('#entityTitle').innerHTML = data.categoryTitle;
            
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
            toastAnimation = new bootstrap.Toast(toastAnimationExample);
            toastAnimation.show();
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
            toastAnimation = new bootstrap.Toast(toastAnimationExample);
            toastAnimation.show();
          } 
        })
        .catch(error => {
            console.error("Error occurred while adding category:", error);
            alert("Error occurred while adding category.");
        });
    } else {
        alert("Please enter a category title.");
    }
  }

  if(action == "update")
  {
    event.preventDefault(); // Prevent default form submission
    let categoryTitle = document.getElementById("ecommerce-category-title-edit").value;
    let categoryId = document.getElementById("categoryid_edit").value;
    let isActive = document.getElementById("isActiveCatEdit").checked;
    isActive == true ? isActive = 1 : isActive = 0;
    let imageUpload = document.getElementById('imagePreviewEdit');
    let categoryImage = "";
    if(imageUpload != "" && imageUpload != "undefined" && imageUpload != null) {
      categoryImage = imageUpload.src;
    }

    if(categoryTitle != "") {
        // formData.append("categoryTitle", categoryTitle);
        // formData.append("categoryId", categoryId);
        // formData.append("isActive", isActive);
        // console.log(formData);
        
        let jsonObj = JSON.stringify(
          {
            "categoryTitle": categoryTitle,
            "categoryId": categoryId,
            "isActive": isActive,
            "categoryImage":categoryImage
          }
        )
        fetch("api_category.php", {
              method: "PUT",
              body:  jsonObj ,
          })
        .then(response => response.json())
        .then(data => {
          
          let selectedType = "";
          let selectedAnimation = "";
          
          if(data.status == "success"){
            
            document.querySelector('#messageText').innerHTML = data.data;
            document.querySelector('#entityTitle').innerHTML = data.categoryTitle;
            
            const toastAnimationExample = document.querySelector('.toast-ex');
            document.querySelector('#offcanvasEcommerceCategoryListEdit').classList.remove("show");
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
        })
        .catch(error => {
            console.error("Error occurred while updating category:", error);
            alert("Error occurred while updating category.");
        });
    } else {
        alert("Please enter a correct information.");
    }
  }

  if(action == "delete" && submittedid != 0)
  {
    console.log("Inside Delete");
    let categoryId = submittedid;
    if(categoryId != "") {
        // formData.append("categoryId", categoryId);
        let jsonObj = JSON.stringify(
          {
            "categoryId": categoryId
          }
        )
        fetch("api_category.php", {
              method: "DELETE",
              body: jsonObj,
          })
        .then(response => response.json())
        .then(data => {
          
          let selectedType = "";
          let selectedAnimation = "";

          if(data.status == "success"){
            
            document.querySelector('#messageText').innerHTML = data.data;
            document.querySelector('#entityTitle').innerHTML = data.categoryTitle;
            
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
            document.querySelector('#entityTitle').innerHTML = data.categoryTitle;
            
            const toastAnimationExample = document.querySelector('.toast-ex');
            selectedType = "bg-danger";
            selectedAnimation = "swing";

            toastAnimationExample.querySelectorAll('i[class^="ri-"]').forEach(function (element) {
              element.classList.add(selectedType);
            });
            toastAnimationExample.classList.remove(selectedAnimation, "bg-success");
            toastAnimationExample.classList.add(selectedAnimation, "bg-danger");
            toastAnimation = new bootstrap.Toast(toastAnimationExample);
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
  
  // if (fileInput.files.length > 0) {
  //     formData.append("file", fileInput.files[0]);

  //     fetch("upload.php", {
  //         method: "POST",
  //         body: formData,
  //     })
  //     .then(response => response.json())
  //     .then(data => {
  //         console.log("File uploaded successfully:", data);
  //         alert("File uploaded successfully!");
  //     })
  //     .catch(error => {
  //         console.error("Error uploading file:", error);
  //         alert("Error uploading file.");
  //     });
  // } else {
  //     alert("Please select a file to upload.");
  // }
// });
}

function checkImage(idName = "") {
                                  
  const input = document.getElementById('categoryIcon'+idName);
  const file = input.files[0];
  const preview = document.getElementById('imagePreview'+idName);
  const statusMessage = document.getElementById('statusMessage'+idName);

  if (file) {
      // Create a preview of the image
      const reader = new FileReader();
      reader.onload = function (e) {
          preview.src = e.target.result;
          preview.classList.remove("d-none");
          preview.style.display = 'block';
      };
      reader.readAsDataURL(file);

      // Prepare the form data to send to the server
      // const formData = new FormData();
      // formData.append('image', file);

      // // Send the image to the server using Fetch API
      // fetch('upload.php', {
      //     method: 'POST',
      //     body: formData
      // })
      // .then(response => response.json())
      // .then(data => {
      //     if (data.success) {
      //         statusMessage.textContent = "Image uploaded successfully!";
      //     } else {
      //         statusMessage.textContent = "Image upload failed.";
      //     }
      // })
      // .catch(error => {
      //     console.error('Error:', error);
      //     statusMessage.textContent = "Error uploading image.";
      // });
  } else {
    preview.classList.add("d-none");
  }
}

function updateSequence() {
    var sequenceNumber = 1;
    var newSequence = [];
    var elements = document.querySelectorAll('li.list-group-item');
    elements.forEach((element, index) => {
        let categoryId = element.dataset.id;
        if(categoryId != 0 && categoryId != undefined && categoryId != null)
        {
                // let a = [{"CategoryId": categoryId}];
                // let b = [{"SequenceId": index+1}];
                // let c = [{"CategoryId": categoryId},{"SequenceId": index+1}];
                newSequence.push({"CategoryId": categoryId , "SequenceId": index+1});        
        }
    });
    
    console.log(JSON.stringify(newSequence));
    

    fetch("api_categoryArrange.php", {
        method: "POST",
        body: JSON.stringify(newSequence),
    })
    .then(response => response.json())
    .then(data => {
    
    let selectedType = "";
    let selectedAnimation = "";

    if(data.status == "success"){
        

        document.querySelector('#messageText').innerHTML = data.data;
        document.querySelector('#entityTitle').innerHTML = data.categoryTitle;
        
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
    }
    if(data.status == "fail"){
        
        document.querySelector('#messageText').innerHTML = data.data;
        document.querySelector('#entityTitle').innerHTML = data.categoryTitle;
        
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
    .catch(error => {
        console.error("Error occurred while updating category sequence:", error);
        alert("Error occurred while updating category sequence.");
    });
}