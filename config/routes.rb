Rails.application.routes.draw do
  root to: 'sessions#new'

  resources :sessions, only: [:create]
  resources :users, only: [:create]

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/dashboard', to: 'users#show'

  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :movies, only: [:index, :show]
  get '/discover', to: 'movies#discover'
end
