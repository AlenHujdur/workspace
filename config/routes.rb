Rails.application.routes.draw do

  #devise_for :chefs, ActiveAdmin::Devise.config
  #ActiveAdmin.routes(self)
  #root 'pages#home'
  root 'pages#test'
  #root :to => 'pages#welcome'
  get '/home', to: 'pages#home'
  get '/index', to: 'pages#index'
  get '/new', to: 'pages#new'
  #get '/welcome', to: 'pages#welcome'
  
  
  resources :recipes do
    member do
      post 'like'
    end
  end

  resources :chefs, except: [:new, :destroy]

  get '/register', to: 'chefs#new'
  get '/newcontributor', to: 'chefs#new_contributor'
  get '/newguest', to: 'chefs#new_guest'
  get '/delete', to: "chefs#destroy"
  
  get '/login', to: "logins#new"
  post '/login', to: "logins#create"
  get '/logout', to: "logins#destroy"
  
  resources :pages
  resources :styles#, only: [:new, :create, :show, :destroy]
  resources :ingredients#, only: [:new, :create, :show, :destroy]
  resources :allergens#, only: [:new, :create, :show, :destroy]

end
