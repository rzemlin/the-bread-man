Rails.application.routes.draw do
  
  devise_for :user, :controllers => {
    :registrations => "user/registrations",
    :sessions => "user/sessions",
    :passwords => "user/passwords",
    :confirmations => "user/confirmations" }
  devise_scope :user do 
    get 'signup', to: 'user/registrations#new'
    get 'signin', to: 'user/sessions#new'
    get 'signout', to: 'user/sessions#destroy'
  end
  
  resources :ingredients
  resources :recipes
  
  root to: 'home#index'
  get '/about', to: 'home#about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
