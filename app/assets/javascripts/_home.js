$(document).ready(function() {
  $('input[id=search_date"]').daterangepicker({
    startDate: gon.date,
    singleDatePicker: true
    });
      // initialize datepair
    var date = document.getElementById('header');
    var datepair = new Datepair(date);
});

