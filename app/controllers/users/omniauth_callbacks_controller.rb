class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    callback_for(:facebook)
  end

  def google_oauth2
    callback_for(:google)
  end

  def callback_for(provider)
    provider = provider.to_s
    @user = User.find_oauth(request.env["omniauth.auth"])
    # binding.pry
    if @user.persisted?
      flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: provider.capitalize) #if is_navigational_format?
      sign_in_and_redirect @user, event: :authentication #after_sign_in_path_forと同じパス

    else
      session["devise.#{provider}_data"] = request.env["omniauth.auth"].except("extra")
      # redirect_to new_user_registration_path
      render '/signup/step2'
    end
  end

  def failure
    redirect_to root_path && return
  end

end
