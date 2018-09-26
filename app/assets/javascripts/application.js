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
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require calendar
//= require moment 
//= require fullcalendar
//= require fullcalendar/locale-all
//= require jquery
//= require jquery3
//= require popper
//= require bootstrap
//= require calendar
//= require fullcalendar_engine/application
//= require_tree .

// $('#calendar').fullCalendar({});

$(document).on('turbolinks:load', function () { // wait for document ready
    // init
    var controller = new ScrollMagic.Controller();
  
    // define movement of panels
    var wipeAnimation = new TimelineMax()
      .fromTo("section.panel.turqoise", 1, {x: "-100%"}, {x: "0%", ease: Linear.easeNone})  // in from left
      .fromTo("section.panel.green",    1, {x:  "100%"}, {x: "0%", ease: Linear.easeNone})  // in from right
      .fromTo("section.panel.bordeaux", 1, {y: "-100%"}, {y: "0%", ease: Linear.easeNone}); // in from top
  
    // create scene to pin and link animation
    new ScrollMagic.Scene({
        triggerElement: "#pinContainer",
        triggerHook: "onLeave",
        duration: "300%"
      })
      .setPin("#pinContainer")
      .setTween(wipeAnimation)
      
      .addTo(controller);
  })

  // function eventCalendar() {
  //   return $('#calendar').fullCalendar({ });
  // };
  // function clearCalendar() {
  //   $('#calendar').fullCalendar('delete'); 
  //   $('#calendar').html('');
  // };

  // $(document).on('turbolinks:load', function(){
  //   eventCalendar();  
  // });
  // $(document).on('turbolinks:before-cache', clearCalendar);
 
  function eventCalendar() {
    return $('#calendar').fullCalendar({ });
  };
  function clearCalendar() {
    $('#calendar').fullCalendar('delete'); 
    $('#calendar').html('');
  };

  $(document).on('turbolinks:load', function(){
    eventCalendar();
     
  });
  $(document).on('turbolinks:before-cache', clearCalendar);

//   window.onload = function () {
//     if (! localStorage.justOnce) {
//         localStorage.setItem("justOnce", "true");
//         window.location.reload();
//     }
// }
