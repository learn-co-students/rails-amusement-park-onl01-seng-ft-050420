Rails.application.routes.draw do
  root 'users#home'
  #get '/users/homepage', to: 'users#home'
  get '/signin', to: 'sessions#new'
 # get '/users/new', to: 'users#new'
 # post '/users', to: 'users#create'
  #get '/users/:id', to: 'users#show', as: 'user'
  #get '/attractions/new', to: 'attractions#new'
  #post '/attractions', to: 'attractions#create'
  #get '/attractions', to: 'attractions#index'
  #get '/attractions/:id', to: 'attractions#show'
  get '/sessions/:id', to: 'sessions#destroy'
  post '/signin', to: 'sessions#create'
  resources :rides, only:[:create]
  #get '/admin', to: 'users#new'
  resources :attractions
  resources :users
  #For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  
end
