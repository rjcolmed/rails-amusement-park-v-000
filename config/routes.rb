Rails.application.routes.draw do
  root 'welcome#home'

  resources :sessions, only: [:create]

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'

  get '/signout', to: 'sessions#destroy'

  resources :users

  resources :attractions
  resources :rides


end