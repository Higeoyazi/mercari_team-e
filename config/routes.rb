Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  resources :products, only:[:new, :show, :edit, :create, :update,:destroy] do
    collection do
      get 'end'
      get 'search'
    end
    member do
      get 'preview'
      get 'confirm'
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

  root 'products#index'
  get "mypages/profile", to:"mypages#profile"
  get "mypages/logout", to:"mypages#logout"
  get "mypages/edition", to: "mypages#edition"
  get "mypages/identification", to: "mypages#identification"
end
