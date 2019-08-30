$(function() {

  function buildHTML(comment){
    
    // アバター画像とデフォルト画像表示の条件分岐
    let addImage = comment.avatar_url !== null ? `<img src="${comment.avatar_url}", class="user_avatar">` :`<img src="http://static.mercdn.net/images/member_photo_noimage_thumb.png", class="user_avatar">`

    // 時刻表示を「~前」と表示するためのコード(Moment.jsというプラグインを使用)
    let time = moment(comment.created_at).fromNow()

    let html = `<li class="comment__body__item__content">
                  <div class="comment__body__item__content__user">
                    ${addImage}
                  </div>
                  <div class="comment__body__item__content__nickname">
                    ${comment.nickname}
                  </div>
                  <div class="comment__body__item__content__text">
                    <div class="comment__body__item__content__text__box">
                      ${comment.text}
                    </div>
                    <div class="comment__body__item__content__text__time">
                      <i class="far fa-clock"></i>
                      ${time}
                      <i class="far fa-flag"></i>
                    </div>
                  </div>
                </li>`
    return html;
  }

  $("#new_comment").on("submit", function(e) {
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr("action");
    
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: "json",
      processData: false,
      contentType: false
    })

    .done(function(comment){
      let html = buildHTML(comment);
      $(".comment__body__item").append(html);
      $("#new_comment")[0].reset();
      $(".comment__form__submit__btn").prop("disabled", false);
      $(".comment__boby").animate({ scrollTop: $(".comment__boby")[0].scrollHeight}, "fast");
    })
    .fail(function(){
      alert("error")
      $(".form__submit").prop("disabled", false);
    })

  })
});
