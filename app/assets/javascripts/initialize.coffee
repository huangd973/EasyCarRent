if $( window ).width() < 620
      jQuery(document).on 'turbolinks:load', ->
      $('.scroller').slick({
      dots: true,
      arrows: true
      });
    else
      jQuery(document).on 'turbolinks:load', ->
      $('.scroller').slick({
      lazyLoad: 'ondemand',
      slidesToShow: 3,
      slidesToScroll: 1,
      arrows: true
      });
