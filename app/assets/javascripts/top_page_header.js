// トップページの「カテゴリーから探す」のプルダウン
$(function(){
    function buildHTML(){
      var html = 
      `<ul class="header-parent">
        <li class="header-parent">
          <h3>
            <a href="#">レディース</a>
          </h3>
        </li>
        <li class="header-parent">
          <h3>
            <a href="#">レディース</a>
          </h3>
        </li>
        <li class="header-parent">
          <h3>
            <a href="#">レディース</a>
          </h3>
        </li>
        <li class="header-parent">
          <h3>
            <a href="#">レディース</a>
          </h3>
        </li>
        <li class="header-parent">
          <h3>
            <a href="#">レディース</a>
          </h3>
        </li>
        <li class="header-parent">
          <h3>
            <a href="#">レディース</a>
          </h3>
        </li>
      </ul>`
      return html; 
    }
  $('.option').hover(function(){
    var html = buildHTML
    $('.option').append(html);
  })
  // $('.option').hover(function(){
  //   $('ul .header-parent').remove();
  // })
});
