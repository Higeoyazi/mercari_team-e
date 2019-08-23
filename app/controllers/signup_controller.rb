class SignupController < ApplicationController

  before_action :redirect
  before_action :validates_user, only: :step3
  before_action :validates_profile, :validates_address, only: :step5

  def index
    render '/signup/step5'
  end

  def step1
  end

  def step2
    new_user
    session[:provider_data] = {} #戻ってメールアドレスで登録する場合、sns_credentialsを保存しないようにするため
  end

  def step3
    new_user
    @user.build_profile
    session[:user_params] = user_params
  end

  def step4
    new_user
    @user.build_profile
    @user.build_address
  end

  def step5
    session[:profile_attributes] = user_params[:profile_attributes]
    session[:address_attributes] = user_params[:address_attributes]
  end

  def validates_user
    new_user_with_params
    render '/signup/step2' unless @user.valid?(:step2)
  end

  def validates_profile
    new_user_with_params
    render '/signup/step4' unless @user.profile.valid?(:step4)
  end

  def validates_address
    new_user_with_params
    render '/signup/step4' unless @user.address.valid?(:step4)
  end


  def create

    @user = User.new(session[:user_params])
    @user.build_profile(session[:profile_attributes])
    @user.build_address(session[:address_attributes])
    resister_payjp_customer(@user)

    #step1でFB or Googleのリンク経由でないと保存されない、セッションに残る場合はメールアドレスリンクで空になる
    unless session[:provider_data] == {}
      @user.sns_credentials.build(
        uid: session[:provider_data]["uid"],
        provider: session[:provider_data]["provider"])
    end

    if @user.save
      session[:id] = @user.id
      redirect_to done_signup_index_path
    else
      render '/signup/step1'
    end
  end

  def done
    sign_in User.find(session[:id]) unless user_signed_in?
  end

  def redirect
    redirect_to root_path if current_user
  end


  private

  def new_user
    @user = User.new
  end

  def new_user_with_params
    @user = User.new(user_params)
  end


  def user_params
    params.require(:user).permit(
      :nickname, 
      :email, 
      :password, 
      :password_confirmation,
      profile_attributes: [
        :id,
        :family_name,
        :first_name,
        :family_name_kana,
        :first_name_kana,
        :phone_number
      ],
      address_attributes: [
        :id,
        :postal_code,
        :prefecture,
        :city,
        :block,
        :building
      ])
  end
end
