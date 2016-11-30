Rails.application.routes.draw do

  root 'pages#home'
 get  '/help',    to: 'pages#help'
  get  '/about',   to: 'pages#about'
  get  '/contact', to: 'pages#contact'

  get '/signup' , to:'users#new'

  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'

  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'

  resources :users

  resources :entries #, only: [:create,:destroy]

  resources :users do
  	member do
  		get :following, :followers
  	end
  end

  resources :relationships,       only: [:create, :destroy]

  resources :comments

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
