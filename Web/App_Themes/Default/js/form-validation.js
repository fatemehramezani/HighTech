//POSHYTIP
jQuery(document).ready(function($) { 
    $('.form-poshytip').poshytip({
		className: 'tip-yellowsimple',
		showOn: 'focus',
		alignTo: 'target',
		alignX: 'left',
		alignY: 'center',
		offsetX: 5
	});		
});
//POSHYTIP END



jQuery(document).ready(function($) {

	// hide messages 
	$("#error").hide();
	$("#success").hide();
	
	// on submit...
	$("#contactForm #submit").click(function() {
		$("#error").hide();
		
		//required:
		
	    //title
		var name = $("input#title").val();
		if (name == "") {
		    $("#error").fadeIn().text("عنوان پیام خود را وارد کنید");
		    $("input#title").focus();
		    return false;
		}

		//name
		var name = $("input#name").val();
		if(name == ""){
			$("#error").fadeIn().text("نام خود را وارد کنید");
			$("input#name").focus();
			return false;
		}
		
		// email
		var email = $("input#email").val();
		if(email == ""){
			$("#error").fadeIn().text("پست الکترونیکی خود را وارد کنید");
			$("input#email").focus();
			return false;
		}
			
		
		// comments
		var comments = $("textarea#comments").val();
		if(comments == ""){
			$("#error").fadeIn().text("لطفا پیغام خود را بنویسید");
			$("textarea#comments").focus();
			return false;
		}					
	});  
				
    return false;
});

