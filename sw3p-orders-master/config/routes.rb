Rails.application.routes.draw do
  get  '/signup',     to: 'users#new'
  post '/signup',     to: 'users#create'
  get    '/login/',   to: 'sessions#new'  #cRud = 'GET login to READ sessions#new form & controller'
  post   '/login',    to: 'sessions#create'#Crud = 'Post data from login page to Create new record'
  delete '/logout',   to: 'sessions#destroy'
  post "sites/:id/orders/:id", to: 'orders#update'
  resources :sites, only: [:index, :new, :create, :show] do 
    resources :orders,only: [:new, :create, :show, :index, :edit, :update, :add_comment, :add_some_comments] 
  end
  resources :sites, only: [:index, :new, :create, :show] do 
    resources :tasks,only: [:new, :create, :show, :index, :edit, :update] 
  end
  # resources :order, only: [:create, :update] do 
  #   resources :comments
  # end
  # post '/sites/:id/orders/:id/edit' => "orders#update"
  # patch '/sites/:id/orders'         => 'orders#update'
  get '/sites/:id/orders/:id'       => 'orders#add_comment'
  resources :orders#, only: [:edit, :update, :add_comment, :add_some_comments] 
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
