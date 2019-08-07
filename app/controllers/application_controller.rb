class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :avatar, :birthday])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :avatar])
  end

  def after_sign_out_path_for(_resource)
    new_user_session_path
  end

end
