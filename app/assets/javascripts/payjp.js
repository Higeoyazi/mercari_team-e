$(document).on('turbolinks:load', function() {
  var form = $(".forth-main-wrapper__box");
  Payjp.setPublicKey('pk_test_288043db98dbe0bc37e135c6');

  $(".forth-main-wrapper__box").on("click", "#signup--btn", function(e) {
    e.preventDefault();
    form.find("input[type=submit]").prop("disabled", true);
    var card = {
        number: parseInt($("#payment_card_no").val()),
        cvc: parseInt($("#payment_card_security_code").val()),
        exp_month: parseInt($("#payment_card_expire_mm").val()),
        exp_year: parseInt($("#payment_card_expire_yy").val())
    };
    Payjp.createToken(card, function(s, response) {
      if (response.error) {
        alert("error")
        form.find("input[type=submit]").prop('disabled', false);
      }
      else {
        $(".number").removeAttr("name");
        $(".cvc").removeAttr("name");
        $(".exp_month").removeAttr("name");
        $(".exp_year").removeAttr("name");

        var token = response.id;
        $(".forth-main-wrapper__box").append($('<input type="hidden" name="payjp_token" class="payjp-token" />').val(token));
        $(".forth-main-wrapper__box").get(0).submit();
      }
    });
  });
});