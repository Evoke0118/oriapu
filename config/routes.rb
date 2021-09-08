Rails.application.routes.draw do
  devise_for :users
  root to: "totonous#index"
  resources :totonous, only: [:index, :new, :create] do
    resources :comments, only: [:create]
  end
  #resources :users, only: :show
end

