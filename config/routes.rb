Rails.application.routes.draw do
  devise_for :users
  resources :posts

  # root path shows all posts
  root "posts#index"
end

