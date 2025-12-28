// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require local-time
//= require jquery.purr
//= require best_in_place

// Use both document.ready and turbolinks:load for compatibility
function initializeApp() {
     /* Activating Best In Place */
     if (typeof jQuery !== 'undefined' && jQuery.fn.best_in_place) {
        jQuery(".best_in_place").best_in_place();
     }
     
     // Set image titles from alt text
     $('img').each( function() {
        var o = $(this);
        if( ! o.attr('title') && o.attr('alt') ) o.attr('title', o.attr('alt') );
     });
}

// Initialize on page load (works without Turbolinks)
$(document).ready(initializeApp);

// Initialize on Turbolinks page load (works with Turbolinks)
$(document).on('turbolinks:load', initializeApp);
