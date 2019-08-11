Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  resources :products
  resources :signup do
    collection do
      get 'step1'
      get 'step2'
      get 'step3'
      get 'step4'
      #get 'step5'# ここで、入力の全てが終了する
      get 'done' # 登録完了後のページ
    end
  end
  root 'products#index'
end
