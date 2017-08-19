$(document).on('turbolinks:load load', function() {

	$(function() {
		$('.menubutton, .mob-menu').on('click', function(e) {
			e.preventDefault();
			$('ul').stop().slideToggle();			
		});
	})

	$('.menubutton, .mob-menu').click(function() {
		$('.bar').toggleClass('open');
		$('.dropdown-nav-links').stop().slideToggle('open');
	});

});