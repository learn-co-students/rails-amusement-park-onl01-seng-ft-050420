Rails.application.routes.draw do
  root 'welcome#home'

  
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  delete '/logout' => 'sessions#destroy'
  
  resources :attractions
  resources :users
  resources :rides 





end
