
	jQuery(function($){
  	
  	$(".top_blog_tag_link").click(function(){
      var tag_s_id = $(this).attr("id"); 
      location.href = 'http://suito.com/'+tag_s_id;
    });
		
		$('input[name="header_date"]').daterangepicker({
			autoUpdateInput: false,
			locale: {
          cancelLabel: 'Clear'
      }
		});
		
		$('input[name="header_date"]').on('apply.daterangepicker', function(ev, picker) {
      $(this).val(picker.startDate.format('YYYY/MM/DD') + ' - ' + picker.endDate.format('YYYY/MM/DD'));
      $("#HeaderExpFilter").fadeOut();
  });

  $('input[name="header_date"]').on('cancel.daterangepicker', function(ev, picker) {
      $(this).val('');
      $("#HeaderExpFilter").fadeOut();
  });
  
  
  $('input[name="top_date"]').daterangepicker({
			autoUpdateInput: false,
			locale: {
          cancelLabel: 'Clear'
      }
		});
		
		$('input[name="top_date"]').on('apply.daterangepicker', function(ev, picker) {
      $(this).val(picker.startDate.format('YYYY/MM/DD') + ' - ' + picker.endDate.format('YYYY/MM/DD'));
      $("#MvExpFilter").fadeOut();
  });

  $('input[name="top_date"]').on('cancel.daterangepicker', function(ev, picker) {
      $(this).val('');
      $("#MvExpFilter").fadeOut();
  });
		
		$('.top_mv_bxslider').bxSlider({
  		mode:'fade',
	    slideWidth: 1220,
	    minSlides: 1,
	    maxSlides: 3,
	    slideMargin: 10,
	    pager:false,
	    controls:false,
	    auto:true,
	    pause:5000
	  });
	});
	
      // 2. This code loads the IFrame Player API code asynchronously.
  var tag = document.createElement('script');

  tag.src = "https://www.youtube.com/iframe_api";
  var firstScriptTag = document.getElementsByTagName('script')[0];
  firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

  // 3. This function creates an <iframe> (and YouTube player)
  //    after the API code downloads.
  var player;
  function onYouTubeIframeAPIReady() {
    player = new YT.Player('TopMovie', {
      height: '730',
      width: '100%' ,
      videoId: 'CLxntu0QIFA',
      events: {
        'onReady': onPlayerReady,
        'onStateChange': onPlayerStateChange
      }
    });
  }

  // 4. The API will call this function when the video player is ready.
  function onPlayerReady(event) {
    event.target.playVideo();
  }

  // 5. The API calls this function when the player's state changes.
  //    The function indicates that when playing a video (state=1),
  //    the player should play for six seconds and then stop.
  var done = false;
  function onPlayerStateChange(event) {
    if (event.data == YT.PlayerState.PLAYING && !done) {
      stopVideo();
//           setTimeout(stopVideo, 6000);
      done = true;
    }
  }
  function stopVideo() {
    player.stopVideo();
  }
