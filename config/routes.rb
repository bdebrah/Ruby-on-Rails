Rails.application.routes.draw do
  resources :quantities
  resources :reviews
  get 'payment_notification/create'

  resources :ratings
  get 'products/phones'

  get 'products/headphones'

  get 'products/chargers'

  resources :items
  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  get 'navbar/home'

  get 'navbar/login'

  get 'navbar/products'

  get 'navbar/contact'
  
  get 'navbar/cart'

  root 'navbar#home'
  
  get '/signup',  to: 'users#new'
  post'/signup',  to: 'users#create'     

  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  match 'items/:id/purchase', :to => 'items#purchase', :as => 'item_purchase', :via => :post
  match 'items/:id/cancel', :to => 'items#cancel', :as => 'item_cancel', :via => :post
  match 'items/:id', :to => 'ratings#create', :via => :post
  
  resources :payment_notification, only: [:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
