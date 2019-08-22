Rails.application.routes.draw do
  root 'products#index'

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  
  resources :products, only:[:new, :show, :edit, :create, :update,:destroy] do
    collection do
      get 'search'
    end
    member do
      resources :comments, only: [:create]
      get 'confirm'
      post 'pay'
      get 'pay_done'
    end
  end

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
      get 'identification'

      resources :credit_cards, only: [:index, :new, :create, :destroy]
    end
  end
  resources :users, only: [:edit,:update] 
end

