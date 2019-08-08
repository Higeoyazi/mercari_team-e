class SignupController < ApplicationController

  before_action :validates_step1, only: :step2
  # before_action :validates_step2, only: :step3
  before_action :validates_step3, only: :step4
  before_action :validates_step4, only: :step4
  before_action :validates_step5, only: :create

def step1
  @user = User.new
end

def step2
  @user = User.new
  @user.build_profile
  session[:user_params] = user_params
end

def step3
  @user = User.new
  @user.build_profile
  @user.build_address
  session[:phone_number] = user_params[:profile_attributes][:phone_number]
end

def step4
  @user = User.new
  @user.build_credit_card
  session[:profile_attributes] = user_params[:profile_attributes]
  session[:address_attributes] = user_params[:address_attributes]
end

def validates_step1 #for User
  @user = User.new(user_params)
  render '/signup/step1' unless @user.valid?(:validates_step1)
end

# def validates_step2 #for phone_number ここは個別でバリデーションをかける必要があるから後回し
#   @profile = Profile.new( phone_number: user_params[:profile_attributes][:phone_number])
#   # binding.pry
#   render '/signup/step2' if @profile.phone_number.nil? || unless @profile.phone_number.valid?
# end

def validates_step3 #for Profile
  user_params[:profile_attributes][:phone_number] = session[:phone_number]
  @user = User.new(user_params)
  @profile = Profile.new(user_params[:profile_attributes])
  render '/signup/step3' unless @profile.valid?(:validates_step3)
end

def validates_step4 #for Address


end

def validates_step5 #for CreditCard

end


def create
  @user = User.new(session[:user_params])
  session[:profile_attributes][:phone_number] = session[:phone_number]
  @user.build_profile(session[:profile_attributes])
  @user.build_address(session[:address_attributes])
  @user.build_credit_card(user_params[:credit_card_attributes])

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
