Rails.application.routes.draw do
  devise_for :users
  resources :recipes
  resources :comments
  root "recipes#index"

  
end
