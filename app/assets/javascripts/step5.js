$(document).on('turbolinks:load', function() {
  $('.forth-main-wrapper__box').validate({
  rules: {
      number:{
        required: true,
        maxlength : 16
      },
      exp_month:{required: true},
      exp_month:{required: true},
      cvc: {
        required: true,
        minlength : 3,
        maxlength : 4
      }
  },
  messages: {
      number: {
        required: 'これは必須項目です!',
        maxlength: '最大で16桁です'
      },
      exp_month: {
        required: 'これは必須項目です!'
      },
      exp_year: {
        required: 'これは必須項目です!'
      },
      cvc: {
        required: 'これは必須項目です!',
        minlength : '3桁もしくは4桁の番号です!',
        maxlength : '3桁もしくは4桁の番号です!'
      }
  }
});})
