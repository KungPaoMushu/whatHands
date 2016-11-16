Rails.application.routes.draw do
  devise_for :users
  resources :recipes
  resources :comments
  root "pages#show", page: "home"
  root "pages#show", page: "about"
  root "pages#show", page: "contact"

  get "/pages/:page" => "pages#show"
  
  root "recipes#index"

  
end
