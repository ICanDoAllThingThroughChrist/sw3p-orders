Rails.application.routes.draw do
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :sites, only: [:index, :new, :create]
  resources :orders, only: [:show, :create]
  root 'welcome#home'
  get '/auth/facebook/callback' => 'sessions#create2'
  resources :sessions
  resources :users, only: [:show] do 
    resources :tasks, only:[:show, :index]
  end 
end
