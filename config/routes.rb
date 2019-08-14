Rails.application.routes.draw do
  root 'products#index'

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
      get 'step5'
      get 'done'
    end
  end

  resources :mypages do
    collection do
      get 'profile'
      get 'logout'
      get 'edition'
      get 'identification'

      resources :credit_cards, only: [:index, :new, :create, :destroy]
      #payアクションはproductの中にネストさせてルーティング作るかも、もしくは単独。後日。
    end
  end
end

