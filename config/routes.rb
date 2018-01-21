Rails.application.routes.draw do
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :sites, only: [:index, :new, :create]
  resources :sitetasks, only: [:show, :create]
  root 'welcome#home'
  get '/auth/facebook/callback' => 'sessions#create2'
  resources :sessions
  resources :users, only: [:show, :index, :new] 
  # do 
  #   resources :tasks, only:[:show, :index, :new, :edit]
  # end 
  namespace :admin do
    resources :stats, only: [:index]
  end
end
