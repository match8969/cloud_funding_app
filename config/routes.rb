Rails.application.routes.draw do
  root :to => "products#index"
  
  resources :products
  
  
  devise_for :users, controllers: {
                      registrations: 'users/registrations',
                      passwords: 'users/passwords',
                      sessions: 'users/sessions',
                      omniauth_callbacks: 'users/omniauth_callbacks',
                      confirmations: "users/confirmations"}
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  
  # TODO: routes の設定
  
  
end
