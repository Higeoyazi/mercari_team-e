class SignupController < ApplicationController


def step1
  @user = User.new
end

def step2
  @user = User.new
  @user.build_profile
  session[:user_params] = user_params
  # @profile = Profile.new
  # session[:nickname] = user_params[:nickname]
  # session[:email] = user_params[:email]
  # session[:password] = user_params[:password]
  # session[:password_confirmation] = user_params[:password_confirmation]
  # binding.pry
end

def step3
  # @profile = Profile.new
  # @address = Address.new
  @user = User.new
  @user.build_profile
  @user.build_address
  session[:phone_number] = user_params[:profile_attributes][:phone_number]
end

def step4
  @user = User.new
  @user.build_credit_card
  # @credit_card = CreditCard.new

  #session for profile
  session[:family_name] = user_params[:profile_attributes][:family_name]
  session[:first_name] = user_params[:profile_attributes][:first_name]
  session[:family_name_kana] = user_params[:profile_attributes][:family_name_kana]
  session[:first_name_kana] = user_params[:profile_attributes][:first_name_kana]

  #session for address
  session[:postal_code] = user_params[:address_attributes][:postal_code]
  session[:prefecture] = user_params[:address_attributes][:prefecture]
  session[:city] = user_params[:address_attributes][:city]
  session[:block] = user_params[:address_attributes][:block]
  session[:building] = user_params[:address_attributes][:building]
end


def create
  @user = User.new(#session[:user_params]
    nickname: session[:nickname],
    email: session[:email],
    password: session[:password],
    password_confirmation: session[:password_confirmation],
  )
  @user.build_profile(user_params[:profile_attributes])
  @user.build_address(user_params[:address_attributes])
  @user.build_credit_card(user_params[:credit_card_attributes])
  binding.pry
  if @user.save
  # ログインするための情報を保管
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
