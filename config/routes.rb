Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]

  root to: 'sessions#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
end
