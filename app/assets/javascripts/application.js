// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .
function displayClock() {
  var digital = new Date();
  var hours = digital.getHours();
  var minutes = digital.getMinutes();
  var seconds = digital.getSeconds();
  var amOrPm = 'AM';
  if (hours > 11) amOrPm = 'PM';
  if (hours > 12) hours = hours - 12;
  if (hours == 0) hours = 12;
  if (minutes <= 9) minutes = '0' + minutes;
  if (seconds <= 9) seconds = '0' + seconds;
  dispTime = '<b>'+hours + ':' + minutes + ':' + seconds + ' ' + amOrPm+'</b>';
  document.getElementById('time').innerHTML = dispTime;
  setTimeout('displayClock()', 1000);
}
