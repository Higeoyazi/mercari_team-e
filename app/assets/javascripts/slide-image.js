$(document).on('turbolinks:load', function() {
  $(function(){
    $('.slide').slick({
      dots: true,
      autoplay: true,
      autoplaySpeed: 5000,
    });
  });
});
