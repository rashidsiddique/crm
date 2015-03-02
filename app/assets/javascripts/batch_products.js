function submitBatch(){
  var batch = {};
  batch['products'] = []
  $('.form-batch').each(function(){
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
        var output="<ul>";
        for (var i in response.errors) {
            output+="<li>" + response.errors[i] +"</li>";
        }
        output+="</ul>";
        document.getElementById("errors").innerHTML=output;
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

function addNewCategory() {
  $('.product_category').hide();
  $('.add_new_category').hide();
  $('.save-category').show();
}

function saveCategory() {
  var new_category = $("#new-category-field").val();
  alert(new_category)
  $.ajax({
      url: "/admins/categories",
      type:"POST",
      data: {"category": {"name": new_category}},
      success: function(data) {
          console.log(data);
      }
  });
}      