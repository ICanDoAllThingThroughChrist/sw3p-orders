Rails.application.routes.draw do
  # get '/login' => 'sessions#new'
  # post '/login' => 'sessions#create2'
  # post '/logout' => 'sessions#destroy'
  # resources :users, only: [:show, :create, :new]
  resources :registrations, only: [:new, :create]
  resources :sites
  resources :sites, only: [:index, :new, :create] do 
    resources :tasks
  end
  resources :orders, only: [:show, :create]
  root 'welcome#home'
  get '/auth/facebook/callback' => 'sessions#create'
  resources :users
  resources :sessions
end
