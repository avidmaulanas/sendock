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
//= require jquery.turbolinks
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require bootstrap
//= require locationpicker.jquery


$(function(){
  $('#location-picker').locationpicker({
    radius: 10,
    inputBinding: {
      locationNameInput: $('#location-input')
    },
    onchanged: function (currentLocation, radius, isMarkerDropped) {
      $('#location-lat').val(currentLocation.latitude);
      $('#location-lng').val(currentLocation.longitude);
    },
    enableAutocomplete: true
  });
})

if (window.location.hostname == "sendock.agung.work"){
  if (navigator.serviceWorker) {
    navigator.serviceWorker.register('/sw.js')
      .then(function(reg) {
        console.log(reg.scope, 'register');
      });
  }
}