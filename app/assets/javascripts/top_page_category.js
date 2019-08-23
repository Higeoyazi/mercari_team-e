$(function(){

  // 子カテゴリーの処理
  function buildChildHTML(child){
    var html = `<li class="lower__left__categry__list__child__list">
                  <h3>
                    <a class="child_category" id="${child.id}" href="/category/${child.id}">${child.name}</a>
                  </h3>
                </li>`;
    return html;
    }
  $(".parent_category").on("mouseover",function(){
    let id = $(this).attr("id")
// 親に赤色のcssを当てる処理
    $(".now-selected-red").removeClass("now-selected-red")
    $('#' + id).addClass("now-selected-red")
// 子と孫を一旦消す処理
    $(".child_category").remove();
    $(".grand_child_category").remove();

    $.ajax({
      type: "GET",
      url: "/products/category",
      data: {parent_id: id},
      datatype: "json"  
    })
    .done(function(children){
      children.forEach(function(child){
        let html = buildChildHTML(child);
        $(".lower__left__categry__list__child").append(html);
      })
    });
  });

    // 孫カテゴリー処理
    function buildGrandChildHTML(child){
      var html = `<li class="lower__left__categry__list__child__list">
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
          var html = buildGrandChildHTML(child);
          $(".lower__left__categry__list__grandchild").append(html);
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
  // カーソルが「カテゴリーから探す」に当たると、子孫が削除され、親の色が白になり、親の縦列boxが消える処理
    $(document).on("mouseover", "#search-categories", function () {
      $(".child_category").remove();
      $(".grand_child_category").remove();
      $(".now-selected-red").removeClass("now-selected-red")
      $(".lower__left__categry__list__parent").hide();
    });
    // カーソルが「カテゴリーから探す」から離れると、親の縦列boxが現れる処理
    $(document).on("mouseleave", "#search-categories", function () {
      $(".lower__left__categry__list__parent").show();
    });

    // $(document).on("mouseover", "#search-categories", function () {
    //   $("#categry__box").addClass("lower__left__categry__box");
    // });



});
