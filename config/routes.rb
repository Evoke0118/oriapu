Rails.application.routes.draw do
  get 'users/index'
  get 'user/index'
  get 'totonous/index'
  devise_for :users
  root to: "users#index"
  # root to: "totonous#index"
  resources :users, only: [:index, :new] do
  end
end
