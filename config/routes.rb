Rails.application.routes.draw do
  
  devise_for :users, :controllers => {
    :registrations => "users/registrations",
    :sessions => "users/sessions",
    :passwords => "users/passwords",
    :confirmations => "users/confirmations" }
  devise_scope :users do 
    get 'signup', to: 'users/registrations#new'
    get 'signin', to: 'users/sessions#new'
    get 'signout', to: 'users/sessions#destroy'
  end
  
  resources :ingredients
  resources :recipes
  
  root to: 'home#index'
  get '/about', to: 'home#about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
