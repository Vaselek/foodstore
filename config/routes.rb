Rails.application.routes.draw do
  
  root 'shops#index'
  resources :carts
  resources :dishes
  resources :shops

  resources :dishes do
    resources :dish_carts, only: :create
  end

  resources :dish_carts, only: :destroy
  
  resources :dish_carts do
    member do 
      get 'destroy_all'
    end
  end
  ActiveAdmin.routes(self)
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
