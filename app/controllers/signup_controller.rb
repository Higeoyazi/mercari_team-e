class SignupController < ApplicationController
  # 各アクションごとに新規インスタンスを作成します
  # 各アクションごとに、遷移元のページのデータをsessionに保管していきます
def step1
  @user = User.new # 新規インスタンス作成
end

def step2
  # step1で入力された値をsessionに保存
  session[:nickname] = user_params[:nickname]



  @user = User.new # 新規インスタンス作成
end

def step3
  @user = User.new # 新規インスタンス作成
  session[:email] = user_params[:email]
end

def step4
  @user = User.new # 新規インスタンス作成
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
