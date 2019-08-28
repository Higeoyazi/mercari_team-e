// トップページの検索機能のインクリメンタルサーチ
$(document).on('turbolinks:load', function() {

  $(function() {

    // インクリメンタルサーチの実装
    var search_list = $(".product__search__result__box");

    function appendProduct(product){
      var html = `<li class="product__search__result__box__list" data-product-id="${product.id}">
                    <span class="product__search__result__box__list__name" name:"keyword">${product.name}</span>
                  </li>`
      search_list.append(html);
    }

    function appendErrMsgToHTML(nothing_product){
      var html = `<li class="product__search__result__box__list">
                    <span class="product__search__result__box__list__name">${nothing_product}</span>  
                  </li>`
      search_list.append(html)
    }

    $(".form").on("keyup", function() {
      // 隠れている検索結果の画面が表示される
      $(".product__search__result__box").show();
      let input = $(this).val();
      // 表示されている検索結果を一旦削除する
      $(".product__search__result__box").empty();
      
      $.ajax({
        type: 'GET',
        url: '/products/search',
        data: { keyword: input },
        dataType: 'json'
      })

      .done(function(products) {
        if (products.length !== 0) {
          // 検索結果の画面を表示させる
          $(".product__search__result__box").show();
          products.forEach(function(product){
            appendProduct(product);
          });
        } else {
          appendErrMsgToHTML("一致する商品はありません");
        }
      })
      
      .fail(function(){
        alert("商品検索に失敗しました");
      });
    });

    // インクリメンタルサーチ後の実装
    // 検索結果boxの文字列をクリックすると、検索窓にクリックした文字列を表示させることができる処理
    $(document).on("click",".product__search__result__box__list__name",function(){
      let clicked_text = $(this).text();

      function showHTML(product){
          let html = `${product.name}`
        return html;
      }

      $.ajax({
        type: 'GET',
        url: '/products/search',
        data: { keyword: clicked_text },
        dataType: 'json'
      })
      
      .done(function(products) {
        products.forEach(function(product){
          html = showHTML(product)
          $('input[name="keyword"]').val(html);
        });
      });
    });

    // カーソルが検索結果画面boxから外れた時、boxを一時非表示にする処理
    $(document).on("mouseleave",".product__search__result__box",function(){
      $(".product__search__result__box").hide();
    });

  });

});
