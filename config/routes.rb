Rails.application.routes.draw do
  resources :cosmetics
  resources :category
  resources :cart, only: %i[create destroy]
  devise_for :customers
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "cosmetics#index"
end
