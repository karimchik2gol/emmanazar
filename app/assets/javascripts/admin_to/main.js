$(document).ready(function(){
	$('body').on('click', 'a', function(e){
		href = $(this).attr('href');
  		if(href == '' || href == '#')
  			e.preventDefault();
  	});

	$(".showAllCategories a").click(function(e){
		e.preventDefault();
		text=$(this).text();
		item=$(this).parents(".categoryBlockIndex").find(".itemCategory");

		if(text.indexOf("Показать")==-1){
			item.removeAttr("style");
			str="Показать все категории";
		}
		else{
			item.attr("style", "display: inline-block;");
			str="Скрыть категории";
		}
		$(this).text(str);
	});

	$('.wrap-chat').slimScroll({
		width: '98%',
	    height: '300px',
	    size: '7px',
	    position: 'right',
	    alwaysVisible: true,
	    start: 'bottom',
	    railVisible: true,
	    railColor: '#222',
	    railOpacity: 0.3,
	    wheelStep: 10,
	    allowPageScroll: false,
	    disableFadeOut: false
	});

	$(".submit-message").click(function(e){
		e.preventDefault();
		mes = $('.message-val');
		th = $(this);

		$.ajax({
		    type: 'POST',
		    beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
		    url: '/admin/subjects/' + th.data("subject-id") +'/postmessage',
		    data: {"message": mes.val()},
		    success: function(data, textStatus, xhr) {
		    	mes.val("");
		    	$(".wrap-chat").append(data);
		    }
	  	});
	});
})