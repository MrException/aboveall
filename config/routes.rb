Aboveall::Application.routes.draw do
  root :to => 'pages#home'
  get 'pages/about', :as => 'about'

  resources :products
  resources :carts, :only => [:show, :update]
  resources :orders, :only => [:new, :create]
  resources :product_line_items, :only => [:create, :update, :destroy]

  namespace :admin do
    resources :users, :only => [:index, :edit, :update]
    # resources :orders
  end

  devise_for :users
end
