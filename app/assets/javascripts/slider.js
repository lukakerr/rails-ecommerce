$(document).on('turbolinks:load load', function() {

	clearInterval(interval);

 	var numberofImgs = $(".image-gallery-links > a").length;
	var currentImgNumber = 1;
	var nextImgNumber = currentImgNumber + 1;
	var previousImgNumber = numberofImgs;
	var randomImgNumber = 3;
	var currentImg = $('.image-gallery div img:nth-of-type(' + currentImgNumber + ')'); 
	var nextImg = $('.image-gallery div img:nth-of-type(' + nextImgNumber + ')'); 
	var previousImg = $('.image-gallery div img:nth-of-type(' + previousImgNumber + ')');
	var randomImg = $('.image-gallery div img:nth-of-type(' + randomImgNumber + ')');
   
	function loadImg() {
		currentImg.fadeTo("slow", 1);
	}
   
	function nextImgFade() {
		currentImg.fadeTo("slow", 0);
		nextImg.fadeTo("slow", 1);
	}
   
	function previousImgFade() {
		currentImg.fadeTo("slow", 0);
		previousImg.fadeTo("slow", 1);
	}
   
	function randomImgFade() {
		currentImg.fadeTo("slow", 0);
		randomImg.fadeTo("slow", 1);
	}
   
	function boldText() {
		$('.image-gallery-links a').each(function(){
			var currentHref = $(this).attr('href');
			if (currentImgNumber == currentHref) {
				$(this).css("font-weight", "600");
			} else {
				$(this).css("font-weight", "200");
			}
		});
	}
   
	function imgLoop() {
		if (currentImgNumber == 1) {
			nextImgNumber = currentImgNumber + 1;
			previousImgNumber = numberofImgs;
		} else if (currentImgNumber == numberofImgs) {
			nextImgNumber = 1;
			previousImgNumber = currentImgNumber - 1;
		} else {
			nextImgNumber = currentImgNumber + 1;
			previousImgNumber = currentImgNumber - 1;
		}
	}
   
	function refreshImgs() {
		currentImg = $('.image-gallery div img:nth-of-type(' + currentImgNumber + ')'); 
		nextImg = $('.image-gallery div img:nth-of-type(' + nextImgNumber + ')'); 
		previousImg = $('.image-gallery div img:nth-of-type(' + previousImgNumber + ')');
		randomImg = $('.image-gallery div img:nth-of-type(' + randomImgNumber + ')');
	}
   
	function callFunctions() {
		boldText();
		imgLoop();
		refreshImgs();
	}

	function restartInterval() {
		clearInterval(interval);
		interval = setInterval(loopImages, 5000);
	}

	function loopImages() {
		$(".next-banner").trigger("click");
	}
   
	$('.image-gallery-links a').click(function() {
		randomImgNumber = parseInt($(this).attr('href'));
		randomImg = $('.image-gallery div img:nth-of-type(' + randomImgNumber + ')');
		randomImgFade();
		currentImgNumber = randomImgNumber;
		callFunctions();
		return false;
	});
   
	$('#previous').click(function() {
		restartInterval();
		previousImgFade();
		currentImgNumber = previousImgNumber;
		callFunctions();
	});
   
	$('#next, .next-banner').click(function() {
		restartInterval();
		nextImgFade();
		currentImgNumber = nextImgNumber;
		callFunctions();
	});

	boldText();
	loadImg();

	$("#previous").height($(".slider").height());
	$("#next").height($(".slider").height());

	$(window).on('resize load', function() {
		$("#previous").height($(".slider").height());
		$("#next").height($(".slider").height());
	});

	var interval = setInterval(loopImages, 5000);

	$(".banner-image-gallery-links").width(parseInt($(".image-gallery-links > a").length)*34);

});