Rails.application.routes.draw do
  resources :attractions
  resources :rides, only: [:create]
  resources :users
  resources :sessions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'users#home'
  get '/signup', to: 'users#new'
  get '/signin', to: 'sessions#new'
end
