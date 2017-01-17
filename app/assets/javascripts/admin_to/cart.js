function buyItem(th, id, optionQuantity){
		th=jQuery(th);
    checkIfCartIsEmpty=$(".cartLabel").text().indexOf("(")==-1

		if(optionQuantity)
      optionQuantity=th.parents(".product").find("input").val();
    else
			optionQuantity=null;

    //SHOW POPUP
    $(".popup").show();
    $(".successfulCart").show();

		$.ajax({
              async: true,
              type: "GET",
              url: "/index/addToCart",
              data: {"id":id, "quantity":optionQuantity},
              success: function(data){
              	$(".cart").remove();
              	$(".cartWrapInfoSecond").prepend(data);
                setTimeout(hideSuccessfulPopup, 1500);
                setTimeout(function(){showCart(2000)}, 1500);

              }
            });
	}

  function hideSuccessfulPopup(){
    $(".popup").hide();
    $(".successfulCart").hide();
  }

	function clearCart(){
		$.ajax({
              async: true,
              type: "GET",
              url: "/index/removeCart",
              success: function(data){
              	$(".cart").remove();
                $(".cartWrapInfoSecond").prepend(data);
              }
            });
	}

	function changeQuantity(th, id){
		th=jQuery(th);
		removeOrChangeQuantity(th.val(), id);
	}

	function removeItem(th, id){
		removeOrChangeQuantity(0, id);
	}

  function showCart(time){
    $(".cartContainer").show();
    setTimeout(function(){
      $(".cartContainer").attr("style", "");
    }, time)
  }
	function removeOrChangeQuantity(quantity, id){
		$.ajax({
              async: true,
              type: "GET",
              url: "/index/changeQuantity",
              data: {"id":id, "quantity": quantity},
              success: function(data){
              	$(".cart").remove();
              	$(".cartWrapInfoSecond").prepend(data);
                showCart(500);
              }
            });
	}