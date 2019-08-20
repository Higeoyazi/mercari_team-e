$(document).on('turbolinks:load', function() {
  $.validator.addMethod("selectCheck", function(value, element, arg){
    return arg !== value;
   }, "Value must not equal arg.");

  $('.forth-main-wrapper__box').validate({
  rules: {
      number:{
        required: true,
        number: true,
        minlength : 14,
        maxlength : 16
      },
      // exp_month: {
      //   required: true,
      //   valueNotEquals: "---"
      // },
      // exp_month: {required: true},
      cvc: {
        required: true,
        number: true,
        minlength : 3,
        maxlength : 4
      }
  },
  messages: {
      number: {
        required: 'これは必須項目です。',
        number: '数字のみ入力できます。',
        maxlength: '14~16桁で入力してください。',
        minlength : '14~16桁で入力してください。',
        creditcard: 'クレジットカードの番号を入力してください。'
      },
      // exp_month: {
      //   required: 'これは必須項目です。',
      //   valueNotEquals: '項目を洗濯してください'
      // },
      // exp_year: {
      //   required: 'これは必須項目です。'
      // },
      cvc: {
        required: 'これは必須項目です。',
        number: '数字のみ入力できます。',
        minlength : '3桁もしくは4桁の番号です。',
        maxlength : '3桁もしくは4桁の番号です。'
      }
  }
});})
