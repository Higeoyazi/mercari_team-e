class SignupController < ApplicationController


def step1
  @user = User.new
end

def step2
  @user = User.new
  @user.build_profile
  # @profile = Profile.new
  session[:nickname] = user_params[:nickname]
  session[:email] = user_params[:email]
  session[:password] = user_params[:password]
  session[:password_confirmation] = user_params[:password_confirmation]
end

def step3
  # @profile = Profile.new
  # @address = Address.new
  @user = User.new
  @user.build_profile
  @user.build_address
  session[:email] = user_params[:email]
end

def step4
  @user = User.new
  #@user.build_credit_card
  @credit_card = CreditCard.new
  session[:password] = user_params[:password]
  session[:password_confirmation] = user_params[:password_confirmation]
end


def create
  @user = User.new(
    nickname: session[:nickname], # sessionに保存された値をインスタンスに渡す
    email: session[:email],
    password: session[:password],
    password_confirmation: session[:password_confirmation],
  )
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
  # 許可するキーを設定します
    def user_params
      params.require(:user).permit(
        :nickname, 
        :email, 
        :password, 
        :password_confirmation, 
      )
    end
end
