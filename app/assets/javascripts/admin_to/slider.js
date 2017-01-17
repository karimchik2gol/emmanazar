	curVal=0;
	left=true;
	right=false;
	start=true;
	$(".lastProductsControlLeft").click(function(){
		if(start){
			start=false;

			//DIRECTION
			if(left){
				$(".lastProductsControlRight").removeAttr("style");
				right=true;
				curVal-=205;
			}

			if(curVal==-1025){
				$(".lastProductsControlLeft").css("color", "#736868");
				left=false;
			}

			slide();
		}
	});

	$(".lastProductsControlRight").click(function(){
		if(start){
			start=false;

			//DIRECTION
			if(right){
				$(".lastProductsControlLeft").removeAttr("style");
				left=true;
				curVal+=205;
			}

			if(curVal==0){
				$(".lastProductsControlRight").css("color", "#736868");
				right=false;
			}

			slide();
		}
	});

	function slide(){
		$(".wrapItemLastProducts").animate({
			"left":curVal
		}, 500);
		setTimeout(function(){
			start=true
		}, 500);
	}