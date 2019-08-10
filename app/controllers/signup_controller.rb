class SignupController < ApplicationController

  before_action :validates_step1, only: :step3
  before_action :validates_step2, only: :step5
  before_action :validates_step3, only: :step5
  before_action :validates_step4, only: :create

  def step1
  end

  def step2
    new_user
    session[:provider_data] = {} #メールアドレスで登録する場合、sns_credentialsを保存しないようにするため
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
    new_user
    @user.build_credit_card
    session[:profile_attributes] = user_params[:profile_attributes]
    session[:address_attributes] = user_params[:address_attributes]
  end

  def validates_step1
    new_user_with_params
    render '/signup/step2' unless @user.valid?(:validates_step1)
  end


  def validates_step2
    new_user_with_params
    @profile = Profile.new(user_params[:profile_attributes])
    render '/signup/step3' unless @profile.valid?(:validates_step2)
  end

  def validates_step3
    new_user_with_params
    @address = Address.new(user_params[:address_attributes])
    render '/signup/step4' unless @address.valid?(:validates_step3)
  end

  def validates_step4
    new_user_with_params
    @credit_card = CreditCard.new(user_params[:credit_card_attributes])
    render '/signup/step5' unless @credit_card.valid?(:validates_step4)
  end

  def create

    @user = User.new(session[:user_params])
    @user.build_profile(session[:profile_attributes])
    @user.build_address(session[:address_attributes])
    @user.build_credit_card(user_params[:credit_card_attributes])

    unless session[:provider_data] == {}
      @user.sns_credentials.build(
        uid: session[:provider_data]["uid"],
        provider: session[:provider_data]["provider"]
      )
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
      ],
      credit_card_attributes: [
        :id,
        :number,
        :expiration_date_month,
        :expiration_date_year,
        :security_code
      ])
  end
end
