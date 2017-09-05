Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',    
    registrations: 'admins/registrations'
  }

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',    
    registrations: 'users/registrations'
  }

  root 'shop#top'

  get 'shop/top'

  get 'admin_home/top'

  namespace :accounts do
    get :admin_index
    get :user_index
  end

  resources :categories

  resources :products do
    resources :product_images, only:[:create, :destroy, :update]
  end

  resources :carts, only:[:show]

  resources :cart_products, only:[:create, :destroy]
  patch 'cart_products/:id/status_change', to: 'cart_products#status_change', as: :status_change

  resources :orders, only:[:index, :show, :new, :create]

  resources :user_infos, only: [:show, :new, :create, :edit, :update]

end
