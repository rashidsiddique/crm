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
    },
    error: function (xhr, status){
      alert(xhr.error);
    }
  });
}  