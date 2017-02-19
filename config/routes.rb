Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]

  root to: 'sessions#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  namespace :admin do
    resources :users, only: [:index]
  end

  namespace :admin do
    resources :robots, only: [:new, :index, :create, :edit, :update]
  end

  get '/robots', to: 'robots#index'
end
