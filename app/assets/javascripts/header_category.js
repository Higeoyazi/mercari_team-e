$(document).on('turbolinks:load', function() {
  // 子・孫カテゴリーをAjaxで表示させる処理
  $(function(){

    // 子カテゴリーの処理
    function buildChildHTML(child){
      let html = `<li class="lower__categries__box__children__child">
                    <h3>
                      <a class="child_category" id="${child.id}" href="/category/${child.id}">${child.name}</a>
                    </h3>
                  </li>`;
      return html;
      }
      // それぞれの親にカーソルが当たると、イベント発火
    $(".parent_category").on("mouseover",function(){
      let id = $(this).attr("id")
      // 親に赤色のcssを当てる処理
      $(".now-selected-red").removeClass("now-selected-red")
      $('#' + id).addClass("now-selected-red")
      // 子と孫を一旦消す処理
      $(".child_category").remove();
      $(".grand_child_category").remove();
      // 孫のulタグのクラスを一旦隠す処理
      $(".lower__categries__box__grandchildren").hide();

      $.ajax({
        type: "GET",
        url: "/products/category",
        data: {parent_id: id},
        datatype: "json"  
      })
      
      .done(function(children){
        children.forEach(function(child){
          let html = buildChildHTML(child);
          $(".lower__categries__box__children").append(html);
        })
      });
    });

    // 孫カテゴリー処理
    function buildGrandChildHTML(child){
      let html = `<li class="lower__left__categries__box__grandchildren__grandchild">
                    <h3>
                      <a class="grand_child_category" id="${child.id}"href="/category/${child.id}">${child.name}</a>
                    </h3>
                  </li>`;
      return html;
      }
    
    $(document).on("mouseover", ".child_category", function(){
      let id = $(this).attr("id")
      //子に灰色のcssを当てる処理
      $(".now-selected-gray").removeClass("now-selected-gray")
      $('#' + id).addClass("now-selected-gray")

      $.ajax({
        type: "GET",
        url: "/products/category",
        data: {parent_id: id},
        dataType: 'json'
      })
      
      .done(function(children) {
        children.forEach(function (child) {
          let html = buildGrandChildHTML(child);
          // 子カテゴリーの処理の段階において、一旦隠した孫のulタグのクラスを表示させ、そこにHTMLを追加する処理
          $(".lower__categries__box__grandchildren").show();
          $(".lower__categries__box__grandchildren").append(html);
        })
        $(document).on("mouseover", ".child_category", function () {
          $(".grand_child_category").remove();
        });
      });

    });  
    //孫に灰色のcssを当てる処理
    $(document).on("mouseover", ".grand_child_category", function () {
      let id = $(this).attr("id")
      $(".now-selected-rgba").removeClass("now-selected-rgba")
      $('#' + id).addClass("now-selected-rgba")
    });

    // カテゴリーの一覧表示のboxの表示・非表示についての処理
    //「カテゴリーから探す」にカーソルを当てると、カテゴリーの一覧表示のboxが表示される処理
    $("#search-categories").hover(function () {
      $(".lower__categries__box").css("display","flex");
    });
    // カテゴリーの一覧表示のboxからカーソルが離れたら、boxごと非表示される処理
    $(document).on("mouseleave", ".lower__categries__box", function () {
      $(".lower__categries__box").hide();
    });

  });

});