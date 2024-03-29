$( document ).on('turbolinks:load', function() {
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
 
      reader.onload = function (e) {
        $('#avatar_img_prev').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }

 
  $("#post_img").change(function(){
    var imgtag = 
      $("<img>").attr("id", "avatar_img_prev").attr("src", "").attr("width",60)
      .attr("height",60);
    $("figure").prepend(imgtag);
    $('#avatar_img_prev').removeClass('hidden');
    $('.avatar_present_img').remove();
    readURL(this);
  });
});