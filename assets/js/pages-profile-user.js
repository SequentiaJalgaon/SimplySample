/**
 * profile - user (jquery)
 */
'use strict';

$(function () {
  // Variable declaration for table
  var dt_product_table = $('.datatables-products');
  const params = new URLSearchParams(window.location.search);
  const brandId = params.get('brand_id');
  console.log(brandId);
  // Project datatable
  // --------------------------------------------------------------------
  $.ajax({
    url: brandsApi+'?brand_id='+brandId,
    type: 'GET',
    dataType: 'json', // added data type
    success: function(data) {  

          if(data.statusCode == 200) {
            if(data.data != null ) {
                if(parseInt(data.data.id) > 0) {
                  var $brand_name = data.data.brand_name;
                  var $registered_address = data.data.registered_address;
                  var $delievery_address = data.data.delievery_address;
                  var $documents = data.data.documents;
                  var $firstname = data.data.firstname;
                  var $lastname = data.data.lastname;
                  var $contact = data.data.contact;
                  var $email = data.data.email;
                  var $registration_year = data.data.registration_year;
                  var $gst_number = data.data.gst_number;
                  var $brand_logo = data.data.brand_logo;
                  var $food_licence_number = data.data.food_licence_number;
                  var $categories = data.data.categories;
                  var $requestedCategories = data.data.requestedCategories;
                  var $business_name = data.data.business_name;
                  var $brandStatus = data.data.status;

                  // document.getElementById("viewBrandLogoBanner").src = actualPath+"uploads/logos/"+$brand_logo;
                  if($brand_logo != "")
                    document.getElementById("viewBrandLogo").src = actualPath+"uploads/logos/"+$brand_logo;
                  document.getElementById("viewBrandBusinessName").innerHTML = $business_name;
                  document.getElementById("viewBrandFirstName").innerHTML = $firstname;
                  document.getElementById("viewBrandLastName").innerHTML = $lastname;
                  document.getElementById("viewBrandEmail").innerHTML = $email;
                  document.getElementById("viewBrandContact").innerHTML = $contact;
                  document.getElementById("viewBrandRegisterYear").innerHTML = $registration_year;
                  document.getElementById("viewBrandStatus").innerHTML = $brandStatus.toUpperCase();
                  document.getElementById("viewBrandGST").innerHTML = $gst_number;
                  document.getElementById("viewBrandFoodLicense").innerHTML = $food_licence_number;

                  var categoriesShow = document.getElementById("categoriesShow");
                  
                  categoriesShow.innerHTML = "";

                  $categories.forEach(itemText => {
                    var liElement = ";"
                    if(itemText["category_image"] != "")  {
                      liElement = '<li class="mb-4"><div class="d-flex align-items-center"><div class="d-flex align-items-center"><div class="avatar me-2"><img src="'+itemText["category_image"]+'" alt="Caetegory" class="rounded-circle" /></div><div class="me-2"><h6 class="mb-1">'+itemText["category_name"]+'</h6></div></div></div></li>';
                    } else {
                      var stateNum = Math.floor(Math.random() * 6);
                      var states = ['success', 'danger', 'warning', 'info', 'dark', 'primary', 'secondary'];
                      var $state = states[stateNum],
                      $name = itemText["category_name"],
                      $initials = $name.match(/\b\w/g) || [];
                      $initials = (($initials.shift() || '') + ($initials.pop() || '')).toUpperCase();
                      var $output = '<span class="avatar-initial rounded-2 bg-label-' + $state + '">' + $initials + '</span>';

                      liElement = '<li class="mb-4"><div class="d-flex align-items-center"><div class="d-flex align-items-center"><div class="avatar me-2">'+$output+'</div><div class="me-2"><h6 class="mb-1">'+itemText["category_name"]+'</h6></div></div></div></li>';
                    }
                      categoriesShow.innerHTML += liElement;
                  });

                    
                }
            }
          }

          $.ajax({
            url: productsApi+"?brand_id="+brandId,
            type: 'GET',
            dataType: 'json', // added data type
            success: function(data) {
        
              if (dt_product_table.length) {
                var dt_products = dt_product_table.DataTable({
                  data: data.data,
                  columns: [
                    // columns according to JSON
                    // { data: 'product_id' },
                    // { data: 'product_id' },
                    { data: 'product_name' },
                    { data: 'category_id' },
                    { data: 'brand_name' },
                    { data: 'weight' },
                    { data: 'price' },
                    { data: 'quantity' },
                    { data: 'status' },
                    { data: '' }
                  ],
                  columnDefs: [
                    // {
                    //   // For Responsive
                    //   className: 'control',
                    //   searchable: false,
                    //   orderable: false,
                    //   responsivePriority: 2,
                    //   targets: 0,
                    //   render: function (data, type, full, meta) {
                    //     return '';
                    //   }
                    // },
                    // {
                    //   // For Checkboxes
                    //   targets: 1,
                    //   orderable: false,
                    //   checkboxes: {
                    //     selectAllRender: '<input type="checkbox" class="form-check-input">'
                    //   },
                    //   render: function () {
                    //     return '<input type="checkbox" class="dt-checkboxes form-check-input" >';
                    //   },
                    //   searchable: false
                    // },
                    {
                      // Product name and brand_name
                      targets: 0,
                      responsivePriority: 1,
                      render: function (data, type, full, meta) {
                        var $name = full['product_name'],
                          $id = full['product_id'],
                          $brand_name = full['brand_name'];
                          
                          if(typeof(full['product_images']) !== 'undefined' && full['product_images'] != null)
                            var $image = full['product_images'][0];
                          else 
                            var $image = "";
                        if ($image) {
                          // For Product image
        
                          var $output =
                            '<img src="' +
                            $image +
                            '" alt="Product-' +
                            $id +
                            '" class="rounded-2">';
                        } else {
                          // For Product badge
                          var stateNum = Math.floor(Math.random() * 6);
                          var states = ['success', 'danger', 'warning', 'info', 'dark', 'primary', 'secondary'];
                          var $state = states[stateNum],
                            $name = full['brand_name'],
                            $initials = $name.match(/\b\w/g) || [];
                          $initials = (($initials.shift() || '') + ($initials.pop() || '')).toUpperCase();
                          $output = '<span class="avatar-initial rounded-2 bg-label-' + $state + '">' + $initials + '</span>';
                        }
                        // Creates full output for Product name and brand_name
                        var $row_output =
                          '<div class="d-flex justify-content-start align-items-center product-name">' +
                          '<div class="avatar-wrapper me-3">' +
                          '<div class="avatar rounded-3 bg-label-secondary">' +
                          $output +
                          '</div>' +
                          '</div>' +
                          '<div class="d-flex flex-column">' +
                          '<span class="text-nowrap text-heading fw-medium" title="'+$name+'">' +
                          $name.slice(0, 20) +
                          '</span>' +
                          '<small class="text-truncate d-none d-sm-block">' +
                          $brand_name +
                          '</small>' +
                          '</div>' +
                          '</div>';
                        return $row_output;
                      }
                    },
                    {
                      // Product Category
        
                      targets: 1,
                      responsivePriority: 2,
                      render: function (data, type, full, meta) {
                          // var $category = categoryObj[full['category']].title;
                          // var categoryBadgeObj = {
                          //   Household:
                          //     '<span class="avatar-sm rounded-circle d-flex justify-content-center align-items-center bg-label-warning me-3"><i class="ri-home-6-line"></i></span>',
                          //   Office:
                          //     '<span class="avatar-sm rounded-circle d-flex justify-content-center align-items-center bg-label-success me-3"><i class="ri-briefcase-line"></i></span>',
                          //   Electronics:
                          //     '<span class="avatar-sm rounded-circle d-flex justify-content-center align-items-center bg-label-primary me-3"><i class="ri-smartphone-line"></i></span>',
                          //   Shoes:
                          //     '<span class="avatar-sm rounded-circle d-flex justify-content-center align-items-center bg-label-info me-3"><i class="ri-footprint-line"></i></span>',
                          //   Accessories:
                          //     '<span class="avatar-sm rounded-circle d-flex justify-content-center align-items-center bg-label-secondary me-3"><i class="ri-headphone-line"></i></span>',
                          //   Game: '<span class="avatar-sm rounded-circle d-flex justify-content-center align-items-center bg-label-dark me-3"><i class="ri-gamepad-line"></i></span>'
                          // };
                          var $category = full['category_name'];
                          var $image = "";
                          var $id = full['product_id']
                          if(full['category_image'] != "")
                            $image = full['category_image'];
        
                          if ($image) {
                            // For Category image
                            var $output =
                              '<img src="' +
                              $image +
                              '" alt="Product-' +
                              $id +
                              '" class="rounded-2">';
                          } else {
                            // For Category badge
                            var stateNum = Math.floor(Math.random() * 6);
                            var states = ['success', 'danger', 'warning', 'info', 'dark', 'primary', 'secondary'];
                            var $state = states[stateNum],
                              $name = full['category_name'],
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
                          '<small class="text-truncate d-none d-sm-block">' +
                          $category +
                          '</small>' +
                          '</div>' +
                          '</div>';
        
                          return $row_output;
        
                      }
                    },
                    {
                      // Stock
                      targets: 2,
                      orderable: false,
                      responsivePriority: 3,
                      render: function (data, type, full, meta) {
                        // var $stock = full['stock'];
                        // var stockSwitchObj = {
                        //   Out_of_Stock:
                        //     '<label class="switch switch-primary switch-sm">' +
                        //     '<input type="checkbox" class="switch-input" id="switch">' +
                        //     '<span class="switch-toggle-slider">' +
                        //     '<span class="switch-off">' +
                        //     '</span>' +
                        //     '</span>' +
                        //     '</label>',
                        //   In_Stock:
                        //     '<label class="switch switch-primary switch-sm">' +
                        //     '<input type="checkbox" class="switch-input" checked="">' +
                        //     '<span class="switch-toggle-slider">' +
                        //     '<span class="switch-on">' +
                        //     '</span>' +
                        //     '</span>' +
                        //     '</label>'
                        // };
                        return (
                          "<span class='text-truncate'>" +
                          full['brand_name'] +
                          '<span class="d-none">' +
                          full['brand_name'] +
                          '</span>' +
                          '</span>'
                        );
                      }
                    },
                    {
                      // weight
                      targets: 3,
                      responsivePriority: 4,
                      render: function (data, type, full, meta) {
                        var $weight = full['weight'];
        
                        return '<span>' + $weight + '</span>';
                      }
                    },
                    {
                      // price
                      targets: 4,
                      responsivePriority: 5,
                      render: function (data, type, full, meta) {
                        var $price = full['price'];
        
                        return '<span>' + $price + '</span>';
                      }
                    },
                    {
                      // quantity
                      targets: 5,
                      responsivePriority: 6,
                      render: function (data, type, full, meta) {
                        var $quantity = full['quantity'];
        
                        return '<span>' + $quantity + '</span>';
                      }
                    },
                    {
                      // Status
                      targets: -2,
                      render: function (data, type, full, meta) {
                        let $is_active = full['is_active'];
                        let $returnValue = "";
        
                        let $calss = $is_active == "Active" ? "bg-label-success" : "bg-label-danger";
                        $returnValue += 
                            '<span class="badge rounded-pill ' +
                              $calss +
                            '" text-capitalized>' +
                              $is_active +
                            '</span>'
                          ;
        
                        let $is_featured = full['is_featured'];
                        if($is_featured == "Featured") {
                          $returnValue += '<br><span class="badge rounded-pill bg-label-info mt-2 text-capitalized">Featured</span>';
                        }
                        
                        return $returnValue;
                        
                        // return (
                        //   '<span class="badge rounded-pill ' +
                        //   statusObj[$status].class +
                        //   '" text-capitalized>' +
                        //   statusObj[$status].title +
                        //   '</span>'
                        // );
                      }
                    },
                    {
                      // Actions
                      targets: -1,
                      title: 'Actions',
                      searchable: false,
                      orderable: false,
                      render: function (data, type, full, meta) {
                        
                        let actionbutton = "";
                        if(full['is_active'] == "Active")
                          actionbutton = '<a onclick="productStatusUpdate('+full["product_id"]+',0)"  href="javascript:0;" class="dropdown-item">Deactive</a>';
                        if(full['is_active'] == "Deactive")
                          actionbutton = '<a onclick="productStatusUpdate('+full["product_id"]+',1)"  href="javascript:0;" class="dropdown-item">Active</a>';
                        
                        let featuredButton = "";
                        if(full['is_featured'] == "Featured")
                          featuredButton =  '<a onclick="featuredProduct('+full["product_id"]+',0)"  href="javascript:0;" class="dropdown-item text-danger">Remove Featured</a>';
                        if(full['is_featured'] == "")
                            featuredButton = '<a onclick="featuredProduct('+full["product_id"]+',1)"  href="javascript:0;" class="dropdown-item text-success">Add Featured</a>';
        
                        return (
                          '<div class="d-inline-block text-nowrap">' +
                          '<button type="button" class="btn btn-sm btn-icon btn-text-secondary waves-effect waves-light rounded-pill me-50" onclick="window.location.href=\'edit_product?id='+full["product_id"]+'\'"><i class="ri-edit-box-line ri-20px"></i></button>' +
                          '<button class="btn btn-sm btn-icon btn-text-secondary waves-effect waves-light rounded-pill dropdown-toggle hide-arrow" data-bs-toggle="dropdown"><i class="ri-more-2-line ri-20px"></i></button>' +
                          '<div class="dropdown-menu dropdown-menu-end m-0">' +
                          // '<a href="javascript:0;" class="dropdown-item">View</a>' +
                          actionbutton +
                          featuredButton +
                          '</div>' +
                          '</div>'
                        );
                      }
                    }
                  ],
                  order: [2, 'asc'], //set any columns order asc/desc
                  dom:
                      '<"card-header d-flex border-top rounded-0 flex-wrap pb-md-0 pt-0"' +
                      '<"me-5 ms-n2"f>' +
                      '<"d-flex justify-content-start justify-content-md-end align-items-baseline"<"dt-action-buttons d-flex align-items-start align-items-md-center justify-content-sm-center gap-4"lB>>' +
                      '>t' +
                      '<"row mx-1"' +
                      '<"col-sm-12 col-md-6"i>' +
                      '<"col-sm-12 col-md-6"p>' +
                      '>',
                  lengthMenu: [7, 10, 20, 50, 70, 100], //for length of menu
                  language: {
                    sLengthMenu: '_MENU_',
                    search: '',
                    searchPlaceholder: 'Search',
                    info: 'Displaying _START_ to _END_ of _TOTAL_ entries',
                    paginate: {
                      next: '<i class="ri-arrow-right-s-line"></i>',
                      previous: '<i class="ri-arrow-left-s-line"></i>'
                    }
                  },
                  // Buttons with Dropdown
                  buttons: [
                    {
                      extend: 'collection',
                      className: 'btn btn-outline-secondary dropdown-toggle me-4 waves-effect waves-light d-none',
                      text: '<i class="ri-upload-2-line ri-16px me-2"></i><span class="d-none d-sm-inline-block">Export </span>',
                      buttons: [
                        {
                          extend: 'print',
                          text: '<i class="ri-printer-line me-1" ></i>Print',
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
                                  if (item.classList !== undefined && item.classList.contains('product-name')) {
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
                                  if (item.classList !== undefined && item.classList.contains('product-name')) {
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
                                  if (item.classList !== undefined && item.classList.contains('product-name')) {
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
                                  if (item.classList !== undefined && item.classList.contains('product-name')) {
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
                                  if (item.classList !== undefined && item.classList.contains('product-name')) {
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
                    // {
                    //   text: '<i class="ri-add-line ri-16px me-0 me-sm-2 align-baseline"></i><span class="d-none d-sm-inline-block">Add Product</span>',
                    //   className: 'add-new btn btn-primary waves-effect waves-light',
                    //   action: function () {
                    //     window.location.href = productAdd;
                    //   }
                    // }
                  ],
                  // For responsive popup
                  responsive: {
                    details: {
                      display: $.fn.dataTable.Responsive.display.modal({
                        header: function (row) {
                          var data = row.data();
                          return 'Details of ' + data['product_name'];
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
                                '<td>' +
                                col.title +
                                ':' +
                                '</td> ' +
                                '<td>' +
                                col.data +
                                '</td>' +
                                '</tr>'
                            : '';
                        }).join('');
        
                        return data ? $('<table class="table"/><tbody />').append(data) : false;
                      }
                    }
                  },
                });
                $('.dt-action-buttons').addClass('pt-0');
                $('.dt-buttons').addClass('d-flex flex-wrap');
              }
        
        
            }
          });
        

      }
    });
});
