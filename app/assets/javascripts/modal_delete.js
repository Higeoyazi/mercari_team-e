// モーダルウィンドゥを使って商品削除する処理
$(function() {
  $(".delete-btn").on("click",function(){
    $('#overlay').fadeIn();

    $(document).on("click","#modal-close-btn",function(){
      $('#overlay').fadeOut();
    });

    $(document).on("click","#delete-comformation-btn",function(){
      let ProductID = $(this).attr("data-product.id");
      $.ajax({
        url: "/products/" + ProductID,
        type: "POST",
        data: {"id":ProductID,"_method": "DELETE"} 
      }) 
    })
  });
});
