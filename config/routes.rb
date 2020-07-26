Rails.application.routes.draw do
  get '/users/new', to: 'users#home'
  post '/users/create', to: 'users#create'
  get '/users/:id', to: 'users#show'
  resources :attractions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
