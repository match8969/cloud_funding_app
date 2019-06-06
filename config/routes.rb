Rails.application.routes.draw do

  namespace :admin do
    get 'notifications/index'
  end

  concern :paginatable do
    get '(page/:page)', action: :index, on: :collection, as: ''
  end
  
  resources :messages, concerns: :paginatable
  resources :message_groups, concerns: :paginatable
  namespace :administer do
    resources :investments, only: [:index], concerns: :paginatable do
      collection do
        get 'report'
      end
    end

    resources :categories, concerns: :paginatable
  end
  
  namespace :admin do
    resources :products, concerns: :paginatable
  end

  resource  :notifications, only: [:index], concerns: :paginatable
  
  root :to => "products#index"
  
  resources :products, only: [:index, :show], concerns: :paginatable do
    resources :likes, only: [:create, :destroy]
  end
  resources :investments, concerns: :paginatable
  
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
