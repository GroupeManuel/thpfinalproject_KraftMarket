// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require jquery
//= require rails-ujs
//= require turbolinks

//= require jquery3

//= require mmenu.min
//= require chosen.min
//= require slick.min
//= require rangeslider.min
//= require magnific-popup.min
//= require waypoints.min
//= require counterup.min

//= require tooltips.min
//= require custom

//= require rangeslider.min
//= require sticky-kit.min
//= require switcher
//= require themepunch.revolution.min
//= require themepunch.tools.min

//= require_tree .




$(document).ready(function(){

/// Timeout for all flash messages on the app ///

   setTimeout(function(){
         $('.flash-message').remove()
   }, 3000)

/// Timeout for all flash messages on the app ///

document.getElementById('timer').innerHTML =
  20 + ":" + 01;
startTimer();

function startTimer() {
  var presentTime = document.getElementById('timer').innerHTML;
  var timeArray = presentTime.split(/[:]+/);
  var m = timeArray[0];
  var s = checkSecond((timeArray[1] - 1));
  if(s==59){m=m-1}
  //if(m<0){alert('timer completed')}
  
  document.getElementById('timer').innerHTML =
    m + ":" + s;
  setTimeout(startTimer, 1000);
}

function checkSecond(sec) {
  if (sec < 10 && sec >= 0) {sec = "0" + sec}; // add zero in front of numbers < 10
  if (sec < 0) {sec = "59"};
  return sec;
}
})



	
