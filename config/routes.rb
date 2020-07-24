Rails.application.routes.draw do
  resources :rides, only: [:create]
  resources :attractions
  get '/signin', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'
  resources :sessions, only: [:create]

  resources :users, only: [:new, :create, :show]
  root 'welcome#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
