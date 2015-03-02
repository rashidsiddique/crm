function submitBatch(){
  var batch = {};
  batch['products'] = []
  $('.form-batch').each(function(){
    console.log(this);
    jQuery.validator.messages.required = "";
    $(this).validate({
      rules: {
        "product[name]": {
        required: true
        },
        "product[description]": {
        required: true,
        },
        "product[price]": {
        required: true
        },
        "product[category_ids]": {
        required: true
        }
      },  
      highlight: function(element) {
        $(element).removeClass('label.error').addClass('form-error');
      },
    });
    $(this).valid();

    var list = $(this).serializeJSON();
    batch['products'].push(list);
  });
  $.ajax({
    url:'validate_batch',
     type:"POST",
     dataType:'json',
     data: batch,
     processData: true,
    success: function (response){
      if (response.success == false){ 
      }
      else{
        $.ajax({
          url:'/admins/products/',
           type:"POST",
           dataType:'json',
           data: batch,
           processData: true,
          success: function (response){ 
            window.location.href = '/admins/products/';
          },
          error: function (xhr, status){
            alert(xhr.error);
          }
        });
      }

    },
    error: function (xhr, status){
      alert(xhr.error);
    }
  });
}

function addNewCategory(add_new) {
  $(add_new).parent('.product_category').hide();
  $(add_new).parent('.add_new_category').hide();
  $(add_new).parent().siblings('.save-category').show();
}

function saveCategory() {
  var new_category = $("#new-category-field").val();
  $.ajax({
      url: "/admins/categories",
      type:"POST",
      data: {"category": {"name": new_category}},
      success: function(data) {
      }
  });
}      