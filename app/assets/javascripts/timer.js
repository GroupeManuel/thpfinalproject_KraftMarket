 setTimeout(function() { 

     var time = 30; /* how long the timer will run (seconds) */
     var initialOffset = '440';
     var i = 1
    
  
     /* Need initial run as interval hasn't yet occured... */
     $('.circle_animation').css('stroke-dashoffset', initialOffset-(1*(initialOffset/time)));
  
     var interval = setInterval(function() {
         $('').text(i);
         if (i == time) {  	
           clearInterval(interval);
           return;
         }
         $('.circle_animation').css('stroke-dashoffset', initialOffset-((i+1)*(initialOffset/time)));
         i++;  
     }, 1000);
  
   }, 0)

