var access_to_scroll = true;
var $top;
set_bg_video_height();
get_errors();
	add_error();
set_image_slider();

$(window).on('resize', function() {
	set_bg_video_height();
})

//get some global vars
window.parRatio = 6;

$(window).scroll(function(){
/*	scrollPos = $(window).scrollTop();
	if(scrollPos > 1 && access_to_scroll){
		$top = "-100%";
		access_to_scroll = false;
		$("header").animate({
			"opacity": 0
		}, 500);
	}
	if(scrollPos < 2 && !access_to_scroll) {
		$top = "0%";
		access_to_scroll = true;
		$("header").animate({
			"opacity": 1
		}, 500);
	}

	setTimeout(function(){
		$(".bg-video").css("top", $top)
	}, 100);*/
})

$(".hidden-image-slider img").each(function(index, val){
	th = $(this);
	par = th.parent();
	if(th.width() > th.height()) {
		width = "auto";
		height = "100%";
		min = "min-width";
	}
	else {
		width = "100%";
		height = "auto";
		min = "min-height";
	}
	th.css({"width": width, "height": height});
	th.css(min, "100%");
})