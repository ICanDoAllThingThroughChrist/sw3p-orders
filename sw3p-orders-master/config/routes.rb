Rails.application.routes.draw do
  get  '/signup',     to: 'users#new'
  post '/signup',     to: 'users#create'
  get    '/login',    to: 'sessions#new'  #cRud = 'GET login to READ sessions#new form & controller'
  post   '/login',    to: 'sessions#create'#Crud = 'Post data from login page to Create new record'
  delete '/logout',   to: 'sessions#destroy'
  resources :sites, only: [:index, :new, :create, :show] do 
    resources :orders, only: [:index, :new, :create] 
  end
  # resources :sitetasks, only: [:show, :create]
  root 'welcome#home'
  get '/auth/facebook/callback' => 'sessions#create2'
  resources :sessions
  resources :users, only: [:show, :index, :new] 
  # resources :users, only: [:show] do
  #   # nested resource for posts
  #   resources :orders, only: [:index, :show, :new, :create, :edit, :update]
  # end
  # do 
  #   resources :tasks, only:[:show, :index, :new, :edit]
  # end 
  namespace :admin do
    resources :stats, only: [:index]
  end
end
