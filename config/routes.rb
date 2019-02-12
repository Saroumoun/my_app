Rails.application.routes.draw do

  get '/team', to: 'static_pages#team'
  get '/contact', to: 'static_pages#contact'
  root 'gossips#index'
  
  resources :gossips do 
    resources :comments
  end
  resources :users
  resources :cities
end
