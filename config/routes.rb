Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'
  resources :posts do
    resources :comments
    #Comments are only avaliable inside posts (hence do)
  end

  get 'login' => 'user_sessions#new'
  post 'login' => 'user_session#create'
  delete 'logout' => 'user_sessions#destroy'

  #root 'posts#index'
  #home page is the post page, no longer needs localhost:3000/posts,
  #defaults to posts at localhost:3000
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
