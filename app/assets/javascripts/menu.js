$(document).ready(function() {

$("#menu_mekan_id").on("change", function(){
	$("#menu_ogun_id").empty();

	$.ajax({    
    url: '/mekans/'+$(this).val()+'/get_restoran_ogun',    
    type: 'post',    
    dataType: 'json',    
    contentType: 'application/json',    
    ifModified:true,    
    cache: false,    
    statusCode: {    
        200: function(data) { 
         var items = "";
          $.each( data, function( key, val ) {
            items += "<option value='" + val.id + "'>" + val.isim + "</option>";
          });

          $(items).appendTo( "#menu_ogun_id" );
        }    
    },    

    complete: function (xhr, status) {    
        console.log(xhr.status); // 200 
        }    
    });    
});



});
