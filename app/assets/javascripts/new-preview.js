$(document).on('turbolinks:load', function () {
  $(".upload-image__box__file__input").on('change', function(){
     var fileprop = $(this).prop('files')[0],
         find_img = $(this).parent().find('img'),
         filereader = new FileReader(),
         view_box = $(this).parent('.upload-image__box__file');
    if(find_img.length){
       find_img.nextAll().remove();
       find_img.remove();
    }
    var img = '<div class="img-view"><img alt="" class="img-view__preview"><p class="link-preview"><a href="#" class="img_del">削除</a></p></div>';
    view_box.append(img);

    filereader.onload = function() {
      view_box.find('img').attr('src', filereader.result);
      img_del(view_box);
    }
    filereader.readAsDataURL(fileprop);
  });
  function img_del(target){
    target.find("a.img_del").on('click',function(){
      var self = $(this),
          parentBox = self.parent().parent().parent();
      if(window.confirm('画像を削除します。\nよろしいですか？')){
        setTimeout(function(){
          parentBox.find('input[type=file]').val('');
          parentBox.find('.img-view').remove();
        } , 0);
      }
      return false;
    });
  }
});

