Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]

  root to: 'sessions#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  namespace :admin do
    resources :users, only: [:index, :new, :create]
  end

  namespace :admin do
    resources :robots, only: [:new, :index, :create, :edit, :update, :destroy]
  end

  get '/robots', to: 'robots#index'
  put '/users/purchase', to: 'users#purchase'
end
