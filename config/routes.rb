Rails.application.routes.draw do
  get 'rides/new'
  get 'rides/create'
  get 'rides/show'
  get 'rides/edit'
  get 'rides/update'
  get 'rides/delete'
  get 'attractions/index'
  get 'welcome/home'
  # get 'users/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: %i[ index new create show]
  resources :attractions, only: %i[index new create show edit update delete]
  resources :rides, only: %i[create]
  get '/signin', to: 'sessions#signin'
  post '/create', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  root 'welcome#home'
end
