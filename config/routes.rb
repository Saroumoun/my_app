Rails.application.routes.draw do

  get '/team', to: 'static_pages#team'
  get '/contact', to: 'static_pages#contact'
  root 'gossips#index'
  
  # get 'gossips/index'
  # get 'gossips/show'
  # get 'gossips/new'
  # get 'gossips/create'
  # get 'gossips/edit'
  # get 'gossips/update'
  # get 'gossips/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :gossips
  resources :users
end
