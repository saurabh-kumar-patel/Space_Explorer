jQuery(function($){
	$('#before-after-image img').css({padding:0});
	
	$('#before-after-image').beforeAfter({
		imagePath:'/resources/misc/',
		animateIntro : true,
		introDelay : 2000,
		showFullLinks : false
	});
});

$(document).ready(function(){
	//lazy load youtube iframe
	var video_wrapper = $('.youtube-video-place');
	//  Check to see if youtube wrapper exists
	if(video_wrapper.length){
		// If user clicks on the video wrapper load the video.
		$('.play-youtube-video').on('click', function(){
			/* Dynamically inject the iframe on demand of the user.
			 Pull the youtube url from the data attribute on the wrapper element. */
			video_wrapper.html('<iframe allowfullscreen frameborder="0" class="embed-responsive-item" src="' + video_wrapper.data('yt-url') + '"></iframe>');
		});
	}
	
	//to make the referral icons go up and down, like on all about Mars
	$(".otherResourceContentHolder").mouseover(function(){
		$(this).stop().animate({ 'marginTop': '-5px'}, 200);
	});
	
	$(".otherResourceContentHolder").mouseout(function(){
		$(this).stop().animate({ 'marginTop': '0px'}, 200);
	});
	
	$(".definition").each(function(){
		var word = $(this);
	});
	
	$(".definition").click(function(){
		var word = $(this);
		
		if(parseInt(word.attr("clicked")) == 0){
			resetDefinitions();
			word.append("<div class='definitionText'>" + word.attr("definitiontext") + "</div>");
			var newWidth = parseInt(word.parent().width()) - 26;//subtract out padding and border
			$(".definitionText").width(newWidth);
			$(".definitionText").append("<div class='definitionTextPointer'></div>");
			if(word.closest("#main").length > 0){//check if in main content
				$(".definitionTextPointer").css({left:word.position().left});
			}else{//must be in sidebar
				$(".definitionTextPointer").css({left:word.position().left - $("#main").width()});
			}
			
			word.attr("clicked", "1");
		}else{
			$(".definitionText").remove();
			word.attr("clicked", "0");
		}
	});
	
	$(".planetdefinition").each(function(){
		var word = $(this);
	});
	
	$(".planetdefinition").click(function(){
		var word = $(this);
		
		if(parseInt(word.attr("clicked")) == 0){
			resetplanetDefinitions();
			word.parent().parent().append("<div class='planetdefinitionText'>" + word.attr("definitiontext") + "</div>");
			var newWidth = parseInt(word.parent().parent().width()) - 26;//subtract out padding and border
			$(".planetdefinitionText").width(newWidth);
			$(".planetdefinitionText").css("top", word.offset().top);
			$(".planetdefinitionText").append("<div class='planetdefinitionTextPointer'></div>");
			if(word.closest("#main").length > 0){//check if in main content
				$(".planetdefinitionTextPointer").css({left:word.position().left});
			}else{//must be in sidebar
				$(".planetdefinitionTextPointer").css({left:word.position().left - $("#main").width()});
			}
			
			word.attr("clicked", "1");
		}else{
			$(".planetdefinitionText").remove();
			word.attr("clicked", "0");
		}
	});
	
	$(".planetdefinition").hover(function(){//hover in
		var word = $(this);
		
		if(parseInt(word.attr("clicked")) == 0){
			resetplanetDefinitions();
			word.parent().parent().append("<div class='planetdefinitionText'>" + word.attr("definitiontext") + "</div>");
			var newWidth = parseInt(word.parent().parent().width()) - 26;//subtract out padding and border
			$(".planetdefinitionText").width(newWidth);
			$(".planetdefinitionText").css("top", word.offset().top);
			$(".planetdefinitionText").append("<div class='planetdefinitionTextPointer'></div>");
			if(word.closest("#main").length > 0){//check if in main content
				$(".planetdefinitionTextPointer").css({left:word.position().left});
			}else{//must be in sidebar
				$(".planetdefinitionTextPointer").css({left:word.position().left - $("#main").width()});
			}
			
			word.attr("clicked", "1");
		}else{
			
		}
	}, function(){//hover out
		var word = $(this);
		
		if(parseInt(word.attr("clicked")) == 0){
			
		}else{
			$(".planetdefinitionText").remove();
			word.attr("clicked", "0");
		}
	});
	
	//featured filter stuff for menu pages
	$(".featButton").click(function(){
		if(!$(this).hasClass("selected")){
			$(".featButton").removeClass("selected");
			$(".featBigButton").removeClass("bigButtonSelected");
			$(this).addClass("selected");
			//var filterWord = $(this).text().toLowerCase().replace(/ /g, "-");
			var filterWord = $(this).attr("tag");
			$(".content li").stop().hide();
			
			var delay = 100;
			var i = 0;
			$(".content li").each(function(){
				if(filterWord != "everything"){
					var articleTags = $(this).attr("tags");
					if(articleTags){
						var tagsArray = articleTags.split(" ");
						
						if(tagsArray.indexOf(filterWord)>=0){
							$(this).delay(delay*i).fadeIn();
							i++;
						}
					}
				}else{
					$(this).delay(delay*i).fadeIn();
					i++;
				}
			});
			
		}
	});
	
	$(".featBigButton").click(function(){
		if(!$(this).hasClass("bigButtonSelected")){
			$(".featButton").removeClass("selected");
			$(".featBigButton").removeClass("bigButtonSelected");
			$(this).addClass("bigButtonSelected");
			var filterWord = $(this).attr("tag");
			$(".content li").stop().hide();
			
			var delay = 100;
			var i = 0;
			$(".content li").each(function(){
				var articleTags = $(this).attr("tags");
				if(articleTags){
					var tagsArray = articleTags.split(" ");
					
					if(tagsArray.indexOf(filterWord)>=0){
						$(this).delay(delay*i).fadeIn();
						i++;
					}
				}
			});
		}
	});
	
});


function resetDefinitions(){
	$(".definitionText").each(function(){
		$(this).remove();
	});
	
	$(".definition").each(function(){
		$(this).attr("clicked", "0");
	});
}

function resetplanetDefinitions(){
	$(".planetdefinitionText").each(function(){
		$(this).remove();
	});
	
	$(".planetdefinition").each(function(){
		$(this).attr("clicked", "0");
	});
}




		
		
