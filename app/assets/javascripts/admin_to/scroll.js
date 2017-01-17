page=2;
	accessToRefresh=true;
	$(window).scroll(function() {
	   if($(window).scrollTop()>= $(".itemListProduct").last().position().top-340 && accessToRefresh) {
	   	   accessToRefresh=false;
         category_id=$(".listOfProducts").data("category-id");
         type_id=$(".listOfProducts").data("type-id");

	       $.ajax({
              async: true,
              type: "GET",
              url: "/index/uploadNewProduct",
              data: {"page":page, "category":category_id, "type":type_id},
              success: function(data){
                $(".listOfProducts").append(data);
                accessToRefresh=true;
                if(data)
                  page++;
              }
            });
	   }
	});

	$(".selectSortProduct").change(function(){
		sort=$(this).val();
    category_id=$(".listOfProducts").data("category-id");
    type_id=$(".listOfProducts").data("type-id");

		$.ajax({
              async: true,
              type: "GET",
              url: "/index/sortProduct",
              data: {"page":page-1, "sort":sort, "category":category_id, "type":type_id},
              success: function(data){
              	$(".listOfProducts").empty();
                $(".listOfProducts").append(data);
              }
            });
	});