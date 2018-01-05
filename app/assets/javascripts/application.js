//= require jquery2
//= require jquery.slick
//= require initialize
//= require rails-ujs
//= require jquery-ui
//= require underscore
//= require gmaps/google
//= require moment
//= require fullcalendar
//= require fullcalendar/lang/fr
//= require_tree .

$(document).ready(function() {

    // page is now ready, initialize the calendar...

    $('#calendar').fullCalendar({
      prev: 'circle-triangle-w',
      next: 'circle-triangle-e',
      prevYear: 'seek-prev',
      nextYear: 'seek-next',
      right:   'title',
      center: '',
      left:  'prev,next'
  })
});
