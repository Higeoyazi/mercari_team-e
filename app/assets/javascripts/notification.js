$(document).on('turbolinks:load', function() {
  $(function(){
    setTimeout("$('.notification').fadeOut('slow')", 2000) 
  })
});