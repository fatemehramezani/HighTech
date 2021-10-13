$(function(){
	

	
	// services
	if ($('.services-list').size() > 0) {
		$('.services-list').accordion({
			autoHeight: false,
			create: function (event, ui) {
				$('.services-list li:first h2 span').addClass('active');
			},
			changestart: function (event, ui) {
				ui.oldHeader.children('span').animate({ 'left' : 850 }, function () {
					$(this).removeClass('active').animate({ 'left' : 889 });
				});
				ui.newHeader.children('span').stop(true, true).animate({ 'left' : 850 }, function () {
					$(this).addClass('active').animate({ 'left' : 889 });
					//$(this).stop(true, true).animate({ 'left' : 889 });
				});
				return true;
			},
			change: function (event, ui) {
				
				return true;
			}
		});
	}
	
	});