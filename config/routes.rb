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

  root 'user_home#top'

  get 'user_home/top'

  get 'admin_home/top'

  namespace :accounts do
    get :admin_index
    get :user_index
  end

  resources :categories

  resources :products do
    resources :product_images, only:[:create, :destroy, :update]
  end

end
