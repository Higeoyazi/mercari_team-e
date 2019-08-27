// $(function() {

//   var search_list = $(".product_search_result");

//   function appendProduct(product){
//     var html = `<li class="product_search_result_list" data-product-id"${product.id}">
//                   <a href=/products/search class="product_search_result_list_name" name:"keyword">
//                     ${product.name}
//                   </a>
//                 </li>`
//     search_list.append(html);
    
//   }

//   function appendErrMsgToHTML(nothing_product){
//     var html = `<li class="product_search_result_list">
//                   <span class="product_search_result_list_name">
//                     ${nothing_product}
//                   </span>  
//                 </li>`
//     search_list.append(html)
//   }

//   $(".form").on("keyup", function() {
//     let input = $(this).val();
//     // 表示されている検索結果を一旦削除する
//     $(".product_search_result").empty();
    
//     $.ajax({
//       type: 'GET',
//       url: '/products/search',
//       data: { keyword: input },
//       dataType: 'json'
//     })
//     .done(function(products) {
      
//       if (products.length !== 0) {
//         products.forEach(function(product){
//           appendProduct(product);
//         });
//       }
//       else {
//         appendErrMsgToHTML("一致する商品はありません");
//       }

//     // .fail(function() {
//     //   alert("映画検索に失敗しました");
//     // });


//     });
//   });
// });