// ADD ERRROS
var name, errors;
function create_error(val){
	return "<li class='parsley-required'>" + val + "</li>";
}

function how_many_errors_user_did(value){
	allErrors = "";
	$.each(value, function(index, val){
		allErrors += create_error(val);
	});
	return allErrors;
}

function add_error(){
	$.each(errors, function(key, value) {
		if(value.length > 0){
			finder = "[name='" + name + "[" + key + "]']"
		    inpt = $(":input" + finder);

		    par = inpt.parents(".form-field");
		    inpt.attr("style", "border: 3px solid #da4242;");
			// HTML starts here
			// Test if element exists and it's not a hidden element
			if(inpt.length && inpt.attr("type") != "hidden"){ 
				span = "<span class='glyphicon glyphicon-remove form-control-feedback'></span>";
				ul = "<ul id='parsley-id-4' class='parsley-errors-list filled'>";
				ul += how_many_errors_user_did(value);
			    ul += "</ul>";

				par.append(span, ul); // Appends content
			}
		}
	});
}

function get_errors(){
   	name = $(".page-errors").data("name");
  	errors = $(".page-errors").data("errors");
  	$(".page-errors").remove();
}

// TEXTDESC DYNAMIC DATA
function initialize_text(){
	clases = $(".static-data").data("attributes")
	clases.forEach(function(item, i){
		className = item["classname"];
		finder = $("." + className);
		if(finder.length > 0){
			finder.append(item["description"]);
		}
	})
	$(".static-data").remove();
}

// ANCHOR INSTEAD OF BUTTON SUBMIT
function sign_up(){
	$('#new_boy').submit();
	return false;
}

function check_form_registration(){
	$.ajax({
		async: true,
		dataType: "json",
		method: "GET",
		data: $('#new_boy').serialize(), 
		url: "/index/check_boy",
		success: function(data){
			if(data){
				$(".parsley-errors-list").remove();
				errors = data;
				add_error();
			}
			else{
				sign_up();
			}
		}
	})
}

/* INDEX VIDEO */
function set_bg_video_height() {
	$(".bg-video").css("height", $(window).height());
}

function set_image_slider() {
	$(".item-slider").css("width", String($(window).width() / 3) + "px");
}

$(window).on("load", function(){
	$('body').on('click', 'a', function(e){
		if( $(this).attr('href')=='' || $(this).attr('href')=='#')
			e.preventDefault();
	})

	initialize_text();
})

