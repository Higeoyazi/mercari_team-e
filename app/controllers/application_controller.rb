class ApplicationController < ActionController::Base
  require "payjp"
  before_action :configure_permitted_parameters, if: :devise_controller?
  

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :avatar, :birthday])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :avatar])
  end

  def after_sign_out_path_for(_resource)
    new_user_session_path
  end

  def resister_payjp_customer(user)#ユーザー登録時以外で登録するときは変数userが空だったら、で条件分岐する、かつこのアクション内で保存できるようにする
    Payjp.api_key = Rails.application.credentials.development[:payjp_private_key]
    if params['payjp_token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(card: params['payjp_token'])
      @credit_card = user.build_credit_card(customer_id: customer.id, card_id: customer.default_card)
      # if @card.save
      #   redirect_to action: "show" and return
      # else
      #   redirect_to action: "pay" and return
      # end
    end 
    return @credit_card
  end

end
