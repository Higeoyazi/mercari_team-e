class ApplicationController < ActionController::Base
 
  require "payjp"
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :basic_auth, if: :production?
  # protect_from_forgery with: :exception

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :avatar, :birthday])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :avatar])
  end

  def after_sign_out_path_for(_resource)
    root_path
  end

  #以下のコードはcredentialに環境変数を入力しないとエラーになる
  #ユーザー登録時以外で登録するときは変数userが空だったら、で条件分岐する、かつこのアクション内で保存できるようにする
  def resister_payjp_customer(user)
    Payjp.api_key = Rails.application.credentials.development[:payjp_private_key]
    if params['payjp_token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(card: params['payjp_token'])
      @credit_card = user.credit_cards.build(customer_id: customer.id, card_id: customer.default_card)
    end 

    return @credit_card

  end

  private

  # def production?
  #   Rails.env.production?
  # end

  # def basic_auth
  #   authenticate_or_request_with_http_basic do |username, password|
  #     username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
  #   end
  # end
end
