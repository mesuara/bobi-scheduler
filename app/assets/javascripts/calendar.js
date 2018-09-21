//= require moment 
//= require fullcalendar

// Optional locale  change '// require' --> '//= require' to enable
// require fullcalendar/locale-all
// or sepecific locale
// require fullcalendar/locale/ms

// Optional addons  change '// require' --> '//= require' to enable
// require fullcalendar/scheduler
// require fullcalendar/gcal

// var updateEvent;

// $(document).ready(function() {
//   var todayDate = new Date();
//   todayDate.setHours(0,0,0,0);

//   $('#calendar').fullCalendar({
//     editable: false,
//     slotEventOverlap: false,
//     columnFormat: {
//       month: 'dddd',
//       week: 'dddd d',
//       day: 'ddd'
//     },
//     buttonText: {
//       today: 'Hoy',
//       month: 'month',
//       week: 'week',
//       day: 'day'
//     },
//     minTime: "08:00:00",
//     maxTime: "23:00:00",
//     header: {
//       left: 'prev,next today',
//       center: 'title',
//       right: ''
//     },
//     firstDay: 1,
//     //this section is triggered when the event cell it's clicked
//     selectable: true,
//     selectHelper: true,
//     select: function(start, end) {
//       var user_name;
//       user_name = prompt("User name: ");
//       var eventData;
//       //this validates that the user must insert a name in the input
//       if (user_name) {
//         eventData = {
//           title: "Reserved",
//           start: start,
//           end: end,
//           user_name: user_name
//         };
//         //here i validate that the user can't create an event before today
//         if (eventData.start < todayDate){
//           alert('You cant choose a date that already past.');
//           $("#calendar").fullCalendar("unselect");
//           return
//         }
//         //if everything it's ok, then the event is saved in database with ajax
//         $.ajax({
//           url: "events",
//           type: "POST",
//           data: eventData,
//           dataType: 'json',
//           success: function(json) {
//             alert(json.msg);
//             $("#calendar").fullCalendar("renderEvent", eventData, true);
//             $("#calendar").fullCalendar("refetchEvents");
//           }
//         });
//       }
//       $("#calendar").fullCalendar("unselect");
//     },  
//     defaultView: 'agendaWeek',
//     allDaySlot: false,
//     height: 500,
//     slotMinutes: 30,
//     eventSources: [
//       {
//         url: '/appointments'
//       }
//     ],
//     timeFormat: 'h:mm t{ - h:mm t} ',
//     dragOpacity: "0.5"
//   });
// });

// $(function() {

//     $('#calendar').fullCalendar({
//       header: {
//         left: 'month,agendaWeek,agendaDay custom1',
//         center: 'title',
//         right: 'custom2 prevYear,prev,next,nextYear'
//       },
//       footer: {
//         left: 'custom1,custom2',
//         center: '',
//         right: 'prev,next'
//       },
//       customButtons: {
//         custom1: {
//           text: 'custom 1',
//           click: function() {
//             alert('clicked custom button 1!');
//           }
//         },
//         custom2: {
//           text: 'custom 2',
//           click: function() {
//             alert('clicked custom button 2!');
//           }
//         }
//       }
//     });
  
//   });
var initialize_calendar;
initialize_calendar = function() {
  $('#calendar').each(function(){
    var calendar = $(this);
    calendar.fullCalendar({
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'month,agendaWeek,agendaDay'
      },
      selectable: true,
      selectHelper: true,
      editable: true,
      eventLimit: true,
      events: '/appointments.json',

      select: function(start, end) {
        $.getScript('/appointments/new', function() {});

        calendar.fullCalendar('unselect');
      },

      eventDrop: function(event, delta, revertFunc) {
        event_data = { 
          event: {
            id: event.id,
            start: event.start.format(),
            end: event.end.format()
          }
        };
        $.ajax({
            url: event.update_url,
            data: event_data,
            type: 'PATCH'
        });
      },
      
      eventClick: function(event, jsEvent, view) {
        $.getScript(event.edit_url, function() {});
      }
    });
  })
  $('.fc-prev-button').click(function () {
    alert('prev Button is is clicked');
});

$('.fc-next-button').click(function () {
    alert('next button is clicked');
});
};
$(document).on('turbolinks:load', initialize_calendar, 	$(function () { // wait for document ready
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
);
