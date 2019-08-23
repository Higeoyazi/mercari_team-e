$(document).on('turbolinks:load',function(){
    var input = $(".input-price").val();
    product_price = parseInt(input);
    if (product_price >= 300 && product_price <= 9999999){
      var fee = Math.floor(product_price * 0.1);
      $(".sell-price__form__lists__fee__right").html("¥" + fee);
      var profit =product_price - fee;
      $(".sell-price__form__lists__benefit__right").html("¥" + profit);
    } else {
      $(".sell-price__form__lists__fee__right").html("-");
      $(".sell-price__form__lists__benefit__right").html("-"); 
    }
  $('.input-price').on('keyup', function(e){
    e.preventDefault();
    var input = $(".input-price").val();
    product_price = parseInt(input);
    if (product_price >= 300 && product_price <= 9999999){
      var fee = Math.floor(product_price * 0.1);
      $(".sell-price__form__lists__fee__right").html("¥" + fee);
      var profit =product_price - fee;
      $(".sell-price__form__lists__benefit__right").html("¥" + profit);
    } else {
      $(".sell-price__form__lists__fee__right").html("-");
      $(".sell-price__form__lists__benefit__right").html("-"); 
    }
  });
});