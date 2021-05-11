Rails.application.routes.draw do
  root to: 'welcome#index'

  resources :sessions, only: [:create]
  resources :users, only: [:create]

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/dashboard', to: 'users#show'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

end
