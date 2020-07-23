Rails.application.routes.draw do
  root 'application#home'
  resources :rides
  resources :attractions
  resources :users
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  post 'attractions/:id', to: 'attractions#ride'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
