function play_audio(id) {
  $f(id, "/swf/flowplayer-3.2.7.swf", {
  	clip: {
  	  autoPlay: false,
  	  url: $('#' + id).attr('href')
    },
  	// show playlist buttons in controlbar
  	plugins:  {
  		controls: {
  			fullscreen: false,
  			height: 24,
  			autoHide: false,
  			url: '/swf/flowplayer.controls-3.2.5.swf'
  		},
  		audio: {
  			url: '/swf/flowplayer.audio.swf'
    	}
  	}	
  });
};

function play_video(id) {
  $f(id, "/swf/flowplayer-3.2.7.swf", {
  	clip: {
  	  autoPlay: false,
  	  url: $('#' + id).attr('href')
    },
  	// show playlist buttons in controlbar
  	plugins:  {
  		controls: {
  			fullscreen: false,
  			height: 24,
  			autoHide: false,
  			url: '/swf/flowplayer.controls-3.2.5.swf'
  		},
  		audio: {
  			url: '/swf/flowplayer.audio.swf'
    	}
  	}	
  });  
};

function play_video_with_splash(id) {
  $f(id, "/swf/flowplayer-3.2.7.swf", {
    playlist: [
  		{
  			url: '/images/logo.jpg', 
  			scaling: 'orig'
  		},
  		{
  		  url: $('#' + id).attr('href'),
  		  autoPlay: false
  		}
    ],
  	// show playlist buttons in controlbar
  	plugins:  {
  		controls: {
  			fullscreen: true,
  			height: 24,
  			autoHide: false,
  			url: '/swf/flowplayer.controls-3.2.5.swf'
  		},
  		audio: {
  			url: '/swf/flowplayer.audio.swf'
    	}
  	}	
  });  
};