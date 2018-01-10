//Date picker jquery
var dateToday = new Date();
  $( function() {
    var dateFormat = "dd/mm/yy",
      from = $( "#from" )
        .datepicker({
          defaultDate: "+1d",
          changeMonth: true,
          numberOfMonths: 2,
          minDate: dateToday
        })
        .on( "change", function() {
          to.datepicker( "option", "minDate", getDate( this ) );
        }),
      to = $( "#to" ).datepicker({
        defaultDate: "+1d",
        changeMonth: false,
        numberOfMonths: 2
      })
      .on( "change", function() {
        from.datepicker( "option", "maxDate", getDate( this ) );
      });

    function getDate( element ) {
      var date;
      try {
        date = $.datepicker.parseDate( dateFormat.strftime("%m/%d/%Y"), element.value );
      } catch( error ) {
        date = null;
      }

      return date;
    }
  } );
