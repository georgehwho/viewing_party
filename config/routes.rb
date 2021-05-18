Rails.application.routes.draw do
  root to: 'sessions#new'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/dashboard', to: 'users#show'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :movies, only: [:index, :show]
  get '/discover', to: 'movies#discover'

  resources :viewing_party, only: [:new, :create]

  post '/add_friend', to: 'friends#create'
end
