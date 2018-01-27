Rails.application.routes.draw do
  get  '/signup',     to: 'users#new'
  post '/signup',     to: 'users#create'
  get    '/login',    to: 'sessions#new'  #cRud = 'GET login to READ sessions#new form & controller'
  post   '/login',    to: 'sessions#create'#Crud = 'Post login page to Create sessions#create controller'
  delete '/logout',   to: 'sessions#destroy'
  resources :orders, only: [:index, :new, :create] 
  resources :sites, only: [:index, :new, :create]
  # resources :sitetasks, only: [:show, :create]
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
