Rails.application.routes.draw do
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users
  #resources :sessions, only: [:new, :create, :destroy]
  # resources :users, only: [:show, :create, :new]
  #resources :registrations, only: [:new, :create]
  resources :sites
  resources :sites, only: [:index, :new, :create] do 
    resources :tasks
  end
  resources :orders, only: [:show, :create]
  root 'welcome#home'
  get '/auth/facebook/callback' => 'sessions#create2'
  resources :sessions
end
