Aboveall::Application.routes.draw do
  root to: 'pages#home'
  get 'pages/about', as: 'about'

  resources :products
  resources :carts, only: [:show, :update]
  resources :orders, only: [:new, :create, :show]
  resources :product_line_items, only: [:create, :update, :destroy]
  resources :payments, only: [:update]

  namespace :admin do
    resources :users, only: [:index, :edit, :update] do
      member do
        put :authorize
      end
    end
    resources :orders, only: [:index, :show, :edit, :update]
  end

  devise_for :users, controllers: { registrations: "registrations" }
end
