Rails.application.routes.draw do

  get '/team', to: 'static_pages#team'
  get '/contact', to: 'static_pages#contact'
  root 'gossips#index'
  
  resources :gossips do 
    resources :comments
    resources :likes
  end
  resources :users
  resources :cities
  resources :sessions, only: [:new, :create, :destroy]
end
