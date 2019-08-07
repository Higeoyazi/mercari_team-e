Rails.application.routes.draw do
  devise_for :users, controllers: 
  {registrations: 'users/registrations',
   omniauth_callbacks: 'users/omniauth_callbacks'}
  
  root 'tweets#index'
end
