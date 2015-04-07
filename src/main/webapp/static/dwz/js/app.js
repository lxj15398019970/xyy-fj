$(function() {
	$('.page-sidebar-menu').on('click','li > a',function(e) {
				var parent = $(this).parent().parent();
				parent.children('li.open').children('a').children('.arrow').removeClass('open');

				parent.children('li.open').children('.sub-menu').slideUp(200);
				parent.children('li.open').removeClass('open');
				var sub = $(this).next();

				if (sub.is(":visible")) {
					$('.arrow', $(this)).removeClass("open");
					$(this).parent().removeClass("open");
					sub.slideUp(200);
				} else {
					$('.arrow', $(this)).addClass("open");
					$(this).parent().addClass("open");
					sub.slideDown(200);
				}

				e.preventDefault();
			});

	$('.page-sidebar').on('click', 'ul ul li > a', function(e) {
		e.preventDefault();

		var menuContainer = $('.page-sidebar ul');
		menuContainer.children('li.active').removeClass('active');
		menuContainer.children('arrow.open').removeClass('open');



		$(this).parents('li').each(function() {
			$(this).addClass('active');
			$(this).children('a > span.arrow').addClass('open');
		});
		$(this).parents('li').addClass('active');
	});


	$('.page-sidebar-menu .sider-menu').each(function(i){
		$(this).on('click',function(){
			$('li.top-menu:eq('+ i +')').addClass('selected').siblings().removeClass('selected');
		})
	})


});


