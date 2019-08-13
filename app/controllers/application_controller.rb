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

  def resister_payjp_customer
    Payjp.api_key = Rails.application.credentials.development[:payjp_private_key] #ここを呼び出すところから明日スタート！
    binding.pry
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
      description: '登録テスト', #なくてもOK
      email: current_user.email, #なくてもOK
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      ) #念の為metadataにuser_idを入れましたがなくてもOK
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to action: "show"
      else
        redirect_to action: "pay"
      end
    end   
  end

end
