Rails.application.routes.draw do
  
  resources :messages
  resources :message_groups
  namespace :administer do
    resources :investments, only: [:index] do
      collection do
        get 'report'
      end
    end

    resources :categories
  end
  
  namespace :admin do
    resources :products do
      collection do
        get 'achieve'
      end
    end
  end
  
  root :to => "products#index"
  
  resources :products, only: [:index, :show] do
    resources :likes, only: [:create, :destroy]
    collection do
      get 'achieve'
    end
  end
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
