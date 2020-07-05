Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static#home' 
  
  resources :users
  resources :session
  resources :attractions
  
  get '/signin', to: 'session#new'
  get '/logout', to: 'session#delete'
end
