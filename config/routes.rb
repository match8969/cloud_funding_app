Rails.application.routes.draw do
  
  namespace :admin do
    resources :products
  end
  
  # get 'products/index'
  # get 'products/show'

  root :to => "products#index"
  
  resources :products
  resources :categories
  resources :investments
  
  
  devise_for :users, controllers: {
                      registrations: 'users/registrations',
                      passwords: 'users/passwords',
                      sessions: 'users/sessions',
                      omniauth_callbacks: 'users/omniauth_callbacks',
                      confirmations: "users/confirmations"}
  
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  # Development 
  if Rails.env.development?
    # Confirmation Mail
    mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end
  
  
end
